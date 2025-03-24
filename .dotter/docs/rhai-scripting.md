# Using Rhai for Template Extension

## 1. Writing a Rhai Script
[Rhai](https://github.com/rhaiscript/rhai) scripts allow adding logic to the deployment process. The script should be saved in the folder specified in `global.toml`, for example:
```toml
[helpers]
package_installer = ".dotter/helpers/package-installer.rhai"
```

Example of the `package-installer.rhai` script:
```rhai
fn get_install_command(installer_name, installers, packages) {
    if installers.contains(installer_name) {
        let installer = installers[installer_name];
        if installer.contains("commands") && installer.commands.contains("install") {
            let command = installer.commands.install;
            if !command.is_empty() {
                let installer_packages = installer.packages;
                let packages_to_install = packages.filter(|pkg| installer_packages.contains(pkg));
                if packages_to_install.len() > 0 {
                    let packages_str = "";
                    for pkg in packages_to_install {
                        if !pkg.is_empty() {
                            packages_str += " " + pkg;
                        }
                    }
                    return command + packages_str;
                }
            }
        }
    }
    return "";
}
```

## 2. Connecting the Script
The script is connected via the `helpers` section in `global.toml`. For example:
```toml
[helpers]
package_installer = ".dotter/helpers/package-installer.rhai"
```

## 3. Using the Script in a Template
Templates can call functions from connected scripts. For example, in `install.sh`:
```handlebars
function install() {
    {{#if install}}
        {{#each managers as |installer_name|}}
            {{package_installer installer_name ../installers ../dotter.packages}}
        {{/each}}
    {{/if}}
}
```

## 4. Environment Variables in `global.toml`
Environment variables that are required for deployment should be added to the `shell` package, as it is an abstraction available for all shells:
```toml
[shell.variables]
install = true
```

### Notes:
1. The `../` prefix is only required inside a `#each` block to access the outer context. Outside of `#each`, it is unnecessary.
2. Variables from `variables` are accessible by their names directly. For example, use `install` instead of `variables.install`.
3. The structure of the `each` block should remain unchanged when iterating over lists.

## 5. Embedding Commands in the Deployment Process
Dotter supports hooks for executing commands before or after deployment. These files are rendered as templates, allowing the use of logic and variables.

### Example Usage
1. Create a file `.dotter/pre_deploy.sh`:
   ```bash
   #!/bin/bash
   {{include_template ".dotter/scripts/install.sh"}}

   install
   ```
2. This file will be rendered to `.dotter/cache/.dotter/pre_deploy.sh` and executed before deployment.

### Available Hooks
- Before deployment: `.dotter/pre_deploy.sh`
- After deployment: `.dotter/post_deploy.sh`
- Before removal: `.dotter/pre_undeploy.sh`
- After removal: `.dotter/post_undeploy.sh`

## 6. Example of the Final Process
1. The `package-installer.rhai` script generates commands for installing packages.
2. The `install.sh` template calls functions from `package-installer.rhai`.
3. The template is rendered into `.dotter/pre_deploy.sh`.
4. The final script is executed, embedding commands into the deployment process.

## Using Binaries
The project includes binaries `./dotter` and `./dotter.arm`, which allow executing commands without installing Dotter. For example:
```bash
./dotter deploy
```

## Handlebars and Rhai
- **Handlebars**: A templating engine used for generating deployment scripts. It supports features like conditional logic (`#if`, `#each`) and variable interpolation.
- **Rhai**: A lightweight scripting language used for adding logic to templates. It is integrated into Dotter to handle complex operations during deployment.

## Useful Links
- [Rhai Documentation](https://github.com/rhaiscript/rhai)
- [Dotter Wiki](https://github.com/SuperCuber/dotter/wiki)