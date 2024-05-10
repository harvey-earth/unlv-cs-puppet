# List of services to manage for sally 

class profile::services::sally {

  service { 'bluetooth':
    ensure => stopped,
  }

  service { 'rsync':
    ensure => stopped,
  }

}
