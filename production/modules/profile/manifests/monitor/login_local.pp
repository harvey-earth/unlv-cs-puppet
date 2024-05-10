# This class configures filebeat to monitor for local logins
# Used for B361 Lab Computers

class profile::monitor::login_local {

  class{ 'filebeat':
    outputs => {
      'logstash' => {
        'hosts' => '1.2.3.39:5044',
      },
    },
  }

  filebeat::input { 'local':
    paths    => ['/var/log/secure'],
    fields   => {
      type => 'local',
    },
  }
}
