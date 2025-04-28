
# MyGrep - Mini grep Implementation

## 📄 Overview
This project is a custom implementation of the basic `grep` command called **`mygrep.sh`**.  
It supports searching for a string in a file with useful options like showing line numbers, inverting matches, counting matches, and displaying filenames.

---

## 🚀 How to Run

First, make sure the script is executable:
```bash
chmod +x mygrep.sh
```

Then run it using:
```bash
./mygrep.sh [options] "search_string" filename
```

---

## ⚙️ Options (Using `getopts`)
The script uses **`getopts`** to handle command-line options cleanly and flexibly.

Supported options:
| Option | Description |
|:------:|:------------|
| `-n`   | Show line numbers alongside matching lines. |
| `-v`   | Invert the match (show lines **that do NOT match** the search string). |
| `-c`   | Count the number of matching lines and display the count only. |
| `-l`   | Print the filename if at least one match is found. |
| `--help` | Display a detailed help message showing usage information. |

---

## 🛠️ Internally: How `getopts` Works in This Script

The `getopts` command is used inside `mygrep.sh` to parse options easily:

```bash
while getopts ":nvcl" opt; do
  case $opt in
    n) show_line_number=true ;;
    v) invert_match=true ;;
    c) count_only=true ;;
    l) print_filename=true ;;
    \?)
      echo "Invalid option: -$OPTARG"
      _help
      exit 1
      ;;
  esac
done
shift $((OPTIND-1))
```

- `:` at the start tells `getopts` that options don't take extra arguments.
- `OPTIND` is automatically managed to shift the input arguments after options.

---

## 📸 Example Usage

🔹 Basic search (case-insensitive):
```bash
./mygrep.sh hello testfile.txt
```

🔹 Show line numbers with matches:
```bash
./mygrep.sh -n hello testfile.txt
```

🔹 Invert match and show line numbers:
```bash
./mygrep.sh -vn hello testfile.txt
# OR
./mygrep.sh -nv hello testfile.txt
```

🔹 Invert match only:
```bash
./mygrep.sh -v hello testfile.txt
```

🔹 Count number of matches:
```bash
./mygrep.sh -c hello testfile.txt
```

🔹 Print only filename if matches found:
```bash
./mygrep.sh -l hello testfile.txt
```

🔹 Show help message:
```bash
./mygrep.sh --help
```

---

## 📂 Folder Structure
```
.
├── mygrep.sh                # Main Script
├── testfile.txt              # File for Testing
├── Screenshot_Of_Outputs.png # Test Evidence
└── README.md                 # This Documentation
```

---

## 📢 Notes
- The search is **case-insensitive**.
- The script validates arguments and shows proper errors if something is missing.
- The output mimics standard `grep` behavior as much as possible.

