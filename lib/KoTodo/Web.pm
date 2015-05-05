package KoTodo::Web;

use strict;
use warnings;
use utf8;
use Kossy;
use DBI;

use KoTodo::Controller::Task;

sub _controller {
    my ($self, $controller_name) = @_;
    my $db_path = $self->root_dir . '/db/kotodo.db';
    my $dbh = DBI->connect('dbi:SQLite:dbname=' . $db_path);
    $self->{_controller}->{$controller_name} ||= eval "KoTodo::Controller::$controller_name->new(" . '$dbh' . ")";
}

filter 'set_title' => sub {
    my $app = shift;
    sub {
        my ( $self, $c )  = @_;
        $c->stash->{site_name} = __PACKAGE__;
        $app->($self,$c);
    }
};

get '/' => [qw/set_title/] => sub {
    my ( $self, $c )  = @_;
    my $tasks = $self->_controller('Task')->index;
    $c->render('index.tx', { greeting => "Hello", tasks => $tasks });
};

get '/json' => sub {
    my ( $self, $c )  = @_;
    my $result = $c->req->validator([
        'q' => {
            default => 'Hello',
            rule => [
                [['CHOICE',qw/Hello Bye/],'Hello or Bye']
            ],
        }
    ]);
    $c->render_json({ greeting => $result->valid->get('q') });
};


#------------------------------
# APIs are as follows
#------------------------------

my $API = 'api';

# get a list of all todos
my $index = sub {
    my ($self, $c)  = @_;
    my $todos = $self->_controller('Task')->index;
    $c->render_json(+{todos => $todos});
};

get "/$API/todos/"     => $index;
get "/$API/todos.json" => $index;

# create a new todo
my $create = sub {
    my ($self, $c) = @_;
    $c->env->{'kossy.request.parse_json_body'} = 1;
    my $params = $c->req->body_parameters;
    my $res = $self->_controller('Task')->create($params);
    $c->render_json($res);
};

post "/$API/todos/" => $create;

# delete a todo
my $delete = sub {
    my ($self, $c) = @_;
    my $id = $c->args->{id};
    my $res = $self->_controller('Task')->delete($id);
    $c->render_json($res);
};

router 'DELETE' => "/$API/todos/:id" => $delete;

1;
