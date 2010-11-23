package MyApp::Test;
use strict;
use base 'MyApp';

use constant subcommands => qw(hate Cascading);
use constant options => (
    'v|verbose' => 'verbose',
    "name=s"    => "name",
);
use CLITest;

sub run {
    my $self = shift;
    if ($self->cascadable) {
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

package MyApp::Test::Cascading::Infinite::Subcommands;
use base qw(App::CLI App::CLI::Command);
use CLITest;

use constant options => (
    "h|help" => "help",
);

sub run {
  my $self = shift;
  cliack($self->{name});
}

package MyApp::Test::Cascading::Infinite;
use base qw(App::CLI::Command);
use CLITest;

use constant subcommands => qw(Subcommands);

sub run {
  my $self = shift;
  if ($self->cascadable) {
    $self->cascading->run_command;
  } else {
    cliack;
  }
}

package MyApp::Test::Cascading;
use base qw(App::CLI::Command);
use CLITest;

use constant subcommands => qw(Infinite);

sub run {
  my $self = shift;
  if ($self->cascadable) {
    $self->cascading->run_command;
  } else {
    cliack;
  }
}


1;
