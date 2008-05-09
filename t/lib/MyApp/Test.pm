package MyApp::Test;
use strict;
use base 'MyApp';

use constant subcommands => ('hate');
use constant options => ( 'v|verbose' => 'verbose',
			);
use CLITest;

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

1;
