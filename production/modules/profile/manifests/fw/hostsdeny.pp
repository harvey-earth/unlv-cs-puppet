# Profile for /etc/hosts.deny file to be centally managed

class profile::fw::hostsdeny {

  class { 'hosts': }

}
