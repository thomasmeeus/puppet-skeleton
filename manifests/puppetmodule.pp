class skeleton::puppetmodule($modulename, $basedir, $username, $overwrite = false) {

  File {
    replace => $overwrite
  }

  file { "${basedir}/${modulename}":
    ensure => directory,
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

  file { [ "${basedir}/${modulename}/tasks", "${basedir}/${modulename}/tasks/rake", 
            "${basedir}/${modulename}/tasks/rake/lib", "${basedir}/${modulename}/tasks/rake/lib/packaging" ]:
    ensure => directory,
    require => File["${basedir}/${modulename}"],
  }

  file { "${basedir}/${modulename}/tasks/env.rb":
    ensure  => file,
    source => 'puppet:///modules/skeleton/puppetmodule/tasks/env.rb',
    require => File["${basedir}/${modulename}/tasks"],
  }

  file { "${basedir}/${modulename}/tasks/Gemfile":
    ensure  => file,
    source  => 'puppet:///modules/skeleton/puppetmodule/tasks/Gemfile',
    require => File["${basedir}/${modulename}/tasks"],
  }

  file { "${basedir}/${modulename}/tasks/rake/clean.rake":
    ensure  => file,
    source  => 'puppet:///modules/skeleton/puppetmodule/tasks/rake/clean.rake',
    require => File["${basedir}/${modulename}/tasks/rake"],
  }

  file { "${basedir}/${modulename}/tasks/rake/deb.rake":
    ensure  => file,
    source  => 'puppet:///modules/skeleton/puppetmodule/tasks/rake/deb.rake',
    require => File["${basedir}/${modulename}/tasks/rake"],
  }

  file { "${basedir}/${modulename}/tasks/rake/doc.rake":
    ensure  => file,
    source  => 'puppet:///modules/skeleton/puppetmodule/tasks/rake/doc.rake',
    require => File["${basedir}/${modulename}/tasks/rake"],
  }

  file { "${basedir}/${modulename}/tasks/rake/jenkins.rake":
    ensure  => file,
    source  => 'puppet:///modules/skeleton/puppetmodule/tasks/rake/jenkins.rake',
    require => File["${basedir}/${modulename}/tasks/rake"],
  }

  file { "${basedir}/${modulename}/tasks/rake/rpm.rake":
    ensure  => file,
    source  => 'puppet:///modules/skeleton/puppetmodule/tasks/rake/rpm.rake',
    require => File["${basedir}/${modulename}/tasks/rake"],
  }

  file { "${basedir}/${modulename}/tasks/rake/spec.rake":
    ensure  => file,
    source  => 'puppet:///modules/skeleton/puppetmodule/tasks/rake/spec.rake',
    require => File["${basedir}/${modulename}/tasks/rake"],
  }

  file { "${basedir}/${modulename}/tasks/rake/style.rake":
    ensure  => file,
    source  => 'puppet:///modules/skeleton/puppetmodule/tasks/rake/style.rake',
    require => File["${basedir}/${modulename}/tasks/rake"],
  }

  file { "${basedir}/${modulename}/tasks/rake/syntax.rake":
    ensure  => file,
    source  => 'puppet:///modules/skeleton/puppetmodule/tasks/rake/syntax.rake',
    require => File["${basedir}/${modulename}/tasks/rake"],
  }

  file { "${basedir}/${modulename}/tasks/rake/lib/modulefile_reader.rb":
    ensure  => file,
    source  => 'puppet:///modules/skeleton/puppetmodule/tasks/rake/lib/modulefile_reader.rb',
    require => File["${basedir}/${modulename}/tasks/rake/lib"],
  }

  file { "${basedir}/${modulename}/tasks/rake/lib/packaging/base_packager.rb":
    ensure  => file,
    source  => 'puppet:///modules/skeleton/puppetmodule/tasks/rake/lib/packaging/base_packager.rb',
    require => File["${basedir}/${modulename}/tasks/rake/lib/packaging"],
  }

  file { "${basedir}/${modulename}/tasks/rake/lib/packaging/deb_packager.rb":
    ensure  => file,
    source  => 'puppet:///modules/skeleton/puppetmodule/tasks/rake/lib/packaging/deb_packager.rb',
    require => File["${basedir}/${modulename}/tasks/rake/lib/packaging"],
  }

  file { "${basedir}/${modulename}/tasks/rake/lib/packaging/rpm_packager.rb":
    ensure  => file,
    source  => 'puppet:///modules/skeleton/puppetmodule/tasks/rake/lib/packaging/rpm_packager.rb',
    require => File["${basedir}/${modulename}/tasks/rake/lib/packaging"],
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

  file { "${basedir}/${modulename}/spec/spec.opts":
    ensure  => file,
    source  => 'puppet:///modules/skeleton/puppetmodule/spec/spec.opts',
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
