# CS Logstash Configuration

class profile::monitor::logstash {

  include logstash

  logstash::plugin { 'logstash-input-beats': }

  logstash::configfile { 'basic-beats':
    content => 'input { beats { port => 5044 } } output { elasticsearch { hosts => "localhost:9200" index=> "%{[@metadata][beat]}-%{+YYY.MM.dd}" document_type => "%{[@metadata][type]}" } } ',
  }

}
