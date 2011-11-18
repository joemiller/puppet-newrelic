class newrelic::repo {

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
