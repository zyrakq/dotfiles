fn run_post_scripts(packages, script_type, os_var) {
    let commands = [];
    
    for pkg in packages {
        // Создаем команду которая пробует OS-специфичный скрипт, затем общий fallback
        let run_command = "if [ -f " + pkg + "/" + os_var + "/post-" + script_type + ".sh ]; then " +
                         "bash " + pkg + "/" + os_var + "/post-" + script_type + ".sh; " +
                         "elif [ -f " + pkg + "/post-" + script_type + ".sh ]; then " +
                         "bash " + pkg + "/post-" + script_type + ".sh; " +
                         "fi || true";
        
        commands.push(run_command);
    }
    
    // Объединяем все команды через ; вместо &&
    let result = "";
    for cmd in commands {
        if result.len() > 0 {
            result += "; ";
        }
        result += cmd;
    }
    
    return result;
}

// Извлечение параметров
let packages_dict = params[0];
let script_type = params[1];  // "install" или "uninstall"
let os_var = params[2];       // переменная os из dotter (arch/ubuntu/etc)
let packages = packages_dict.keys();

run_post_scripts(packages, script_type, os_var);
