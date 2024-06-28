package { 'python3-pip':
  ensure => installed,
}

exec { 'uninstall_flask_werkzeug':
  command   => '/usr/bin/pip3 uninstall -y Flask Werkzeug',
  path      => ['/bin', '/usr/bin'],
  onlyif    => '/usr/bin/pip3 show Flask || /usr/bin/pip3 show Werkzeug',
  logoutput => true,
}

exec { 'clear_pip_cache':
  command   => '/usr/bin/pip3 cache purge',
  path      => ['/bin', '/usr/bin'],
  require   => Exec['uninstall_flask_werkzeug'],
  logoutput => true,
}

exec { 'install_flask_werkzeug':
  command   => '/usr/bin/pip3 install Flask==2.1.0 Werkzeug==2.0.3',
  path      => ['/bin', '/usr/bin'],
  require   => Exec['clear_pip_cache'],
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

