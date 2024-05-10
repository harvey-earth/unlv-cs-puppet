# Programs and services to install/remove for B361 lab machines (CentOS 8)

class profile::programs::b361test {

  service { 'packagekit':
    ensure => 'stopped',
    enable => 'mask',
  }

  exec { 'systemctl mask packagekit':
    path => '/usr/bin',
  }

  file { '/usr/bin/gnome-software':
    ensure => 'present',
    mode   => '0700',
  }

  # Install epel-release repo
  package { 'epel-release':
    ensure => 'present',
  }

  # Install Development Tools group
  include 'yum'

  yum::group { 'Development Tools':
    ensure => 'present',
  }

  package { 'gcc':
    ensure => 'latest',
  }

  package { 'gcc-c++':
    ensure => 'latest',
  }

  package { 'vim':
    ensure => 'latest',
  }

  package { 'emacs':
    ensure => 'latest',
  }

  # No sbcl for CentOS 8 yet
  #package { 'sbcl':
  #  ensure => 'latest',
  #}

  # Install Java 1.8.0 OpenJDK
  package { 'java-1.8.0-openjdk':
    ensure => 'latest',
  }

  package { 'java-1.8.0-openjdk-devel':
    ensure => 'latest',
  }

  package { 'java-1.8.0-openjdk-src':
    ensure => 'latest',
  }

  package { 'python36':
    ensure => 'latest',
  }

  package { 'ruby':
    ensure => 'latest',
  }

  package { 'yasm':
    ensure => 'latest',
    install_options => ['--enablerepo', 'PowerTools'],
  }

  package { 'gdb':
    ensure => 'latest',
  }

  package { 'xorg-x11-apps':
    ensure          => 'latest',
    install_options => ['--enablerepo', 'PowerTools'],
  }

  package { 'ddd':
    ensure => 'latest',
  }

  yumrepo { 'vscode-repo':
    name     => 'vscode',
    enabled  => '1',
    baseurl  => 'https://packages.microsoft.com/yumrepos/vscode',
    gpgkey   => 'https://packages.microsoft.com/keys/microsoft.asc',
    gpgcheck => '1',
    ensure   => 'present',
  } ->
  package { 'code':
    ensure => 'latest',
  }

  # Install Nux repo for xfat
  yumrepo { 'nux-desktop':
    name     => 'nux',
    enabled  => '1',
    baseurl  => 'http://li.nux.ro/download/nux/dextop/el7/$basearch/',
    gpgkey   => 'http://li.nux.ro/download/nux/RPM-GPG-KEY-nux.ro',
    gpgcheck => '1',
    ensure   => 'present',
  } ->
  package { 'exfat-utils':
    ensure =>  latest,
  }

  package { 'fuse-exfat':
    ensure =>  latest,
  }

}
