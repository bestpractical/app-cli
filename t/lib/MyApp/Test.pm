package MyApp::Test;
use strict;
use base 'MyApp';
use CLITest;
use constant subcommands => qw(hate Cascading);
use constant options => (
    'v|verbose' => 'verbose',
);

sub run {
    my $self = shift;
    cliack($self->{verbose} ? 'v' : '', @_);
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
    "name=s" => "name",
);

sub run {
  my $self = shift;
  cliack($self->{name}, $self->{help} ? "help" : "");
}



package MyApp::Test::Cascading::Infinite;
use base qw(App::CLI::Command);
use CLITest;
use constant subcommands => qw(Subcommands);

sub run {
  my $self = shift;
  cliack;
}



package MyApp::Test::Cascading;
use base qw(App::CLI::Command);
use CLITest;
use constant subcommands => qw(Infinite);

sub run {
  my $self = shift;
  cliack;
}


1;
