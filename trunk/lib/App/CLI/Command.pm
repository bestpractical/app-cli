package App::CLI::Command;
use strict;
use warnings;

=head1 NAME

App::CLI::Command - Base class for App::CLI commands

=head1 SYNOPSIS

  package MyApp;
  use base 'App::CLI';

  package main;

  MyApp->dispatch;

  package MyApp::Help;
  use base 'App::CLI::Command';

  sub options {
    ('verbose' => 'verbose');
  }

  sub run {
    my ($self, $arg) = @_;
  }

=head1 DESCRIPTION


=cut

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

=head1 TODO

More documentation

=head1 SEE ALSO

L<App::CLI>

=head1 AUTHORS

Chia-liang Kao E<lt>clkao@clkao.orgE<gt>

=head1 COPYRIGHT

Copyright 2005 by Chia-liang Kao E<lt>clkao@clkao.orgE<gt>.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

See L<http://www.perl.com/perl/misc/Artistic.html>

=cut

1;
