# Profile::monitor::web configures filebeat to send httpd logs to logstash

class profile::monitor::web {

  class { 'filebeat':
    outputs       => {
      'logstash' => {
        'hosts' => ['1.2.3.39:5044'],
      },
    },
  }

  filebeat::input { 'apache_error':
    paths  => ['/var/log/httpd/*error*'],
    fields => {
      type => 'apache_error',
    },
  }

  filebeat::input { 'apache_access':
    paths  => ['/var/log/httpd/*access*/'],
    fields => {
      type => 'apache_access',
    },
  }

}
