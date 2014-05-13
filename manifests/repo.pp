# Class: newrelic::repo
#
# This module manages the Newrelic APT and YUM repositories
#

class newrelic::repo {

    # Add the New Relic apt repo source
    case $operatingsystem {
        /Debian|Ubuntu/: {
          apt::source { 'newrelic':
            location          => 'http://apt.newrelic.com/debian/',
            release           => 'newrelic',
            repos             => 'non-free',
            required_packages => 'debian-archive-keyring',
            key               => '548C16BF',
            key_server        => 'subkeys.pgp.net',
            include_src       => false
          }
        }
        default: {
            file { '/etc/pki/rpm-gpg/RPM-GPG-KEY-NewRelic':
                owner   => 'root',
                group   => 'root',
                mode    => '0644',
                source  => 'puppet:///modules/newrelic/RPM-GPG-KEY-NewRelic';
            }

            yumrepo { 'newrelic':
                baseurl     => 'http://yum.newrelic.com/pub/newrelic/el5/\$basearch',
                enabled     => '1',
                gpgcheck    => '1',
                gpgkey      => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-NewRelic';
            }
        }
    }
}
