# Class profile::mount::bob uses autofs to map to 'gen' and 'web' directories in users home

class profile::mount::bob {

  include autofs

  autofs::mount { 'home':
    mount   => '/home',
    mapfile => '/etc/auto.home',
  }

  autofs::mapfile { 'home':
    path     => '/etc/auto.home',
    mappings => [
      { 'key' => '*', 'options' => 'rw,fstype=nfs4,intr', 'fs' => 'csfs01.cs.unlv.edu:/home/&' }
    ]
  }

  autofs::mount { 'web':
    mount   => '/var/www/html',
    mapfile => '/etc/auto.web',
  }

  autofs::mapfile { 'web':
    path     => '/etc/auto.web',
    mappings => [
      { 'key' => '*', 'options' => 'rw,fstype=nfs4,intr', 'fs' => 'csfs01.cs.unlv.edu:/var/www/www.cs.unlv.edu/html/wwwweb/public_html/&' }
    ]
  }

}
