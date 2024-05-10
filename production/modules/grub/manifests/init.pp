# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include grub
class grub {

  if $facts[os][name] == 'CentOS' and $facts[os][release][major] == '7' {
    #file { '/etc/grub.d/40_custom':
    #  ensure => file,
    #  source => 'puppet:///modules/grub/40_custom',
    #  owner  => 'root',
    #  group  => 'root',
    #  mode   => '0755',
    #  notify => Exec['/usr/sbin/grub2-mkconfig -o /boot/efi/EFI/centos/grub.cfg'],
    #}

    file { '/etc/default/grub':
      ensure  => file,
      content => template('grub/default_grub.erb'),
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      notify  => Exec['/usr/sbin/grub2-mkconfig -o /boot/efi/EFI/centos/grub.cfg'],
    }

    #  file { '/etc/grub.d/10_linux':
    #    ensure => file,
    #    mode   => '0644',
    #  }

    #  file { '/etc/grub.d/30_os-prober':
    #    ensure => file,
    #    mode   => '0644',
    #  }
  }

  if $facts[os][name] == 'CentOS' and $facts[os][release][major] == '8' {
    file { '/etc/default/grub':
      ensure => file,
      source => 'puppet:///modules/grub/default_grub_rh8',
      owner  => 'root',
      group  => 'root',
      mode   => '0755',
      notify => Exec['/usr/sbin/grub2-mkconfig -o /boot/efi/EFI/centos/grub.cfg'],
    }

    file { '/etc/grub.d/30_uefi-firmware':
      ensure => absent,
      notify => Exec['/usr/sbin/grub2-mkconfig -o /boot/efi/EFI/centos/grub.cfg'],
    }
  }

  exec { '/usr/sbin/grub2-mkconfig -o /boot/efi/EFI/centos/grub.cfg':
    refreshonly => true,
  }

}

