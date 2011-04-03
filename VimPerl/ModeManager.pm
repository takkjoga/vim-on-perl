package VimPerl::ModeManager;
use Moose;

use VimPerl::Mode::Normal;
use VimPerl::Mode::Command;
use VimPerl::Mode::Visual;
use VimPerl::Mode::Insert;

my @modes = qw( Normal Command Visual Insert );
my %class_map = map { $_ => "VimPerl::Mode::" . $_ } @modes;
#BEGIN {
#    for (values %class_map) {
#        print "$_\n";
#        eval { "use $_;" };
#    }
#}

has mode_map => (
    is => 'ro',
    default => sub {
        my $self = shift;
        my %map;
        for (keys %class_map) {
            $map{$_} = $class_map{$_}->new(parent => $self);
        }
        return \%map;
    },
);

has mode => (
    is => 'rw',
    isa => "VimPerl::Mode::Base",
    default => sub {
        my $self = shift;
        return $self->mode_map->{Normal};
    },
);

sub invoke {
    my ($self, $ch) = @_;
    return $self->mode->invoke($ch);
}

1;
