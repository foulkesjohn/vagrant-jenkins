define chruby::install (
  $platform,
  $version
) {
  exec { "ruby-install-${name}":
    command => "ruby-install ${platform} ${version}",
    user => "root",
    creates => "/opt/rubies/${platform}-${version}",
    timeout => 0,
    require => Class["chruby"],
  }

  exec { "ruby-install-${name}-bundler":
    command => "gem install bundler --no-ri --no-rdoc",
    user => "root",
    creates => "/opt/rubies/${platform}-${version}/bin/bundle",
    path => ["/opt/rubies/${platform}-${version}/bin"],
    require => Exec["ruby-install-${name}"],
  }
}
