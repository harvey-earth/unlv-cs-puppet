# Class to join to our AD servers automatically


class profile::idm::cs_ad (
  String $ad_user = 'Administrator',
  String $ad_passwd = undef,
  String $domain = 'ad.cs.unlv.edu',
) {

  class { '::realmd':
    domain               => $domain,
    domain_join_user     => $ad_user,
    domain_join_password => $ad_passwd,
    krb_ticket_join      => false,
    manage_sssd_config   => false,
    manage_krb_config    => false,
    realmd_config        => {
      "$domain" => {
        'automatic-id-mapping'  => 'no',
        'fully-qualified-names' => 'no',
      },
      'users' => {
        'default-home' => '/home/%U',
      },
    },
  }

  firewall { '020 allow AD':
    dport  => [135,137,139,389,636,3268,3269,88],
    proto  => 'tcp',
    action => 'accept',
  }

  if $facts['os']['name'] == 'Ubuntu' {
    package { 'packagekit':
      ensure => present,
    }
  }

}
