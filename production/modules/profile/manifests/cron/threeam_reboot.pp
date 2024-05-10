# Profile to tell system to reboot at 3:30 am

class profile::cron::threeam_reboot {

  cron { 'reboot':
    command => '/usr/sbin/shutdown -r +5',
    user    => 'root',
    hour    => '3',
    minute  => '25',
  }

}
