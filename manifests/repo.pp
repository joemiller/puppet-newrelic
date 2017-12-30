class newrelic::repo {
    case $operatingsystem {
        /Debian|Ubuntu/: {
            Exec['newrelic-add-apt-key', 'newrelic-add-apt-repo', 'newrelic-apt-get-update'] {
                path +> ['/usr/local/sbin', '/usr/local/bin', '/usr/sbin', '/usr/bin', '/sbin', '/bin']
            }
            exec { newrelic-add-apt-repo:
                creates => "/etc/apt/sources.list.d/newrelic.list",
                command => "wget -O /etc/apt/sources.list.d/newrelic.list http://download.newrelic.com/debian/newrelic.list",
            }
            exec { newrelic-get-apt-key:
              command => 'wget -O newrelic_signing.key https://download.newrelic.com/548C16BF.gpg',
              cwd => '/tmp/',
              user => root,
              creates => '/tmp/newrelic_signing.key',
              require => Exec['newrelic-add-apt-repo'],
            }
            exec { newrelic-add-apt-key:
              unless  => "apt-key list | grep -q 1024D/548C16BF",
              command => "apt-key add newrelic_signing.key",
              cwd => '/tmp/',
              require => Exec['newrelic-get-apt-key'],
            }
            exec { newrelic-apt-get-update:
                require   => [Exec["newrelic-add-apt-key"], Exec["newrelic-add-apt-repo"]],
                command     => "apt-get update",
            }
        }
        default: {
            file { "/etc/pki/rpm-gpg/RPM-GPG-KEY-NewRelic":
                owner   => root,
                group   => root,
                mode    => 0644,
                source  => "puppet:///modules/newrelic/RPM-GPG-KEY-NewRelic";
            }

            yumrepo { "newrelic":
                baseurl     => "http://yum.newrelic.com/pub/newrelic/el5/\$basearch",
                enabled     => "1",
                gpgcheck    => "1",
                gpgkey      => "file:///etc/pki/rpm-gpg/RPM-GPG-KEY-NewRelic";
            }
        }
    }
}
