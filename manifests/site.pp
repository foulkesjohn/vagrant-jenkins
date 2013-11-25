Exec { path => ["/usr/local/sbin", "/usr/local/bin", "/usr/sbin", "/usr/bin", "/sbin", "/bin"] }

node default {
  stage { "alpha": before => Stage["bravo"] }
  stage { "bravo": before => Stage["main"] }

  class { "jenkins::sources":
    stage => "alpha",
  }

  class { "apt::update":
    stage => "bravo",
  }

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
