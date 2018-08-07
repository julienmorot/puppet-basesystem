class basesystem::hosts {
    file {"/etc/hosts":
        ensure => file,
        mode => "0644",
        content => template("${module_name}/hosts.erb"),
    }
}

