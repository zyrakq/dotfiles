# Prompt for Deployment Script Tasks

You are an AI programming assistant.  
Your task is to assist with modifying deployment scripts and related configurations.  

## Key Context
1. **Dotter**: The dotfiles manager used in this project. It uses [Handlebars](https://handlebarsjs.com/guide) for templating and [Rhai](https://github.com/rhaiscript/rhai) for scripting.
2. **Deployment Scripts**: Deployment scripts are rendered from templates and executed during the deployment process. They are located in `.dotter/scripts/` and `.dotter/cache/`.
3. **Environment Variables**: Variables are defined in `global.toml` or profile-specific files like `local.toml` or `<hostname>.toml`.
4. **Common Tasks**:
   - Modifying Handlebars templates for deployment scripts.
   - Updating Rhai scripts for logic changes.
   - Adding or modifying environment variables in `.toml` files.
   - Debugging deployment scripts using tools like Bash Debugger.

## Updated Instructions for Copilot
1. **File Identification**:
   - Identify the file(s) to be modified based on the task description.
   - Use the correct filepath in comments for each file.

2. **Handlebars Templates**:
   - Use Handlebars syntax for conditional logic (`#if`, `#each`) and variable interpolation.
   - Ensure proper context handling (e.g., using `../` inside `#each` blocks).
   - Include reusable templates using `{{include_template}}` for modularity.

3. **Rhai Scripts**:
   - Follow Rhai syntax for scripting logic.
   - Ensure compatibility with Dotter's templating and deployment process.
   - Use helper functions for common operations, such as package management.

4. **Environment Variables**:
   - Add or modify variables in the appropriate `.toml` file.
   - Use `[shell.variables]` for global variables or package-specific sections for scoped variables.
   - Ensure variables are properly referenced in scripts and templates.

5. **Debugging**:
   - Provide debugging instructions if the task involves troubleshooting deployment scripts.
   - Use `bash -x` or VSCode's Bash Debugger for analyzing script execution.

6. **Modularity and Reusability**:
   - Leverage reusable components in `.dotter/helpers/` for common logic.
   - Ensure scripts and templates are modular and easy to maintain.

## Example Task
**Task**: Add a new environment variable `DEBUG` to `global.toml` and update the deployment script to use it.

**Response**:
```toml
// filepath: /config/.dotfiles/.dotter/global.toml
[shell.variables]
install = true
uninstall = true
debug = true
```

```bash
// filepath: /config/.dotfiles/.dotter/scripts/install.sh
function install() {
    {{#if debug}}
        echo "Debug mode enabled"
    {{/if}}
    {{#if install}}
        {{#each managers as |installer_name|}}
            echo {{package_installer installer_name ../installers "install" ../dotter.packages}}
        {{/each}}
    {{/if}}
    return 0
}
```