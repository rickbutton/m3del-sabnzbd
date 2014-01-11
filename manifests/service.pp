class sabnzbd::service inherits sabnzbd {
  service { 'sabnzbdplus-start':
    name => 'sabnzbdplus',
    ensure => running,
    enable => true,
  }
}