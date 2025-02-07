class bobcat::ddisplay (
  $enabled         = true,
  $config_template = 'bobcat/ddisplay/ddisplay.yaml.epp'
){
  require bobcat

  package {
    'bobcat-python':
      ensure => latest;

    'bobcat-ddisplay':
      ensure => latest;
  }

  file {
    '/etc/bobcat/ddisplay.yaml':
      ensure  => file,
      owner   => 'root',
      group   => 'root',
      mode    => '0444',
      content => epp($config_template);
  }

  service {
    'bobcat-ddisplay':
      ensure => running,
      enable => $enabled;
  }
}
