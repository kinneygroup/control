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
  include hiera
}
hiera_include('classes')
