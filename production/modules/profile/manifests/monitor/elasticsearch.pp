# Sets up elasticsearch

class profile::monitor::elasticsearch {

  include ::java

  class { 'elasticsearch':
    restart_on_change => true,
    autoupgrade => true,
  }
  elasticsearch::instance { 'cs': }

}
