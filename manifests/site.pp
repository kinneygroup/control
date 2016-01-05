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
  include army_classification
  include common
  include securehosts
  include splunkforwarder
  include types
  include timezone
  include dib
  include oracletasks
}

hiera_include('classes')
