# Using Rhai for Template Extension

## 1. Writing a Rhai Script
[Rhai](https://github.com/rhaiscript/rhai) scripts allow adding logic to the deployment process. The script should be saved in the folder specified in `global.toml`, for example:
```toml
[helpers]
install = ".dotter/helpers/install.rhai"
```

Example of the `install.rhai` script:
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
install = ".dotter/helpers/install.rhai"
```

## 3. Using the Script in a Template
Templates can call functions from connected scripts. For example, in `install.sh`:
```handlebars
function install() {
    {{#each managers as |installer_name|}}
        {{install installer_name ../installers ../dotter.packages}}
    {{/each}}
}
```

## 4. Embedding Commands in the Deployment Process
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

## 5. Example of the Final Process
1. The `install.rhai` script generates commands for installing packages.
2. The `install.sh` template calls functions from `install.rhai`.
3. The template is rendered into `.dotter/pre_deploy.sh`.
4. The final script is executed, embedding commands into the deployment process.

## Using Binaries
The project includes binaries `./dotter` and `./dotter.arm`, which allow executing commands without installing Dotter. For example:
```bash
./dotter deploy
```

## Useful Links
- [Rhai Documentation](https://github.com/rhaiscript/rhai)
- [Dotter Wiki](https://github.com/SuperCuber/dotter/wiki)
