class sabnzbd::install inherits sabnzbd {
	include apt
	apt::ppa { 'ppa:jcfp/ppa': }
	
    package { 'sabnzbdplus':
      ensure => installed,
      require => Apt::Ppa['ppa:jcfp/ppa']
    }
	
}