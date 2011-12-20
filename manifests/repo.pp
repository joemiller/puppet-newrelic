class newrelic::repo {
    case $operatingsystem {
        /Debian|Ubuntu/: {
            exec { newrelic-add-apt-key:
                unless  => "apt-key list | grep -q 1024D/548C16BF",
                command => "apt-key adv --keyserver hkp://subkeys.pgp.net --recv-keys 548C16BF",
            }
            exec { newrelic-add-apt-repo:
                creates => "/etc/apt/sources.list.d/newrelic.list",
                command => "wget -O /etc/apt/sources.list.d/newrelic.list http://download.newrelic.com/debian/newrelic.list",
            }
            exec { newrelic-apt-get-update:
                refreshonly => true,
                subscribe   => [Exec["newrelic-add-apt-key"], Exec["newrelic-add-apt-repo"]],
                command     => "apt-get update",
            }
        }
        default: {
            file { "/etc/pki/rpm-gpg/RPM-GPG-KEY-NewRelic":
                owner   => root,
                group   => root,
                mode    => 0644,
                source  => "puppet:///newrelic/RPM-GPG-KEY-NewRelic";
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
