fn run_pre_install_scripts(packages, os_var) {
    let commands = [];
    
    for pkg in packages {
        // Create command that tries OS-specific script, then general fallback
        let run_command = "if [ -f " + pkg + "/" + os_var + "/install.sh ]; then " +
                         "bash " + pkg + "/" + os_var + "/install.sh; " +
                         "elif [ -f " + pkg + "/install.sh ]; then " +
                         "bash " + pkg + "/install.sh; " +
                         "fi || true";
        
        commands.push(run_command);
    }
    
    // Join all commands with ; instead of &&
    let result = "";
    for cmd in commands {
        if result.len() > 0 {
            result += "; ";
        }
        result += cmd;
    }
    
    return result;
}

// Extract parameters
let packages_dict = params[0];
let os_var = params[1];       // os variable from dotter (arch/ubuntu/etc)
let packages = packages_dict.keys();

run_pre_install_scripts(packages, os_var);
