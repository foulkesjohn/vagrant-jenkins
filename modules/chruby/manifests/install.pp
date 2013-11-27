define chruby::install {
  exec { "ruby-install-${name}":
    command => "ruby-install ${name}",
    user => "root",
    creates => "/opt/rubies/${name}",
    timeout => 0,
    require => Class["chruby"],
  }

  exec { "ruby-install-${name}-bundler":
    command => "gem install bundler --no-ri --no-rdoc",
    user => "root",
    creates => "/opt/rubies/${name}/bin/bundle",
    path => ["/opt/rubies/${name}/bin"],
    require => Exec["ruby-install-${name}"],
  }
}
