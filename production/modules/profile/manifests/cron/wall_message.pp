# Profile to send a message to all connected users to notice the reboot T-30

class profile::cron::wall_message {

  cron { 'wall_message':
    command => 'wall NOTICE: This server will reboot in 15 minutes. Please save your work.',
    user    => 'root',
    hour    => '3',
    minute  => '15',
  }

}
