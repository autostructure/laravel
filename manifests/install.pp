# Installs needed classes for laravel
class laravel::install {
  require ::epel
  require ::ius

  package { 'git':
    ensure => present,
  }

  package { 'curl':
    ensure => present,
  }

  package { 'nginx':
    ensure => present,
  }

  package { 'php71u':
    ensure => present,
  }

  package { 'php71u-fpm':
    ensure => present,
  }

  package { 'php71u-cli':
    ensure => present,
  }

  package { 'php71u-common':
    ensure => present,
  }

  package { 'php71u-mbstring':
    ensure => present,
  }

  package { 'php71u-gd':
    ensure => present,
  }

  package { 'php71u-json':
    ensure => present,
  }

  package { 'php71u-mcrypt':
    ensure => present,
  }

  package { 'php71u-zip':
    ensure => present,
  }

  package { 'php71u-xml':
    ensure => present,
  }
}
