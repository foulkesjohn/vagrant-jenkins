class apt::update {
  exec { "update_apt":
    command => "apt-get update",
    user => "root",
  }
}
