class skeleton::puppetmodule($modulename, $basedir, $username, $overwrite = false) {

  File {
    replace => $overwrite
  }

  file { "${basedir}/${modulename}":
    ensure => directory,
  }

  file { "${basedir}/${modulename}/metadata.json":
    ensure  => file,
    content => '{}',
    require => File["${basedir}/${modulename}"],
  }

  file { "${basedir}/${modulename}/Modulefile":
    ensure  => file,
    content => template('skeleton/puppetmodule/Modulefile.erb'),
    require => File["${basedir}/${modulename}"],
  }

  file { "${basedir}/${modulename}/README.rdoc":
    ensure  => file,
    content => template('skeleton/puppetmodule/README.rdoc.erb'),
    require => File["${basedir}/${modulename}"],
  }

  file { "${basedir}/${modulename}/Rakefile":
    ensure  => file,
    source => 'puppet:///modules/skeleton/puppetmodule/Rakefile',
    require => File["${basedir}/${modulename}"],
  }

  file { "${basedir}/${modulename}/examples":
    ensure => directory,
    require => File["${basedir}/${modulename}"],
  }

  file { "${basedir}/${modulename}/examples/init.pp":
    ensure  => file,
    content => template('skeleton/puppetmodule/examples/init.pp.erb'),
    require => File["${basedir}/${modulename}/examples"],
  }

  file { "${basedir}/${modulename}/manifests":
    ensure => directory,
    require => File["${basedir}/${modulename}"],
  }

  file { "${basedir}/${modulename}/manifests/init.pp":
    ensure  => file,
    content => template('skeleton/puppetmodule/manifests/init.pp.erb'),
    require => File["${basedir}/${modulename}/manifests"],
  }

  file { "${basedir}/${modulename}/spec":
    ensure => directory,
    require => File["${basedir}/${modulename}"],
  }

  file { "${basedir}/${modulename}/spec/spec_helper.rb":
    ensure  => file,
    source => 'puppet:///modules/skeleton/puppetmodule/spec/spec_helper.rb',
    require => File["${basedir}/${modulename}/spec"],
  }

  file { "${basedir}/${modulename}/spec/classes":
    ensure => directory,
    require => File["${basedir}/${modulename}/spec"],
  }

  file { "${basedir}/${modulename}/spec/classes/${modulename}_spec.rb":
    ensure  => file,
    content => template('skeleton/puppetmodule/spec/classes/modulename_spec.rb.erb'),
    require => File["${basedir}/${modulename}/spec/classes"],
  }
}
