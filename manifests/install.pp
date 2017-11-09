# Installs needed classes for laravel
class laravel::install {
  package { 'git':
    ensure => present,
  }

  package { 'curl':
    ensure => present,
  }

  package { 'nginx':
    ensure => present,
  }

  package { 'php7.0':
    ensure => present,
  }

  package { 'php7.0-fpm':
    ensure => present,
  }

  package { 'php7.0-cli':
    ensure => present,
  }

  package { 'php7.0-common':
    ensure => present,
  }

  package { 'php7.0-mbstring':
    ensure => present,
  }

  package { 'php7.0-gd':
    ensure => present,
  }

  package { 'php7.0-mcrypt':
    ensure => present,
  }

  package { 'php7.0-zip':
    ensure => present,
  }

  package { 'php7.0-xml':
    ensure => present,
  }
}
