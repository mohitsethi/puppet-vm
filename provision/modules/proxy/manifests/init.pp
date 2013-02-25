
class proxy {
	exec { 'proxy configuration':
		command => "echo 'http_proxy=http://16.216.235.20:8080\'' | sudo tee -a /etc/environment"
	}
}