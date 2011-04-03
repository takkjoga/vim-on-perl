package VimPerl::Mode::Insert;
use Moose;
with "VimPerl::Mode::Base";

use Curses;

sub invoke {
    my ($self, $ch) = @_;
    if ($ch eq '') {
        # ESC to exit insert mode
        $self->change_mode('Normal');
    }
    else {
        addch($ch);
    }
    return 1;
}

1;
