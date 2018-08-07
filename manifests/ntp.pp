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
        source  => "puppet:///modules/${module_name}/ntp.conf",
        notify  => Service["ntp"],
    }

    file { 'leap-seconds.list':
        path    => '/var/lib/ntp/leap-seconds.list',
        ensure  => file,
        mode    => '644',
        owner   => 'root',
        group   => 'root',
        require => Package['ntp'],
        source  => "puppet:///modules/${module_name}/leap-seconds.list",
        notify  => Service["ntp"],
    }

	file_line { 'apparmor_leap-seconds.list':
  		ensure => present,
  		path   => '/etc/apparmor.d/usr.sbin.ntpd',
  		line   => "  /var/lib/ntp/leap-seconds.list r,",
  		after  => "  /var/lib/ntp/\*drift rw,",
	}

    service { $service_name :
        name      => $service_name,
        ensure    => running,
        enable    => true,
        hasrestart => true,
        hasstatus  => true,
    }
}

