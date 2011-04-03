package VimPerl;
use Moose;
use Curses;

use VimPerl::ModeManager;

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

    # init screen
    initscr;
    start_color;

    # init settings
    cbreak;
    clear;
    noecho;

    my $mode_manager;
    eval {
        $mode_manager = VimPerl::ModeManager->new;
    };
    if ($@) {
        endwin;
        die $@;
    }
    while (my $ch = getch) {
        unless ($mode_manager->invoke($ch)) {
            endwin;
            last;
        }
#        if ($mode eq "insert") {
#            if ($ch eq '') {
#                # ESC to exit insert mode
#                $mode = "normal";
#            }
#            else {
#                addch($ch);
#            }
#        }
#        elsif ($mode eq "command") {
#            if ($ch eq 'q') {
#                endwin;
#                last;
#            }
#        }
#        elsif ($mode eq "normal") {
#            if ($ch eq ':') {
#                $mode = "command";
#            }
#            elsif ($ch eq 'i') {
#                $mode = "insert";
#            }
#        }
    }
}

1;
