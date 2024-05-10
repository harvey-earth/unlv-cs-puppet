# Programs and services to install/remove for B361 lab machines

class profile::programs::b361 {

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

  package { 'geany':
    ensure => 'installed',
  }

  package { 'vim':
    ensure => 'installed',
  }

  package { 'emacs':
    ensure => 'installed',
  }

  package { 'sbcl':
    ensure => 'installed',
  }

  # Install Atom Editor
  include packagecloud

  packagecloud::repo { "AtomEditor/atom":
    type => 'rpm',
  }

  package { 'atom':
    ensure => 'installed',
  }

  # Install Sublime Editor
  #yumrepo { 'sublime-text-editor':
  #  ensure   => 'present',
  #  descr    => 'Sublime Text',
  #  baseurl  => 'https://download.sublimetext.com/rpm/stable/x86_64',
  #  enabled  => '1',
  #  gpgcheck => '1',
  #  gpgkey   => 'https://download.sublimetext.com/sublimehq-rpm-pub.gpg',
  #}

  #package { 'sublime-text':
  #  ensure => 'present',
  #}

  # Install Java 1.8.0 OpenJDK
  package { 'java-1.8.0-openjdk':
    ensure => 'installed',
  }

  package { 'java-1.8.0-openjdk-devel':
    ensure => 'installed',
  }

  package { 'java-1.8.0-openjdk-src':
    ensure => 'installed',
  }

  package { 'python36':
    ensure => 'installed',
  }

  package { 'ruby':
    ensure => 'installed',
  }

  package { 'yasm':
    ensure => 'installed',
  }

  package { 'gdb':
    ensure => 'installed',
  }

  package { 'ddd':
    ensure => 'installed',
  }

  yumrepo { 'vscode-repo':
    enabled  => '1',
    baseurl  => 'https://packages.microsoft.com/yumrepos/vscode',
    gpgkey   => 'https://packages.microsoft.com/keys/microsoft.asc',
    gpgcheck => '1',
    ensure   => 'present',
  } ->
  package { 'code':
    ensure => 'latest',
  }

}
