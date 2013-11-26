Exec { path => ["/opt/ruby-install/bin", "/usr/local/sbin", "/usr/local/bin", "/usr/sbin", "/usr/bin", "/sbin", "/bin"] }

node default {
  stage { "alpha": before => Stage["bravo"] }
  stage { "bravo": before => Stage["main"] }

  class { "jenkins::sources":
    stage => "alpha",
  }

  class { "apt::update":
    stage => "bravo",
  }

  class { "ruby": }
  ruby::install { "1.9.3-p194": }
  ruby::install { "2.0.0-p353": }

  package { "jenkins":
    ensure => "latest",
  }

  package { "git":
    ensure => "latest",
  }

  package { "build-essential":
    ensure => "latest",
  }

  package { "vim":
    ensure => "latest",
  }
}
