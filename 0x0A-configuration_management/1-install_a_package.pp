package { 'python3-pip':
  ensure => installed,
}

exec { 'install_flask':
  command   => '/usr/bin/pip3 install Flask==2.1.0',
  path      => ['/bin', '/usr/bin'],
  unless    => '/usr/bin/pip3 show Flask | grep -q "Version: 2.1.0"',
  logoutput => true,
}

file { '/etc/profile.d/flask_path.sh':
  ensure  => 'file',
  content => 'export PATH=$PATH:/usr/local/bin',
  mode    => '0755',
}

exec { 'source_profile':
  command   => 'source /etc/profile',
  path      => ['/bin', '/usr/bin'],
  require   => File['/etc/profile.d/flask_path.sh'],
  logoutput => true,
}
