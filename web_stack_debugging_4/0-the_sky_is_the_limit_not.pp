# Raise Nginx's open-file limit so it can handle high concurrency

exec { 'fix--for-nginx':
  command => 'sed -i "s/15/4096/" /etc/default/nginx',
  path    => '/usr/local/bin/:/bin/',
}

# Restart Nginx so the new limit takes effect
exec { 'restart-nginx':
  command => '/etc/init.d/nginx restart',
  path    => '/etc/init.d/:/usr/sbin/:/usr/bin/:/bin/',
  require => Exec['fix--for-nginx'],
}
