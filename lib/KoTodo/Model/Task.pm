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

sub create {
    my ($self, $params) = @_;
    my $sth = $self->{_dbh}->prepare(
        "INSERT INTO tasks (task, deadline, created_at, updated_at) VALUES (?, ?, ?, ?)"
    );
    $sth->execute($params->{task}, $params->{deadline}, $params->{created_at}, $params->{updated_at});
}

sub delete {
    my ($self, $id) = @_;
    my $sth = $self->{_dbh}->prepare("DELETE FROM tasks WHERE id = ?");
    $sth->execute($id);
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

