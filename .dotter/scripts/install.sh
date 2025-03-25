function install() {
{{#if install}}
    echo "Install flag is enabled. Proceeding with installation..."
    {{#each managers as |installer_name|}}
    {{package_installer installer_name ../installers "install" ../dotter.packages}}
    {{/each}}
{{else}}
    echo "Install flag is disabled. Skipping installation."
{{/if}}
    return 0
}
