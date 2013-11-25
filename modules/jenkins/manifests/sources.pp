class jenkins::sources {
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
  }
}
