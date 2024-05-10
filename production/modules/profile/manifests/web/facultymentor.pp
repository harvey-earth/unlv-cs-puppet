# Sets up stuff for test-facultymentor.cs.unlv.edu

class profile::web::facultymentor {

  package { 'uwsgi':
    ensure   => 'installed',
    provider => 'pip3',
  }

  file { '/etc/systemd/system/facultymentor.service':
    ensure => 'present',
    source => 'puppet:///modules/web/test-facultymentor.service',
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
  }

  service { 'facultymentor':
    ensure => 'running',
  }

  file { '/etc/nginx/conf.d/facultymentor.conf':
    ensure => file,
    owner  => 'root',
    group  => 'root',
    source => 'puppet:///modules/web/facultymentor.conf',
  }

}
