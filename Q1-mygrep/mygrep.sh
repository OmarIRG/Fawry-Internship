#!/bin/bash
# ─────────────────────────────────────────────────────
# mygrep.sh - Mini version of grep command
# Author: Omar Islam Ragab
# Description: grep command alternative to Search for a string in a file with options like -n, -v, --help
# ─────────────────────────────────────────────────────


# Function to show help message
_help() {
    
    echo "Usage: $0 [options]"
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
