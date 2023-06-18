package perl_training;
use Mojo::Base 'Mojolicious', -signatures;
use Mojo::Base 'Mojo::EventEmitter', -signatures;

# This method will run once at server start
sub startup ($self) {
  $self->plugin('Helper');
	$self->plugin('RenderFile');

  # Load configuration from config file
  my $config = $self->plugin('NotYAMLConfig');

  # Configure the application
  $self->secrets($config->{secrets});
	$self->hook(after_dispatch => sub {
		my $c = shift;
		$c->res->headers->header('Access-Control-Allow-Origin' => '*');
		$c->res->headers->access_control_allow_origin('*');
		$c->res->headers->header('Access-Control-Allow-Methods' => 'GET, OPTIONS, POST, DELETE, PUT');
		$c->res->headers->header('Access-Control-Allow-Headers' => 'Content-Type' => 'application/x-www-form-urlencoded');
	});
  
  # Router
  my $r = $self->routes;

  $r->get('/')->to('UserController#index');
  
  $r->get('/form_login')->to('UserController#form_login');

  $r->post('/login')->to('UserController#login');

}

1;
