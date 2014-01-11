class sabnzbd::install inherits sabnzbd {
	apt::ppa { 'ppa:jcfp/ppa': }
	
    package { 'sabnzbdplus':
      ensure => installed,
      require => Apt::Ppa['ppa:jcfp/ppa']
    }
	
}