class basesystem::hosts {
    file {'/etc/hosts':
        ensure => file,
        mode => '0644',
        content => template('basesystem/hosts.erb'),
    }
}

