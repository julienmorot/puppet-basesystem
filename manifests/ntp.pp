class basesystem::ntp {
    $service_name = 'chrony'
    $packages = [ 'ntp' ]
    package { $packages : ensure => purged }
    package { "chrony" : ensure => installed }

    File { 'ntp.conf':
        path    => '/etc/ntp.conf',
        ensure  => absent,
    }

    File { 'leap-seconds.list':
        path    => '/var/lib/ntp/leap-seconds.list',
        ensure  => absent,
    }

    Service { $service_name :
        name      => $service_name,
        ensure    => running,
        enable    => true,
        hasrestart => true,
        hasstatus  => true,
    }


}

