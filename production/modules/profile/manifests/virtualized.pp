# Profile for oVirt VMs to set up guest agent automatically

class profile::virtualized {

  if $facts['virtual'] == 'ovirt' {

    if $facts['os']['family'] == 'RedHat' {
      yumrepo { 'oVirt4.2':
        name                => 'ovirt-4.2',
        ensure              => 'present',
        assumeyes           => 'true',
        descr               => 'Latest oVirt 4.2 Release',
        mirrorlist          => 'http://resources.ovirt.org/pub/yum-repo/mirrorlist-ovirt-4.2-el$releasever',
        skip_if_unavailable => 'true',
        enabled             => 1,
        enablegroups        => 'true',
        gpgcheck            => 1,
        before              => Package['ovirt-guest-agent'],
      }
    }

    package { 'ovirt-guest-agent':
      ensure   => latest,
      before   => Service['ovirt-guest-agent'],
    }

    service { 'oVirt Agent':
      name    => 'ovirt-guest-agent',
      ensure  => running,
      enable  => true,
      require => Package['ovirt-guest-agent'],
    }
  }

  else {

    package {'qemu-guest-agent':
      ensure  => latest,
      before  => Service['qemu-guest-agent'],
    }

    service { 'qemu Guest Agent':
      name    => 'qemu-guest-agent',
      ensure => running,
      enable => true,
      require => Package['qemu-guest-agent'],
    }
  }
}
