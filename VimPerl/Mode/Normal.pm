package VimPerl::Mode::Normal;
use Moose;
with "VimPerl::Mode::Base";

sub invoke {
    my ($self, $ch) = @_;
    if ($ch eq ':') {
        $self->change_mode('Command');
    }
    elsif ($ch eq 'i') {
        $self->change_mode('Insert');
    }
    return 1;
}

1;
