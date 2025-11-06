#!/usr/bin/env bash
# Compare two folders (non-recursive) and show colored output.
# Opens diffs for changed files in VS Code, excluding certain files.

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <folder1> <folder2>"
    exit 1
fi

folder1="$1"
folder2="$2"

# Ensure both arguments are directories
if [ ! -d "$folder1" ] || [ ! -d "$folder2" ]; then
    echo "Both arguments must be existing directories."
    exit 1
fi

# ANSI color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RESET='\033[0m'

# Exclusion list (filenames only, not paths)
EXCLUDES=("data.json" "komplettering.txt" "message.txt")

# Function to check if file should be excluded
is_excluded() {
    local filename
    filename="$(basename "$1")"
    for ex in "${EXCLUDES[@]}"; do
        if [[ "$filename" == "$ex" ]]; then
            return 0
        fi
    done
    return 1
}

# Get list of files (top level only)
mapfile -t files1 < <(cd "$folder1" && find . -maxdepth 1 -type f | sort)
mapfile -t files2 < <(cd "$folder2" && find . -maxdepth 1 -type f | sort)

# Union of all filenames
all_files=($(printf "%s\n" "${files1[@]}" "${files2[@]}" | sort -u))

for rel_path in "${all_files[@]}"; do
    # Skip excluded files
    if is_excluded "$rel_path"; then
        continue
    fi

    file1="$folder1/$rel_path"
    file2="$folder2/$rel_path"

    if [ -f "$file1" ] && [ -f "$file2" ]; then
        # Both exist → check for differences
        if ! cmp -s "$file1" "$file2"; then
            echo -e "${YELLOW}Modified:${RESET} $rel_path"
            code -r --diff "$file1" "$file2" &
        fi
    elif [ -f "$file1" ]; then
        echo -e "${RED}Removed:${RESET} $rel_path"
    elif [ -f "$file2" ]; then
        echo -e "${GREEN}Added:${RESET}   $rel_path"
    fi
done

wait

