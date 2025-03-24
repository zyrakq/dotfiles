# Dotter Script Debugging Guide

If a script, such as `pre_deploy.sh`, fails after rebuilding, you can use a debugger to analyze the issue.

## 1. Ensure the Script is Rebuilt
Dotter renders the script template into the file `.dotter/cache/.dotter/pre_deploy.sh`. Make sure this file exists and contains the latest version of the script.

## 2. Debugging Setup in VSCode
1. Open the `.vscode/launch.json` file and ensure the configuration for debugging Bash scripts is set up:
    ```jsonc
    // filepath: /config/.dotfiles/.vscode/launch.json
    {
         "version": "0.2.0",
         "configurations": [
              {
                    "type": "bashdb",
                    "request": "launch",
                    "name": "Bash-Debug Pre Deploy",
                    "program": ".dotter/cache/.dotter/pre_deploy.sh"
              }
         ]
    }
    ```

2. If the configuration is missing, add it.

## 3. Start Debugging
1. Open the "Run and Debug" tab in VSCode.
2. Select the `Bash-Debug Pre Deploy` configuration.
3. Click the "Start Debugging" button (or press `F5`).

## 4. Error Analysis
- Use breakpoints to analyze script execution.
- Check variable values and command execution.

## 5. Manual Script Execution
If you want to run the script manually for analysis:
1. Open a terminal.
2. Execute the command:
    ```bash
    bash -x .dotter/cache/.dotter/pre_deploy.sh
    ```
    The `-x` flag enables command execution tracing.

## Useful Links
- [Bash Debugging Guide](https://www.gnu.org/software/bash/manual/html_node/The-Set-Builtin.html)
- [Dotter Wiki](https://github.com/SuperCuber/dotter/wiki)

