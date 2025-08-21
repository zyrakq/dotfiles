# 🏠 dotfiles

These are my personal dotfiles for deploying and configuring environments on various Linux distributions.

## ✨ Key Features

- 🔧 Uses a dotfiles manager: [Dotter](https://github.com/SuperCuber/dotter).
- 📦 The project includes binaries `./dotter` and `./dotter.arm`, which allow running commands without installing Dotter.
- 🎨 Final files are generated using the [Handlebars](https://handlebarsjs.com/guide) templating engine.
- 📝 Scripts are written in the [Rhai](https://github.com/rhaiscript/rhai) language.
- 🌐 **Multi-OS Support**: Automatic post-installation scripts for different operating systems (Arch, Manjaro, Ubuntu).
- 📋 **Package Management**: Automated package installation and configuration for various distributions.

## 🚀 Usage

### ⚡ Basic Commands

Deploy dotfiles to your system:

```bash
./dotter deploy --force
```

Remove deployed dotfiles:

```bash
./dotter undeploy
```

⚠️ **Note**: The `--force` flag overwrites existing files. Use with caution.

### 🔄 Post-Installation Scripts

The project supports OS-specific post-installation scripts that run automatically after package installation:

**Directory Structure**:

```sh
{package}/
├── {os}/                    # OS-specific scripts
│   ├── post-install.sh     # Runs after package installation
│   └── post-uninstall.sh   # Runs before package removal
├── post-install.sh         # Fallback script for unknown OS
└── post-uninstall.sh       # Fallback script
```

**Supported Operating Systems**:

- 🏛️ **Arch Linux**: Uses `arch/` directory
- 🟢 **Manjaro**: Uses `arch/` directory (same as Arch)
- 🟠 **Ubuntu**: Uses `ubuntu/` directory
- 🔄 **Other**: Uses fallback scripts in root directory

**Example** (`openssh` package):

- 🏛️ Arch/Manjaro: Configures `ssh-agent.service`
- 🟠 Ubuntu: Configures `ssh-agent@$USER.service`
- 🔄 Generic: Attempts both configurations automatically

The OS is automatically detected through configuration variables defined in include files (`.dotter/includes/{os}.toml`).

## 🐳 DevContainer Configurations

The project includes two DevContainer configurations for testing the installation and setup of packages and dotfiles:

1. **🖥️ `arch-kde`**:
   A configuration with a pre-installed graphical environment for testing packages and dotfiles that depend on GUI components.
   **🌐 Access**: The graphical environment is streamed to your browser via `kasmvnc` on ports `3000` and `3001`.

2. **⚫ `arch`**:
   A minimal configuration without a graphical environment, designed for testing setups where the GUI is installed later.
   **🌐 Access**: The terminal is streamed to your browser via `kasmvnc` on ports `3000` and `3001`. You can later configure your graphical environment using this setup.

Each configuration is located in its respective folder under `.devcontainer`:

- 🖥️ `arch-kde`: Contains files for the graphical environment configuration.
- ⚫ `arch`: Contains files for the minimal configuration.

## 📚 Documentation

- 📖 More about Dotter: [Dotter Wiki](https://github.com/SuperCuber/dotter/wiki).

## 🚀 Opening the DevContainer for the First Time

Follow these steps to open the development container in VSCode:

1. **📋 Install Prerequisites**:
   - 🐳 Install [Docker](https://www.docker.com/).
   - 🔌 Install the [VSCode Dev Containers extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers).

2. **📥 Clone the Repository**:

   ```bash
   git clone git@github.com:zeritiq/dotfiles.git
   cd dotfiles
   ```

3. **⚙️ Set Up Environment Variables**:
   - 📄 Copy the example `.env` file from the desired configuration folder:

     ```bash
     cp .devcontainer/arch-kde/.env.example .devcontainer/.env
     ```

     or

     ```bash
     cp .devcontainer/arch/.env.example .devcontainer/.env
     ```

   - ✏️ Modify the `.env` file if necessary.

4. **📂 Open the Project in VSCode**:
   - 📁 Open the repository folder in VSCode.
   - 🔄 When prompted, click "Reopen in Container".

5. **⏳ Wait for the Container to Build**:
   - 🔨 The container will be built and configured automatically.
   - 📦 This includes installing required packages and cloning the repository inside the container.

6. **🎉 Start Working**:
   - ✅ Once the container is ready, you can start working on your project.

For more details on DevContainers, refer to the [VSCode Dev Containers documentation](https://code.visualstudio.com/docs/devcontainers/containers).
