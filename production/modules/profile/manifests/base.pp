# Class for Base Profile
# Configures NTP and DNS to point to our DNS servers

class profile::base (
  Array $ntp_srvs = ['ms.cs.unlv.edu', 'ms1.cs.unlv.edu', 'ms2.cs.unlv.edu'],
) {

  if $facts['os']['name'] == 'CentOS' and $facts['os']['release']['major'] == '8' {
    class { 'chrony': }
  }
  else {
    class { 'ntp':
      servers => $ntp_srvs,
    }
  }

  if $facts['os']['family'] == 'RedHat' {
    class { 'resolv': }
  }
  #elsif $facts['os']['name'] == 'Ubuntu' {
  #  include netplan
  #}
  #if $facts['os']['name'] =~ /^(Debian|Ubuntu)/ {
  #  include profile::cron::threeam_reboot
  #}

}
