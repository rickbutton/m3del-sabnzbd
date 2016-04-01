class sabnzbd (
	$user_name			= $sabnzbd::params::user_name,
	$download_dir		= $sabnzbd::params::download_dir,
	$complete_dir		= $sabnzbd::params::complete_dir,
	$backup_dir 		= $sabnzbd::params::backup_dir,
	$api_key			= $sabnzbd::params::api_key,
	$rating_api_key		= $sabnzbd::params::rating_api_key,
	$nzb_key 			= $sabnzbd::params::nzb_key,
	$rating_host 		= $sabnzbd::params::rating_host,
	$script_dir			= $sabnzbd::params::script_dir,
	$servers			= $sabnzbd::params::servers,
	$categories			= $sabnzbd::params::categories,
) inherits sabnzbd::params {

	validate_string($user_name)
	validate_absolute_path($download_dir)
	validate_absolute_path($complete_dir)
	validate_absolute_path($backup_dir)
	validate_string($api_key)
	validate_string($rating_api_key)
	validate_string($nzb_key)
	validate_re($rating_host, ['(((?:[-;:&=\+\$,\w]+@)?[A-Za-z0-9.-]+|(?:www.|[-;:&=\+\$,\w]+@)[A-Za-z0-9.-]+)((?:\/[\+~%\/.\w-_]*)?\??(?:[-\+=&;%@.\w_]*)#?(?:[\w]*))?)'])
	validate_absolute_path($script_dir)

	validate_array($servers)
	validate_array($categories)

	$servers.each |$s| {
		validate_re($s[host], ['(((?:[-;:&=\+\$,\w]+@)?[A-Za-z0-9.-]+|(?:www.|[-;:&=\+\$,\w]+@)[A-Za-z0-9.-]+)((?:\/[\+~%\/.\w-_]*)?\??(?:[-\+=&;%@.\w_]*)#?(?:[\w]*))?)'])
		validate_integer($s[connections])
		validate_string($s[username])
		validate_string($s[password])
		validate_bool($s[enable])
		validate_bool($s[ssl])
		validate_bool($s[optional])
		validate_integer($s[port])
		validate_integer($s[retention])
	}

	$categories.each |$c| {
		validate_string($c[name])
		validate_integer($c[priority])
		validate_string($c[script])
		validate_string($c[dir])
	}
	
	anchor { 'sabnzbd::begin': } ->
	class { 'sabnzbd::install': } ->
	class { 'sabnzbd::config': 
		notify => Class['sabnzbd::service'],
	} ->
	class { 'sabnzbd::service': } ->
	anchor { 'sabnzbd::end': }
	
}