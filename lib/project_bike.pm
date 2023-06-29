package project_bike;
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

  # Router action list 
  $r->get('/list')->to('UserController#index');
  
  # Router action form_login 
  $r->get('/form_login')->to('UserController#form_login');

  # Router action login 
  $r->post('/login')->to('UserController#login');

  # Router action form_register
  $r->get('/form_register')->to('UserController#form_register');

  # Router action register
  $r->post('/register')->to('UserController#register');

  # Router action home page
  $r->get('/')->to('PageController#get_products');
  
  # Router action product page
  $r->get('/detail_product')->to('PageController#get_product_detail');


  
}

1;
