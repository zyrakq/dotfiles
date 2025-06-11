fn get_package_command(installer_name, installers, command_type, packages) {
    if installers.contains(installer_name) {
        let installer = installers[installer_name];
        if installer.contains("commands") && installer.commands.contains(command_type) {
            let command = installer.commands[command_type];
            if !command.is_empty() {
                let installer_packages = installer.packages;
                let packages_to_process = packages.filter(|pkg| installer_packages.contains(pkg));
                if packages_to_process.len() > 0 {
                    let packages_str = "";
                    for pkg in packages_to_process {
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

// Extract installer_name, installers, command and package list from params and call function
let installer_name = params[0];
let installers = params[1];
let command_type = params[2]; // "install" or "uninstall"
let packages_dict = params[3];
let packages = packages_dict.keys();
get_package_command(installer_name, installers, command_type, packages);
