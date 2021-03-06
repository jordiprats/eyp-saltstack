class saltstack::minion::config inherits saltstack::minion {

  if($saltstack::minion::manage_config)
  {
    concat { '/etc/salt/minion':
      ensure => 'present',
      owner  => 'root',
      group  => 'root',
      mode   => '0640',
    }

    concat::fragment{ 'salt minion base config':
      target  => '/etc/salt/minion',
      order   => '00',
      content => template("${module_name}/minion/minion.erb"),
    }

    file { '/etc/salt/minion_id':
      ensure  => 'present',
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      content => $saltstack::minion::minion_id,
    }
  }
}
