class basesystem::packages {

    package { "vim": ensure => installed }
    file { '/etc/vim/vimrc':
    ensure  => present,
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    source  => "puppet:///modules/${module_name}/vimrc"
  }

    package { "screen": ensure => installed }
    package { "htop": ensure => installed }

}

