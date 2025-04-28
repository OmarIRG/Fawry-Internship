# 🚀 Fawry Internship Task Solutions

> **Note:**  
> Each question's solution is organized inside its own folder.

Hello! 👋  
This repository contains my solutions for the two technical tasks provided during the Fawry Internship application.  
I approached each problem carefully, focusing on clean scripting, clear troubleshooting steps, and thorough validation.

---

## 📄 Q1: Custom Command - `mygrep.sh`

In this task, I built a **mini version of the `grep` command** using Bash scripting.  
The script `mygrep.sh` supports:

- Searching for a string (case-insensitive).
- Printing matching lines from a text file.
- Showing line numbers with the `-n` option.
- Inverting matches (show non-matching lines) with the `-v` option.
- Supporting combinations like `-vn` or `-nv`.

✅ I also handled error cases like missing arguments or invalid files, and tested the script with a sample `testfile.txt`.  
You'll find inside the folder:

- The `mygrep.sh` script (executable).
- `testfile.txt` for testing.
- Screenshots showing the script in action.
- A reflection section where I discuss how the script processes arguments, challenges I faced, and how I would expand it to support more features like regex.

---

## 📄 Q2: Troubleshooting Scenario - `internal.example.com`

This task focused on **troubleshooting a DNS and service reachability problem**.  
I worked through a real-world scenario where an internal dashboard (`internal.example.com`) became unreachable.

The steps I followed:

1. **DNS Resolution Testing**: Checked local DNS settings and compared them with public DNS (Google 8.8.8.8).
2. **Service Reachability**: Used tools like `curl`, `ping`, `telnet`, and `ss` to check the service.
3. **Problem Root Cause Analysis**: Listed all possible reasons behind the issue (DNS misconfigurations, firewall rules, service downtime, etc.).
4. **Fixes and Verification**: For each potential cause, I explained how to confirm it and how to fix it using Linux commands.

✅ The folder includes full troubleshooting steps, Linux commands, screenshots of the process, and bonus parts like bypassing DNS temporarily using `/etc/hosts`.

---

## 📸 Screenshots

Throughout both tasks, I made sure to capture my terminal outputs at every important step to clearly demonstrate and validate my solutions.

---

## ✅ Final Notes

I enjoyed working on these tasks as they combine practical Linux skills with problem-solving, which are essential in real-world DevOps and system administration roles.  
Thanks for reviewing my work!

---

