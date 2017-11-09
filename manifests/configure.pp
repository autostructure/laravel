# Configure Laravel Install
class laravel::configure {
  file_line { 'replace_default_listener':
    ensure => present,
    path   => '/etc/php/7.0/fpm/pool.d/www.conf',
    match  => 'listen = \/run\/php\/php7.0-fpm.sock',
    line   => 'listen = 127.0.0.1:9000',
  }

  file_line { 'disable_cgi_fix_pathinfo':
    ensure => present,
    path   => '/etc/php/7.0/fpm/php.ini',
    match  => ';cgi.fix_pathinfo=1',
    line   => 'cgi.fix_pathinfo=0',
  }

  file { '/etc/nginx/sites-available/default':
    ensure => file,
    source => 'puppet:///modules/laravel/default',
  }
}
