# Profile to tell system to reboot at midnight

class profile::cron::midnight_reboot {

  cron { 'reboot':
    command => '/usr/sbin/shutdown -r now',
    user    => 'root',
    hour    => '0',
    minute  => '0',
  }

}
