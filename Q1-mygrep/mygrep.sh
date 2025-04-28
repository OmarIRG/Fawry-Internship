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
