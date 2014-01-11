class sabnzbd (
	$user_name			= $sabnzbd::params::user_name,
	$download_dir		= $sabnzbd::params::download_dir,
	$complete_dir		= $sabnzbd::params::complete_dir,
	$api_key			= $sabnzbd::params::api_key,
	$script_dir			= $sabnzbd::params::script_dir,
	$usenet_server		= $sabnzbd::params::usenet_server,
	$usenet_user		= $sabnzbd::params::usenet_user,
	$usenet_password	= $sabnzbd::params::usenet_password,
	$usenet_connections = $sabnzbd::params::usenet_connections,
	$usenet_ssl			= $sabnzbd::params::usenet_ssl,
	$usenet_port		= $sabnzbd::params::usenet_port,
	$movie_script		= $sabnzbd::params::movie_script,
	$movie_location		= $sabnzbd::params::movie_location,
	$tv_script			= $sabnzbd::params::tv_script
) inherits sabnzbd::params {

	validate_string($user_name)
	validate_absolute_path($download_dir)
	validate_absolute_path($complete_dir)
	validate_string($api_key)
	validate_absolute_path($script_dir)
	validate_re($usenet_server, ['(((?:[-;:&=\+\$,\w]+@)?[A-Za-z0-9.-]+|(?:www.|[-;:&=\+\$,\w]+@)[A-Za-z0-9.-]+)((?:\/[\+~%\/.\w-_]*)?\??(?:[-\+=&;%@.\w_]*)#?(?:[\w]*))?)'])
	validate_string($usenet_user)
	validate_string($usenet_password)
	validate_string($usenet_connections)
	validate_string($usenet_ssl)
	validate_string($usenet_port)
	validate_string($movie_script)
	validate_absolute_path($movie_location)
	validate_string($tv_script)
	
	anchor { 'sabnzbd::begin': } ->
	class { 'sabnzbd::install': } ->
	class { 'sabnzbd::config': 
		notify => Class['sabnzbd::service'],
	} ->
	class { 'sabnzbd::service': } ->
	anchor { 'sabnzbd::end': }
	
}