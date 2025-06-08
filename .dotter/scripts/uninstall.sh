function uninstall() {
{{#if uninstall}}
    echo "Uninstall flag is enabled. Proceeding with uninstallation..."
    
    echo "Running pre-uninstall scripts..."
    {{post_script_runner dotter.packages "uninstall" os}}
    
    {{#each managers as |installer_name|}}
    {{package_installer installer_name ../installers "uninstall" ../dotter.packages}}
    {{/each}}
{{else}}
    echo "Uninstall flag is disabled. Skipping uninstallation."
{{/if}}
    return 0
}
