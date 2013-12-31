class newrelic::repo {
    case $operatingsystem {
        /Debian|Ubuntu/: {
            apt::source { 'newrelic':
                location => 'http://apt.newrelic.com/debian/',
                release => 'newrelic',
                repos => 'non-free',
                include_src => false,
                key => true,
                key_source => 'https://download.newrelic.com/548C16BF.gpg',
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
