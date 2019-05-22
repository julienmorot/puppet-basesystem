class basesystem::nscd {
    $service_name = 'nscd'

    Package { "nscd": ensure => installed }

    Service { $service_name :
        name      => $service_name,
        ensure    => running,
        enable    => true,
        hasrestart => true,
        hasstatus  => true,
    }

}

