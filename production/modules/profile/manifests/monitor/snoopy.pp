# Profile::monitor::snoopy will setup snoopy

class profile::monitor::snoopy {

  class { 'snoopy': }

  logrotate::rule { 'snoopy':
    path         => '/var/log/snoopy.log',
    rotate       => 5,
    rotate_every => 'week',
  }
}
