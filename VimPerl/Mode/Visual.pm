package VimPerl::Mode::Visual;
use Moose;
with "VimPerl::Mode::Base";

sub invoke {
    my ($self, $ch) = @_;
    return 1;
}

1;
