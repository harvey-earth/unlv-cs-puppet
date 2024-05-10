# kibana config

class profile::monitor::kibana {

  class { 'kibana' : }

  selboolean { 'httpd_can_network_connect':
    persistent => true,
    value      => on,
  }

}
