package VimPerl::Mode::Command;
use Moose;
with "VimPerl::Mode::Base";

sub invoke {
    my ($self, $ch) = @_;
    if ($ch eq 'q') {
        return 0;
    }
    return 1;
}

1;
