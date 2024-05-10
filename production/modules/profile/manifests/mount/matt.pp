# Directory mounts for matt

class profile::mount::matt {

  mount { '/home/matt/web':
    ensure  => 'mounted',
    device  => 'csfs01.cs.unlv.edu:/var/www.cs.unlv.edu/html/wwwweb/public_html/matt',
    fstype  => 'nfs',
    options => 'defaults,auto',
  }

  mount { '/home/matt/csfs':
    ensure  => 'mounted',
    device  => 'csfs01.cs.unlv.edu:/home/matt',
    fstype  => 'nfs',
    options => 'defaults,auto',
  }

  mount { '/home/matt/duckburg':
    ensure  => 'mounted',
    device  => 'duckburg.cs.unlv.edu:/home/matt',
    fstype  => 'nfs',
    options => 'defaults,auto',
  }

  mount { '/home/matt/website':
    ensure  => 'mounted',
    device  => 'egr-fs-1.egr.unlv.edu:/storage/homes/csfac/matt',
    fstype  => 'nfs',
    options => 'defaults,auto',
  }
}
