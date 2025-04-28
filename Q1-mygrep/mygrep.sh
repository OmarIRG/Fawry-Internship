#!/bin/bash
# ─────────────────────────────────────────────────────
# mygrep.sh - Mini version of grep command
# Author: Omar Islam Ragab
# Description: grep command alternative to Search for a string in a file with options like -n, -v, --help
# ─────────────────────────────────────────────────────


# Function to show help message
_help() {
    
    echo "Usage: $0 [options] [filename]"
    echo "--------------------------------------------------------"
    echo "Options:"
    echo "  -n    Show line numbers with matching lines."
    echo "  -v    Invert the match (show lines that DO NOT match)."
    echo "  -c    Only count the number of matching lines."
    echo "  -l    Only print filename if a match is found."
    echo "  --help Show this help message."
}


# ─────────────────────────────────────────────────────
# Section 1: Handle --help option early
# ─────────────────────────────────────────────────────
if [[ "$1" == "--help" ]]; then
    _help          # Call help finction
    exit 0	   # Completed successfully (No Error)	
fi


# ─────────────────────────────────────────────────────
# Section 2: Validate minimum arguments
# ─────────────────────────────────────────────────────
if [[ $# -lt 2 ]]; then
    echo "Error: Missing arguments."
    _help
    exit 1
fi


# ─────────────────────────────────────────────────────
# Section 3: Initialize flags for options
# ─────────────────────────────────────────────────────
show_line_number=false  # To track if -n option is used
invert_match=false      # To track if -v option is used
count_only=false        # To track if -c option is used
print_filename=false    # To track if -l option is used



# ─────────────────────────────────────────────────────
# Section 4: Parse options using getopts
# ─────────────────────────────────────────────────────
while getopts ":nvcl" opt; do
  case $opt in
    n) show_line_number=true ;;  # If -n option found, set flag true
    v) invert_match=true ;;      # If -v option found, set flag true
    c) count_only=true ;;        # If -c option found, set flag true
    l) print_filename=true ;;    # If -l option found, set flag true
    \?)
      # Handle invalid option
      echo "Invalid option: -$OPTARG"
      show_help
      exit 1
      ;;
  esac
done


# Crucial part to make it easier after the getopts parse options : shift processed options to get search string and filename 
# OPTIND here is like counter which counts number of options added with the command in one word and it starts with 1 
# So if it was 2 then 2 - 1 will be 1 which will shift arguments by one so that the search-string will be $1 not $2 or $3  anymore so it simplifies the multiple options handling 
# like -n -v for example OPTIND will be 3 then 3 - 1 will be 2 , 2 shifts will make search-string $1 and filename $2 
shift $((OPTIND-1))



# ─────────────────────────────────────────────────────
# Section 5: Assign search_string and filename
# ─────────────────────────────────────────────────────
search_string="$1"      # as mentioned before after shift the search string will be $1 and filename will be $2
file="$2"



# ─────────────────────────────────────────────────────
# Section 6: Validate inputs
# ─────────────────────────────────────────────────────
if [[ -z "$search_string" || -z "$file" ]]; then                     # Both seach-string and filename must be provided as options in while using the command
    echo "Error: Search string and file must be provided."
    show_help
    exit 1
fi

if [[ ! -f "$file" ]]; then                                          # If the user provided the filename but the file doesn't exist
    echo "Error: File '$file' does not exist."
    exit 1
fi




# ─────────────────────────────────────────────────────
# Section 7: Initialize counters and status flags
# ─────────────────────────────────────────────────────
line_number=0         # Keep track of current line number
match_count=0         # Count number of matches (for -c option)
found_match=false     # Track if any match found (for -l option)



# ─────────────────────────────────────────────────────
# Section 8: Define helper functions
# ─────────────────────────────────────────────────────

increment_line_number() {
    ((line_number++))
}

search_in_line() {
    # Make both line and search_string lowercase and compare manually
    local lower_line=$(echo "$line" | tr 'A-Z' 'a-z')
    local lower_search=$(echo "$search_string" | tr 'A-Z' 'a-z')

    [[ "$lower_line" == *"$lower_search"* ]]
}

invert_match_logic() {
    if $invert_match; then
        if $match; then
            match=false
        else
            match=true
        fi
    fi
}

process_matched_line() {
    found_match=true
    ((match_count++))

    if $count_only || $print_filename; then
        return
    fi

    if $show_line_number; then
        echo "${line_number}:$line"
    else
        echo "$line"
    fi
}
