
# 🛠️ MyGrep - Mini Grep Command

## 📄 Description

**MyGrep** (`mygrep.sh`) is a Bash script that simulates a mini version of the `grep` command.  
It allows you to search for a string inside a text file with options such as:

- Case-insensitive search
- Display line numbers (`-n`)
- Invert match (show non-matching lines) (`-v`)
- Count matching lines only (`-c`)
- Print filename if a match is found (`-l`)

Built with Bash and includes robust error handling.

---

## 🚀 How to Run

1. **Make the script executable:**

```bash
chmod +x mygrep.sh
```

2. **Run the script:**

General syntax:

```bash
./mygrep.sh [OPTIONS] SEARCH_STRING FILE
```

### Examples

| Command | Description |
|:--------|:------------|
| `./mygrep.sh hello testfile.txt` | Search for "hello" in the file |
| `./mygrep.sh -n hello testfile.txt` | Search and show line numbers |
| `./mygrep.sh -v hello testfile.txt` | Show lines that do NOT contain "hello" |
| `./mygrep.sh -vn hello testfile.txt` | Invert match and show line numbers |
| `./mygrep.sh --help` | Show help message |

---

## ⚙️ Available Options

| Option | Description |
|:-------|:------------|
| `-n` | Display line numbers with matching lines |
| `-v` | Invert the match (show non-matching lines) |
| `-c` | Display only the count of matching lines |
| `-l` | Display only the filename if a match is found |
| `--help` | Show the usage guide |

---

## 🧪 Test File Content

Testing was performed with `testfile.txt` containing:

```
Hello world
This is a test
another test line
HELLO AGAIN
Don't match this line
Testing one two three
```

---

## 📸 Screenshots of Execution

- `./mygrep.sh hello testfile.txt`
- `./mygrep.sh -n hello testfile.txt`
- `./mygrep.sh -vn hello testfile.txt`
- `./mygrep.sh -v testfile.txt` (expected error if search string missing)

*(Screenshots attached in `Screenshot_Of_Outputs.png`)*

---

## ⚡ Error Handling

- Error if file is missing.
- Error if search string or file name is missing.
- Graceful handling of invalid options.

---

## 👤 Author

- **Name:** Omar Islam Ragab
- **LinkedIn:** [omar-islam-rgb](https://www.linkedin.com/in/omar-islam-rgb)

