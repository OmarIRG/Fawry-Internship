
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

## 🧠 Reflective Section
- **Handling Arguments and Options**  
  The script uses **`getopts`** to handle various command-line options like `-n`, `-v`, `-c`, and `-l`. The `getopts` loop parses these options and sets appropriate flags. Once all options are parsed, the script then processes the arguments for the search string and the filename, ensuring proper validation is performed. Invalid or missing arguments prompt an error and display the help message.

- **Supporting Regex or `-i/-c/-l` Options**  
  If I were to extend this script to support **regular expressions (regex)** or the **`-i` (case-insensitive)**, **`-c` (count matches)**, and **`-l` (print filenames)** options, the overall structure would change slightly. Regex would require adding functionality to handle pattern matching beyond simple substring matching, which might involve using tools like `sed` or `grep` for more advanced pattern recognition. For `-i`, we could modify the `search_in_line` function to ignore case sensitivity when comparing strings. The `-c` and `-l` options could be supported by adding counters and conditionals to print counts or filenames when needed.

- **Most Difficult Part**  
  The most challenging part of implementing this script was handling **`getopts`**. It's crucial to ensure that each option works as expected in combination with others, and managing the flags for each option can get tricky. Moreover, dealing with shifting arguments correctly and ensuring the script works smoothly when multiple options are provided in various combinations required careful attention to detail.

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

