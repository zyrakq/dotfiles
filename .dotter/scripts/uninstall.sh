uninstall() {
{{#if uninstall}}
    echo "Uninstall flag is enabled. Proceeding with uninstallation..."
    
    echo "Running post-uninstall scripts..."
    {{post_script_runner dotter.packages "uninstall" os}}
    
    {{#each managers as |installer_name|}}
    {{package_installer installer_name ../installers "uninstall" ../dotter.packages}}
    {{/each}}
    
    echo "Running pre-uninstall scripts..."
    {{pre_script_runner dotter.packages "uninstall" os}}
{{else}}
    echo "Uninstall flag is disabled. Skipping uninstallation."
{{/if}}
    return 0
}
