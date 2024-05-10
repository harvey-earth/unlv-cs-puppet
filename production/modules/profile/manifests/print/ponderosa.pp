# Class that sets up printing to ponderosa through lpr print queue
# uri is lpd://printers-cs.cs.unlv.edu/ponderosa

class profile::print::ponderosa {

  if $facts['os']['family'] == 'Debian' {
    package { 'lpr':
      ensure => installed,
    }
  }

  include '::cups'

  cups_queue { 'ponderosa':
    ensure    => 'printer',
    enabled   => true,
    accepting => true,
    uri       => 'lpd://printers-cs.cs.unlv.edu/ponderosa',
  }

  exec { '/usr/sbin/lpadmin -d ponderosa':
    subscribe => Cups_queue['ponderosa'],
    onlyif    => '/usr/bin/lpq',
  }
}
