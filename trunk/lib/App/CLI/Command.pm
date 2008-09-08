package App::CLI::Command;

use constant subcommands => ();
use constant options => ();

sub new {
    my $class = shift;
    my $self = bless {}, $class;
    %$self = @_;
    return $self;
}

sub command_options {
    ( (map { $_ => $_ } $_[0]->subcommands),
      $_[0]->options );
}

sub run_command {
    my $self = shift;
    $self->run(@_);
}

sub subcommand {
    my $self = shift;
    my @cmd = $self->subcommands;
    @cmd = values %{{$self->options}} if @cmd && $cmd[0] eq '*';
    for (grep {$self->{$_}} @cmd) {
	no strict 'refs';
	if (exists ${ref($self).'::'}{$_.'::'}) {
	    bless ($self, (ref($self)."::$_"));
	    last;
	}
    }
}

1;
