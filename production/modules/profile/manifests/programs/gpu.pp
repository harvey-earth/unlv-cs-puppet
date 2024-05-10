# List of packages to install for sally 

class profile::programs::gpu {

  package { 'emacs':
    ensure => latest,
  }

  package { 'vim':
    ensure => latest,
  }

  package { 'valgrind':
    ensure => latest,
  }

  package { 'gcc':
    ensure => latest,
  }

  package { 'g++':
    ensure => latest,
  }

  package { 'clisp':
    ensure => latest,
  }

  package { 'libncurses5-dev':
    ensure => latest,
  }

  package { 'gnuplot':
    ensure => latest,
  }

  package { 'gcl':
    ensure => latest,
  }

  package { 'sbcl':
    ensure => latest,
  }

  package { 'gprolog':
    ensure => latest,
  }

  package { 'geany':
    ensure => latest,
  }

  package { 'python3-pip':
    ensure => latest,
  }

  package { 'tensorflow':
    ensure   => '1.14.0',
    provider => 'pip3',
  }

  package { 'tensorflow-gpu':
    ensure   => '1.14.0',
    provider => 'pip3',
  }

  package { 'torch':
    ensure   => latest,
    provider => 'pip3',
  }

  package { 'torchvision':
    ensure   => latest,
    provider => 'pip3',
  }

  package { 'matplot':
    ensure   => latest,
    provider => 'pip3',
  }

  package { 'pyspark':
    ensure   => latest,
    provider => 'pip3',
  }

  package { 'numpy':
    ensure   => latest,
    provider => 'pip3',
  }

  package { 'scikit-learn':
    ensure   => latest,
    provider => 'pip3',
  }

  package { 'pandas':
    ensure   => latest,
    provider => 'pip3',
  }

  package { 'python3-keras':
    ensure => latest,
  }

  package { 'cuda':
    ensure => '10.0.130-1',
  }

  # Version depends on cuda version above
  package { 'cupy-cuda100':
    ensure   => 'latest',
    provider => 'pip3',
  }

  package { 'ophcrack':
    ensure => latest,
  }

  package { 'chromium-bsu':
    ensure => latest,
  }

  package { 'imagemagick':
    ensure => latest,
  }

  package { 'mysql-server':
    ensure => latest,
  }

  package { 'tesseract-ocr':
    ensure => latest,
  }

  package { 'libtesseract-dev':
    ensure => latest,
  }

  package { 'hashcat':
    ensure => latest,
  }

  package { 'python3-venv':
    ensure => latest,
  }

  package { 'default-jre':
    ensure => latest,
  }

  package { 'default-jdk':
    ensure => latest,
  }

  package { 'postgresql-server-dev-all':
    ensure => latest,
  }

  package { 'postgresql':
    ensure => latest,
  }

}
