class basesystem::ntp {
    $service_name = 'ntp'
    $packages = [ 'ntp']
    package { $packages : ensure => installed }

    file { 'ntp.conf':
        path    => '/etc/ntp.conf',
        ensure  => file,
        mode    => '644',
        owner   => 'root',
        group   => 'root',
        require => Package['ntp'],
        source  => "puppet:///modules/basesystem/ntp.conf",
        notify  => Service["ntp"],
    }
    file { 'leap-seconds.list':
        path    => '/var/lib/ntp/leap-seconds.list',
        ensure  => file,
        mode    => '644',
        owner   => 'root',
        group   => 'root',
        require => Package['ntp'],
        source  => "puppet:///modules/basesystem/leap-seconds.list",
        notify  => Service["ntp"],
    }

    service { $service_name :
        name      => $service_name,
        ensure    => running,
        enable    => true,
        hasrestart => true,
        hasstatus  => true,
    }
}

