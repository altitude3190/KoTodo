package KoTodo::Model::Task;

use strict;
use warnings;
use utf8;

sub new {
    my ($class, $dbh) = @_;
    bless +{
        _dbh => $dbh,
    }, $class;
}

sub select_all {
    my $self = shift;
    my $sth = $self->{_dbh}->prepare("SELECT * FROM tasks");
    $sth->execute();
    $self->_make_object($sth);
}

sub _make_object {
    my ($self, $sth) = @_;
    my @result_object = ();
    while(my $row = $sth->fetchrow_hashref()) {
        push @result_object, $row;
    }
    \@result_object;
}

1;

