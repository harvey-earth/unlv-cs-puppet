# Profile::monitor::login_ssh configures filebeat to send logs to logstash

class profile::monitor::login_ssh {

  class { 'filebeat':
    outputs       => {
      'logstash' => {
        'hosts' => ['1.2.3.39:5044'],
      },
    },
  }

  if $facts['os']['family'] == 'RedHat' {
    filebeat::input { 'ssh_logs':
      paths    => ['/var/log/secure'],
      fields   => {
        type => 'ssh',
      },
    }
  }

  elsif $facts['os']['name'] == 'Ubuntu' {
    filebeat::input { 'ssh_logs':
      paths    => ['/var/log/auth.log'],
      fields   => {
        type => 'ssh',
      },
    }
  }

}
