# dotfiles

These are my personal dotfiles for deploying and configuring environments on various Linux distributions.

## Key Features
- Uses a dotfiles manager: [Dotter](https://github.com/SuperCuber/dotter).
- The project includes binaries `./dotter` and `./dotter.arm`, which allow running commands without installing Dotter.
- Final files are generated using the [Handlebars](https://handlebarsjs.com/guide) templating engine.
- Scripts are written in the [Rhai](https://github.com/rhaiscript/rhai) language.

## Documentation
- More about Dotter: [Dotter Wiki](https://github.com/SuperCuber/dotter/wiki).

## Opening the DevContainer for the First Time

Follow these steps to open the development container in VSCode:

1. **Install Prerequisites**:
   - Install [Docker](https://www.docker.com/).
   - Install the [VSCode Dev Containers extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers).

2. **Clone the Repository**:
   ```bash
   git clone git@github.com:zeritiq/dotfiles.git
   cd dotfiles
   ```

3. **Set Up Environment Variables**:
   - Copy the example `.env` file:
     ```bash
     cp .devcontainer/.env.example .devcontaiвner/.env
     ```
   - Modify the `.env` file if necessary.

4. **Open the Project in VSCode**:
   - Open the repository folder in VSCode.
   - When prompted, click "Reopen in Container".

5. **Wait for the Container to Build**:
   - The container will be built and configured automatically.
   - This includes installing required packages and cloning the repository inside the container.

6. **Start Working**:
   - Once the container is ready, you can start working on your project.

For more details on DevContainers, refer to the [VSCode Dev Containers documentation](https://code.visualstudio.com/docs/devcontainers/containers).
