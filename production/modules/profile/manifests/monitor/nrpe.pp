# This class just sets up nrpe with the proper allowed hosts and will be included in the nrpe command classes

class profile::monitor::nrpe {

  if $facts['os']['family'] == 'RedHat' {
    package { 'epel-release':
      ensure => present,
    }
  }

  class { 'nrpe':
    allowed_hosts               => ['127.0.0.1', 'heimdall.cs.unlv.edu'],
    ssl_cacert_file_content     => 'puppet:///modules/nrpe/ca_cert.pem',
    ssl_privatekey_file_content => "puppet:///modules/nrpe/$facts['hostname'].key",
    ssl_cert_file_content       => "puppet:///modules/nrpe/$facts['hostname'].pem",
  }

}
