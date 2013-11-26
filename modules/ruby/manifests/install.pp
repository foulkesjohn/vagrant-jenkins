define ruby::install {
  exec { "ruby-install-${name}":
    command => "ruby-install ruby ${name}",
    user => "root",
    creates => "/opt/rubies/ruby-${name}",
    timeout => 0,
    require => Class["ruby"],
  }

  exec { "ruby-install-${name}-bundler":
    command => "gem install bundler --no-ri --no-rdoc",
    user => "root",
    creates => "/opt/rubies/ruby-${name}/bin/bundle",
    path => ["/opt/rubies/ruby-${name}/bin"],
    require => Exec["ruby-install-${name}"],
  }
}
