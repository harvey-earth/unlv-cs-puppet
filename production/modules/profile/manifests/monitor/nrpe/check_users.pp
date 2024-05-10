# This command will check users on a server and return a warning for 20 and critical for 50 users

class profile::monitor::nrpe::check_users {

  include profile::monitor::nrpe

  nrpe::command {
    'check_users':
      ensure => present,
      command => 'check_users -w 20 -c 50',
  }

}
