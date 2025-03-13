function install() {
    {{#each managers as |installer_name|}}
        {{install installer_name ../installers ../dotter.packages}}
    {{/each}}
}
