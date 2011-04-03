package VimPerl::Mode::Normal;
use Moose;
with "VimPerl::Mode::Base";

sub invoke {
    my ($self, $ch) = @_;
    if ($ch eq ':') {
        $self->changeMode('Command');
    }
    elsif ($ch eq 'i') {
        $self->changeMode('Insert');
    }
    return 1;
}

1;
