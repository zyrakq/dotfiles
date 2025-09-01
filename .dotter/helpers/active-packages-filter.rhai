fn get_active_packages(packages_dict) {
    let active_packages = [];
    
    for pkg in packages_dict.keys() {
        if packages_dict[pkg] == true {
            active_packages.push(pkg);
        }
    }
    
    return active_packages;
}

// Extract packages dict from params
let packages_dict = params[0];
let active_packages = get_active_packages(packages_dict);

// Return comma-separated list for debugging
let result = "";
for pkg in active_packages {
    if result.len() > 0 {
        result += ", ";
    }
    result += pkg;
}

result