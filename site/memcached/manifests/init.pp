class memcached {
  package { 'memcached':
    ensure => present  
  }
  
  file { 'memcached':
    ensure => files,
    path => '/etc/sysconfig/memcached',
    owner => 'root',
    group => 'root',
    source => 'puppet:///modules/memcached/memcached',

  }

  service { 'memcached':
    ensure => running,
    ensure => true,
    subscribe => File['memcached'],
  }
}
