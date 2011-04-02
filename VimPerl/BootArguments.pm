package VimPerl::BootArguments;
use strict;
use warnings;

use Moose;
with 'MooseX::Getopt';

has version => (
    is => 'ro',
    isa => "Bool",
);

has startuptime => (
    is => 'ro',
    isa => "Str", # --startuptime filename
);

# early_arg_scan, below
has display => (
    is => 'ro',
    isa => "Bool",
);

has servername => (
    is => 'ro',
    isa => "Str",
);

has serverlist => (
    is => 'ro',
    isa => "Str",
);

has remote => (
    is => 'ro',
    isa => "Str",
);

has windowid => (
    is => 'ro',
    isa => "Str",
);

has socketid => (
    is => 'ro',
    isa => "Str",
);

1;
