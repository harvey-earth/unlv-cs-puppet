# Sets up ELRepo

class profile::repo::elrepo {

  yumrepo { 'elrepo':
    ensure   => 'present',
    descr    => 'ELRepo',
    baseurl  => 'http://elrepo.org/linux/elrepo/el7/$basearch/',
    enabled  => '1',
    gpgcheck => '1',
    gpgkey   => 'https://www.elrepo.org/RPM-GPG-KEY-elrepo.org',
  }

}
