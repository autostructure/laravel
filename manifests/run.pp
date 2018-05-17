# Run laravel
class laravel::run {
  # service { 'php7.0-fpm':
  #   ensure => running,
  #   enable => true,
  # }
#
  # service { 'nginx':
  #   ensure => running,
  #   enable => true,
  # }

  # exec { '/usr/sbin/phpenmod mcrypt':
  #   refreshonly => true,
  # }

  exec { '/usr/bin/curl -sS https://getcomposer.org/installer | php':
    environment => ['HOME=/root'],
    cwd         => '/root',
    creates     => '/root/composer.phar',
  }

  exec { '/bin/cp composer.phar /usr/local/bin/composer':
    cwd     => '/root',
    creates => '/usr/local/bin/composer',
  }

  exec { '/usr/local/bin/composer create-project laravel/laravel /var/www/laravel':
    environment => ['HOME=/root'],
    creates     => '/var/www/laravel',
  }
}
