function install() {
{{#if install}}
    echo "Install flag is enabled. Proceeding with installation..."
    {{#each managers as |installer_name|}}
    {{package_installer installer_name ../installers "install" ../dotter.packages}}
    {{/each}}
    
    echo "Running post-install scripts..."
    {{post_script_runner dotter.packages "install" os}}
{{else}}
    echo "Install flag is disabled. Skipping installation."
{{/if}}
    return 0
}
