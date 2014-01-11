class m3del-sabnzbd (
	$user_name			= $m3del-sabnzbd::params::user_name,
	$download_dir		= $m3del-sabnzbd::params::download_dir,
	$complete_dir		= $m3del-sabnzbd::params::complete_dir,
	$api_key			= $m3del-sabnzbd::params::api_key,
	$script_dir			= $m3del-sabnzbd::params::script_dir,
	$usenet_server		= $m3del-sabnzbd::params::usenet_server,
	$usenet_user		= $m3del-sabnzbd::params::usenet_user,
	$usenet_password	= $m3del-sabnzbd::params::usenet_password,
	$usenet_connections = $m3del-sabnzbd::params::usenet_connections,
	$usenet_ssl			= $m3del-sabnzbd::params::usenet_ssl,
	$usenet_port		= $m3del-sabnzbd::params::usenet_port,
	$movie_script		= $m3del-sabnzbd::params::movie_script,
	$movie_location		= $m3del-sabnzbd::params::movie_location,
	$tv_script			= $m3del-sabnzbd::params::tv_script
) inherits m3del-sabnzbd::params {

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
	
	anchor { 'm3del-sabnzbd::begin': } ->
	class { 'm3del-sabnzbd::install': } ->
	class { 'm3del-sabnzbd::config': 
		notify => Class['m3del-sabnzbd::service'],
	} ->
	class { 'm3del-sabnzbd::service': } ->
	anchor { 'm3del-sabnzbd::end': }
	
}