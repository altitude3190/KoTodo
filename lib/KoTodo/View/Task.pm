package KoTodo::View::Task;

use strict;
use warnings;
use utf8;

use KoTodo::Model::Task;

sub new {
    my ($class, $dbh) = @_;
    bless +{
        _model => KoTodo::Model::Task->new($dbh),
    }, $class;
}

sub show_tasks {
    my $self = shift;
    my $all_tasks = $self->{_model}->select_all;
}

1;

