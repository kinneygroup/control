# Define filebucket 'main':
filebucket { 'main':
  server => 'puppetmaster.ent.dped.local',
  path   => false,
}

# Make filebucket 'main' the default backup location for all File resources:
File {
  backup => false,
  ignore => [ '.bzr',
              '.git',
              '.svn',
              'CVS' ],
}
node 'puppetmaster.ent.dped.local' {
  #include hiera
}

node 'dcgsmdc.searisc.dped.local' {
  include mdc_master
}

hiera_include('classes')

if versioncmp($::puppetversion,'3.6.1') >= 0 {

  $allow_virtual_packages = hiera('allow_virtual_packages',false)

  Package {
    allow_virtual => $allow_virtual_packages,
  }
}
