# Fail2Ban for SSH settings
# Bantime of 10 minutes seems to be long enough for most bots to move on

class profile::f2b::ssh {

  class { 'fail2ban':
    package_ensure       => 'latest',
    service_ensure       => 'running',
    bantime              => 600,
    jails                => ['ssh', 'ssh-ddos'],
    action               => 'action_',
    maxretry             => 10,
    whitelist            => ['127.0.0.1/8', '1.2.3.4/24'],
  }
}
