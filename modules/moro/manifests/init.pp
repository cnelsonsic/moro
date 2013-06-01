class moro {
  exec { '/usr/bin/apt-get update': }

  package { [
      'lightdm',
      'fluxbox',
      'xinit',
      'xorg',
      'feh',
      'localepurge',
    ]:
    ensure   => 'latest',
    provider => 'apt',
    require => Exec['/usr/bin/apt-get update'],
    before => Service['lightdm']
  }

  exec { '/usr/sbin/localepurge':
    require => Package['localepurge'],
  }

  service {['lightdm', 'x11-common']:
    ensure => 'running',
  }

  file { '/etc/lightdm/lightdm.conf':
    source => 'puppet:///modules/moro/lightdm.conf',
    mode => 'ugo+x',
    require => Package['lightdm'],
    before  => Service['lightdm'],
    notify => Service['lightdm'],
  }

  file { '/etc/lightdm/PreLogin':
    source => 'puppet:///modules/moro/prelogin.sh',
    mode => 'ugo+x',
    require => Package['lightdm'],
    before  => Service['lightdm'],
    notify => Service['lightdm'],
  }

  file { '/etc/lightdm/PostLogin':
    source => 'puppet:///modules/moro/run_launcher.sh',
    mode => 'ugo+x',
    require => Package['lightdm'],
    before  => Service['lightdm'],
    notify => Service['lightdm'],
  }

  file { '/etc/lightdm/automount.sh':
    source => 'puppet:///modules/moro/automount.sh',
    mode => 'ugo+x',
    require => Package['lightdm'],
    before  => Service['lightdm'],
    notify => Service['lightdm'],
  }

  file { ['/etc/lightdm/PostLogout', '/etc/lightdm/PreReboot', '/etc/lightdm/PreShutdown']:
    content => 'sync && sudo umount -a && shutdown -h now',
    mode => 'ugo+x',
    require => Package['lightdm'],
    before  => Service['lightdm'],
    notify => Service['lightdm'],
  }

  file { '/home/pi/.dmrc':
    source => 'puppet:///modules/moro/dmrc',
    before  => Service['lightdm'],
    notify => Service['lightdm'],
  }

  file { '/home/pi/.fluxbox':
    ensure => 'directory',
    owner => 'pi',
    before  => Service['lightdm'],
    notify => Service['lightdm'],
  }
  file { '/home/pi/.fluxbox/init':
    source => 'puppet:///modules/moro/fluxboxinit',
    owner => 'pi',
    require => File['/home/pi/.fluxbox'],
    before  => Service['lightdm'],
    notify => Service['lightdm'],
  }
}
