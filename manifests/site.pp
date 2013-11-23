Exec { path => ["/usr/local/sbin", "/usr/local/bin", "/usr/sbin", "/usr/bin", "/sbin", "/bin"] }

node default {
  exec { "jenkins_gpg_key":
    command => "wget -O- http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | apt-key add -",
    unless => 'apt-key list | grep "Kohsuke Kawaguchi <kk@kohsuke.org>"',
    user => "root",
  }

  file { "/etc/apt/sources.list.d/jenkins.list":
    owner => "root",
    group => "root",
    mode => "0644",
    content => "deb http://pkg.jenkins-ci.org/debian binary/",
    require => Exec["jenkins_gpg_key"],
    notify => Exec["update_apt"],
  }

  exec { "update_apt":
    command => "apt-get update",
    user => "root",
    refreshonly => true,
  }

  package { "jenkins":
    ensure => "latest",
    require => [
      Exec["jenkins_gpg_key"],
      File["/etc/apt/sources.list.d/jenkins.list"],
    ],
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
