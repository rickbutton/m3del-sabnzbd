class sabnzbd::config inherits sabnzbd {

    file { 'sabnzbd.ini':
      path => "/home/${user_name}/.sabnzbd/sabnzbd.ini",
      ensure => file,
      mode => '0644',
      owner => $user_name,
      group => $user_name,
      content => template('sabnzbd/sabnzbd.ini.erb'),
	  require => File["/home/${user_name}/.sabnzbd"]
    }

    file { 'sabnzbdplus':
      path => '/etc/default/sabnzbdplus',
      ensure => file,
      mode => '0644',
      owner => 'root',
      group => 'root',
      content => template('sabnzbd/sabnzbdplus.erb'),
    }
	
    file { "/home/${user_name}/.sabnzbd":
      ensure => directory,
      mode => '0755',
      owner => $user_name,
      group => $user_name,
  	  require => File["/home/${user_name}"],
    }
	
    file { "/home/${user_name}":
      ensure => directory,
      mode => '0755',
      owner => $user_name,
      group => $user_name,
	  require => User[$user_name]
    }
    
    group { 'media':
        gid => 1002,
    }
    user { "${user_name}":
        ensure => present,
        groups => ["${user_name}", 'media'],
        password => '*',
        home => "/home/${user_name}",
        require => Group['media'],
    }

}
