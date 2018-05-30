class basesystem::bash {
    package { "bash-completion": ensure => installed }
    file { '/etc/profile.d/bash_history.sh':
        ensure  => present,
        mode    => '0644',
        owner   => 'root',
        group   => 'root',
        source  => "puppet:///modules/basesystem/bash_history.sh"
    }
}

