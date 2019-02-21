define saltstack::minion::grain (
                                  $grain_name = $name,
                                  $value = undef,
                                  $order = '00',
                                ) {
    include ::saltstak::minion

    if(!defined(Concat::Fragment['salt minion grains base']))
    {
      concat::fragment{ 'salt minion grains base':
        target  => '/etc/salt/minion',
        order   => '01a',
        content => "grains:\n",
      }
    }

}