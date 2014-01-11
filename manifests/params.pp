# Class: sabnzbd::params
#
#
class m3del-sabnzbd::params {
	$user_name			= ''
	$download_dir		= "/home/${user_name}/storage/incomplete"
	$complete_dir		= "/home/${user_name}/storage/complete"
	$api_key			= "03d086fc4f56c791b3588ae67051b312"
	$script_dir			= "/home/${user_name}/sickbeard_mp4_automator"
	$usenet_server		= "unlimited.newshosting.com"
	$usenet_user		= ""
	$usenet_password	= ""
	$usenet_connections = "20"
	$usenet_ssl			= "1"
	$usenet_port		= "563"
	$movie_script		= "nzbToCouchPotatoMP4.py"
	$movie_location		= "/home/${user_name}/Movies/Movies-toname"
	$tv_script			= "sabToSickBeardwithConverter.py"
}