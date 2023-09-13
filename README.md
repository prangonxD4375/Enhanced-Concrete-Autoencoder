# Automated Git Workflow Scripts

This repository contains two shell scripts that automate certain Git-related tasks: `push_change.sh` and `replace_script.sh`.
Follow the instructions below to use these scripts effectively.

## Prerequisites

Before using these scripts, ensure you have the following prerequisites:

1. [Git](https://git-scm.com/) installed on your system.
2. A configured and authenticated [GitHub](https://github.com/) account.
3. Your Git repository set up and configured properly with the remote repository on GitHub.

## `push_change.sh`

`push_change.sh` automates the process of committing and pushing changes to a specified file in your Git repository.
It also includes error handling to undo the commit if the push to the remote repository fails.

### Usage

1. Clone your Git repository locally if you haven't already:

   ```bash
   git clone <repository_url>
   ```

2. Make changes to the __init__.py file

3. Run the script to automatically commit and push changes:

   ```bash
   ./push_change.sh
   ```

   - If there are no changes in the specified file, the script will exit with a message indicating no changes.
   - If changes are detected, the script will commit the changes with a commit message that includes the diff and the current date/time.
   - It will then attempt to push the changes to the "master" branch on GitHub. If the push succeeds, it will display a success message.
   - If the push fails, the script will display an error message, undo the last commit, and print a message indicating that the commit has been undone.

### Customization

You can customize the script to use a different branch or specify a different file to commit and push changes to by editing the script.

## `replace_script.sh`

`replace_script.sh` is designed to replace a specific file in your system with another file of the same name located in the same directory as the script.

### Usage
1. Make changes to the __init__.py file

2. Run the script:

   ```bash
   ./replace_script.sh
   ```

   - The script will search for the file to replace (`__init__.py` in this case) in the directory where it's located.

   - If the file is found, it will be replaced with the `__init__.py` file located in the same directory as the script.

### Customization

You can customize the script to replace a different file or modify the source file location by editing the script.

## License

These scripts are provided under the [MIT License](LICENSE).

Feel free to modify and use them as needed!

