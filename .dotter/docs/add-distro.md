# Instructions for Adding a New Distribution

This guide describes the steps to add a new type of distribution to the dotfiles configuration.

## 1. Create a Configuration File for the Distribution
1. Navigate to the `includes` folder:
   ```bash
   cd /config/.dotfiles/.dotter/includes
   ```
2. Create a new file `<distro>.toml`, where `<distro>` is the name of your distribution. For example:
   ```bash
   touch ubuntu.toml
   ```

## 2. Define Commands and Packages
In the `<distro>.toml` file, specify the commands for installing packages and the list of packages. Example for Ubuntu:
```toml
[shell.variables.installers.apt]
commands = { install = "sudo apt update && sudo apt install -y" }
packages = [
    "zsh",
    "zsh-autosuggestions",
    "zsh-syntax-highlighting",
    "powerline",
]
```

## 3. Update `local.toml` or `<hostname>.toml`
Add the new distribution to the `includes` section:
```toml
includes = [".dotter/includes/ubuntu.toml"]

packages = ["oh-my-zsh-git"]

[variables]
managers = ["apt"]
```

## 4. Verify the Configuration
1. Run the deploy command:
   ```bash
   ./dotter
   ```
2. Ensure that all packages are installed correctly.

## 5. Testing
1. Verify that all dependencies and files are configured properly.
2. Ensure that the installation commands work on your distribution.

## Example Final File
Example file for Fedora:
```toml
[shell.variables.installers.dnf]
commands = { install = "sudo dnf install -y" }
packages = [
    "zsh",
    "zsh-autosuggestions",
    "zsh-syntax-highlighting",
    "powerline",
]
```

## Useful Links
- [Dotter Wiki](https://github.com/SuperCuber/dotter/wiki)
- [Handlebars Guide](https://handlebarsjs.com/guide)
- [Rhai Documentation](https://github.com/rhaiscript/rhai)

