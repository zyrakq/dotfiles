## Instructions for Adding New Packages, Environment Variables, and Files

### 1. Adding New Packages to `global.toml`
1. Find the section corresponding to your package or create a new one.
2. Add the package dependencies to the `depends` section, if any.
3. Specify the files that should be linked with the package in the `files` section.
4. If the package requires variables, add them to the `variables` section.

Example:
```toml
[new-package]
depends = ["zsh"]
files = { "path/to/file" = "~/.target_file" }
variables = { var_name = "value" }
```

### 2. Configuring a Profile in `local.toml` or `<hostname>.toml`
1. Ensure that the `local.toml` file exists, or create it.
2. If `local.toml` is missing, Dotter will automatically use the `<hostname>.toml` file, where `<hostname>` is the hostname of your machine.
3. Specify which packages should be enabled for the current profile.

Example:
```toml
[packages]
enabled = ["zsh", "new-package"]
```

### 3. Deploying with the Current Profile
1. Run the deploy command:
   ```bash
   ./dotter
   ```
2. Dotter will automatically select `local.toml` or `<hostname>.toml` depending on the available files.

### 4. Adding Commands for Installers
Commands for package managers (installers) are defined in `.toml` files under the `commands` section. For example:
```toml
[shell.variables.installers.pacman.commands]
install = "sudo pacman -Syu"
uninstall = "sudo pacman -Rns"
```

### 5. Using Binaries
The project includes the binaries `./dotter` and `./dotter.arm`, which allow you to execute commands without installing Dotter.

### Useful Links
- [Dotter Wiki](https://github.com/SuperCuber/dotter/wiki)
- [Handlebars Guide](https://handlebarsjs.com/guide)
- [Rhai Documentation](https://github.com/rhaiscript/rhai)

