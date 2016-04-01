# Class: sabnzbd::params
#
#
class sabnzbd::params {
	$user_name			= 'sabnzbd'
	$download_dir		= "/home/${user_name}/storage/incomplete"
	$complete_dir		= "/home/${user_name}/storage/complete"
	$backup_dir 		= "/home/${user_name}/storage/indexes"
	$api_key			= "REPLACE ME"
	$rating_api_key		= "REPLACE ME"
	$nzb_key  			= "REPLACE ME"
	$rating_host  		= "REPLACE ME"
	$script_dir			= "/scripts/"
	$servers 			= []
	$categories 		= []
}