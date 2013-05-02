class moro {
  exec { '/usr/bin/apt-get update': }

  package { [
      'lxdm',
      'fluxbox',
      'xinit',
      'xorg',
      'feh',
    ]:
    ensure   => 'latest',
    provider => 'apt',
    require => Exec['/usr/bin/apt-get update'],
    before => Service['lxdm']
  }

  service {['lxdm', 'x11-common']:
    ensure => 'running',
  }

  exec { '/bin/sed -i -e "s/.*# autologin=.*/autologin=vagrant/" /etc/lxdm/default.conf': 
    require => Package['lxdm'],
    before  => Service['lxdm'],
  }

  file { '/etc/lxdm/PreLogin':
    source => 'puppet:///modules/moro/prelogin.sh',
    mode => 'ugo+x',
    require => Package['lxdm'],
    before  => Service['lxdm'],
  }

  file { '/etc/lxdm/PostLogin':
    source => 'puppet:///modules/moro/run_launcher.sh',
    mode => 'ugo+x',
    require => Package['lxdm'],
    before  => Service['lxdm'],
  }

  file { '/etc/lxdm/automount.sh':
    source => 'puppet:///modules/moro/automount.sh',
    mode => 'ugo+x',
    require => Package['lxdm'],
    before  => Service['lxdm'],
  }

  file { ['/etc/lxdm/PostLogout', '/etc/lxdm/PreReboot', '/etc/lxdm/PreShutdown']:
    content => 'sync && sudo umount -a && shutdown -h now',
    mode => 'ugo+x',
    require => Package['lxdm'],
    before  => Service['lxdm'],
  }

  file { '/home/vagrant/.dmrc':
    source => 'puppet:///modules/moro/dmrc',
    before  => Service['lxdm'],
  }

  file { '/home/vagrant/.fluxbox':
    ensure => 'directory',
    owner => 'vagrant',
    before  => Service['lxdm'],
  }
  file { '/home/vagrant/.fluxbox/init':
    source => 'puppet:///modules/moro/fluxboxinit',
    owner => 'vagrant',
    require => File['/home/vagrant/.fluxbox'],
    before  => Service['lxdm'],
  }
}
