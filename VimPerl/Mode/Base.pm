package VimPerl::Mode::Base;
use Moose::Role;

requires "invoke";

has parent => (
    is => 'ro',
    isa => "VimPerl::ModeManager",
);

sub changeMode {
    my ($self, $mode) = @_;
    my $mode_obj = $self->parent->mode_map->{$mode};
    $self->parent->mode($mode_obj);
}

1;
