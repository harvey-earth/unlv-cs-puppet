# Set up elko

class role::server::elko {

  include profile::base
  include profile::mail
  include profile::fw::elastic
  include profile::fw::nagios_ssh
  include profile::monitor::elasticsearch
  include profile::monitor::kibana
  include profile::monitor::logstash

}
