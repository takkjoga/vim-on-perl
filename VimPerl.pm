package VimPerl;
use strict;
use warnings;

use Moose;
use Curses;

my $VERSION = "VimPerl 0.0.1";

has arguments => (
    is => 'ro',
    isa => "VimPerl::BootArguments",
);

sub run {
    my $self = shift;

    my $args = $self->arguments;
    if ($args->version) {
        print "$VERSION\n";
        exit;
    }
    elsif ($args->startuptime) {
        print "startuptime\n";
        exit;
    }

    $self->init_locale;
    $self->early_arg_scan;

    initscr;
    clear;
    noecho;
    while (my $ch = getch) {
        if ($ch eq 'q') {
            endwin;
            last;
        }
        addch($ch);
    }
}

sub init_locale {
}

sub early_arg_scan {
}

1;
