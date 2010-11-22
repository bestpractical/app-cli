package MyApp::Test;
use strict;
use base 'MyApp';

use constant subcommands => qw(hate Cascading);
use constant options => ( 'v|verbose' => 'verbose',
			);
use CLITest;

sub run {
    my $self = shift;
    if ($self->cascading) {
      $self->cascading->run_command;
    } else {
      cliack($self->{verbose} ? 'v' : '', @_);
    }
}

package MyApp::Test::hate;
use base 'MyApp::Test';
use CLITest;

sub run {
    my $self = shift;
    cliack($self->{verbose} ? 'v' : '', 'hate', @_);
}

package MyApp::Test::Cascading;
use base qw(App::CLI::Command);
use CLITest;
use Data::Dumper;

sub run {
  my $self = shift;
  cliack();
}


1;
