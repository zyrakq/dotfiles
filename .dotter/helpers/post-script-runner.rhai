fn run_post_scripts(packages, script_type, os_var) {
    let commands = [];
    
    for pkg in packages {
        // Create command that tries OS-specific script, then general fallback
        let run_command = "if [ -f " + pkg + "/" + os_var + "/post-" + script_type + ".sh ]; then " +
                         "bash " + pkg + "/" + os_var + "/post-" + script_type + ".sh; " +
                         "elif [ -f " + pkg + "/post-" + script_type + ".sh ]; then " +
                         "bash " + pkg + "/post-" + script_type + ".sh; " +
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
let script_type = params[1];  // "install" or "uninstall"
let os_var = params[2];       // os variable from dotter (arch/ubuntu/etc)
let packages = packages_dict.keys();

run_post_scripts(packages, script_type, os_var);
