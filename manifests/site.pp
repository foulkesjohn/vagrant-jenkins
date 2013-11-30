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

  class { "chruby": }
  chruby::install { "ruby-1.9.3-p194":
    platform => "ruby",
    version => "1.9.3-p194",
  }
  chruby::install { "ruby-2.0.0-p353":
    platform => "ruby",
    version => "2.0.0-p353",
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

node "jenkins-master.example.com" inherits default {
  package { "jenkins":
    ensure => "latest",
  }
}

node "jenkins-slave01.example.com" inherits default {
  package { "jenkins-slave":
    ensure => "latest",
  }

  file { "/etc/default/jenkins-slave":
    ensure => "file",
    owner => "root",
    group => "root",
    mode => "0544",
    source => "puppet:///modules/jenkins/jenkins-slave-config",
    notify => Service["jenkins-slave"],
  }

  service { "jenkins-slave":
    ensure => "running",
  }
}

node "jenkins-slave02.example.com" inherits default {
  package { "jenkins-slave":
    ensure => "latest",
  }

  file { "/etc/default/jenkins-slave":
    ensure => "file",
    owner => "root",
    group => "root",
    mode => "0544",
    source => "puppet:///modules/jenkins/jenkins-slave-config",
    notify => Service["jenkins-slave"],
  }

  service { "jenkins-slave":
    ensure => "running",
  }
}
