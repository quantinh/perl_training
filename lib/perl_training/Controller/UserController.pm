package perl_training::Controller::UserController;
use Mojo::Base 'Mojolicious::Controller',-signatures;
use perl_training::Model::MUser;
use Convert::Base64;
use Mojo::Upload;
use Cwd qw();
use Mojo::JSON qw(encode_json);
use Crypt::PBKDF2;
use Email::Valid;


# Define sub from model-user
has _MUser => sub ($self){
  return perl_training::Model::MUser->new({ schema => $self->schema });
};

# Action List users 
sub index ($self) {
  my $data = $self->_MUser->all;
  $self->render(
    template      => 'layouts/index',
    users         => $data,
  );
}

# Action formLogin
sub formLogin($self) {
  #Invalid error
  $self->render(
    template  => 'layouts/login',
  );
}

# Action login
sub login($self) {
  my $email       = $self->param('email');
  my $password    = $self->param('password');
  my @valid_input = $self->validate_form($email, $password);
  if(scalar @valid_input > 0){
    return $self->render(
      ok        => Mojo::JSON->false,
      code      => '202',
      message   => [
        @valid_input
      ]
    );
  }

  sub login($self) {
  my $email       = $self->param('email');
  my $password    = $self->param('password');
  my @valid_input = $self->validate_form($email, $password);
  if (scalar @valid_input > 0) {
    return $self->render(
      template => 'login.html',
      message  => join(', ', @valid_input),
    );
  }
  # Rest of the code...
}

  # Do not continue on invalid input and render a default 400 error document.
  my $get_user = $self->rs('User')->search({ email => $email })->first;
  if($get_user && $self->validate_password($get_user->get_column('password'), $password)) {
    my $user_infor = [];
    push @$user_infor, { $get_user->get_columns };
    $self->render(
      template  => 'layouts/login',
      ok        => Mojo::JSON->true,
      code      => '200',
      message   => 'Xác thực thành công" (message được định nghĩa trong file message)',
      token     => "0k4TSS4SSkanA6CRl541wxZmWnXzbOZCXVgIen54JMweiWT5eAh8Y1ZiBK2ZOHGf9G1C",
      data      => [
        user_infor => @$user_infor
      ]
    );
  } else {
    return $self->render(
      ok        => Mojo::JSON->false,
      code      => '202',
      message   => 'Không kết nối được với máy chủ.',
      status    => 400
    );
  }
}

# Action validate form
sub validate_form($self, $email, $password) {
  my @errors = ();
  unless(Email::Valid->address($email)) {
    push(@errors, 'Email không chính xác');
  }
  # Check email not null
  if($password eq "") {
    push(@errors, 'Pasword không chính xác');
  }
  return @errors;
}

1;