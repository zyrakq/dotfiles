fn get_install_command(installer_name, installers, packages) {
    if installers.contains(installer_name) {
        let installer = installers[installer_name];
        if installer.contains("commands") && installer.commands.contains("install") {
            let command = installer.commands.install;
            if !command.is_empty() {
                let installer_packages = installer.packages;
                let packages_to_install = packages.filter(|pkg| installer_packages.contains(pkg));
                if packages_to_install.len() > 0 {
                    let packages_str = "";
                    for pkg in packages_to_install {
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

// Извлечение значений installer_name, installers и списка пакетов из params и вызов функции
let installer_name = params[0];
let installers = params[1];
let packages_dict = params[2];
let packages = packages_dict.keys();
get_install_command(installer_name, installers, packages);
