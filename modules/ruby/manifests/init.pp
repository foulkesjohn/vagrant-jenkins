class ruby {
  file { "ruby-install":
    path => "/opt/ruby-install",
    ensure => "directory",
    recurse => true,
    purge => true,
    source => "puppet:///modules/ruby/ruby-install-0.3.2",
  }

  file { "chruby":
    path => "/opt/chruby",
    ensure => "directory",
    recurse => true,
    purge => true,
    source => "puppet:///modules/ruby/chruby-0.3.7",
  }

  file { "chruby-profile":
    path => "/etc/profile.d/chruby.sh",
    ensure => "file",
    source => "puppet:///modules/ruby/chruby.sh",
  }

  package { "libyaml-dev":
    ensure => "latest",
  }
}
