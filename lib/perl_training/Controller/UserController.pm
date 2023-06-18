package perl_training::Controller::UserController;
use perl_training::Model::MUser;
use Mojo::Base 'Mojolicious::Controller',-signatures;
use Convert::Base64;
use Mojo::Upload;
use Cwd qw();
use Mojo::JSON qw(encode_json);
use Crypt::PBKDF2;
use Email::Valid;


# Define sub from model-user
has _MUser => sub ($self) {
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

# Action form Login
sub form_login($self) {
  #Invalid error
  my $error = $self->flash('error');
  #Invalid error
  $self->render(
    template  => 'layouts/login',
    error     => $error
  );
}

# Action Login
sub login($self) {
  my $error = {};
  my $email; 
  my $password;
  my $get_user;
  # Check email defined
  if (not defined $self->param('email') or $self->param('email') eq '') {
    $error->{email} = 'Email không được để trống !';
  } else {
    my $email_validator = Email::Valid->new();
    unless ($email_validator->address($self->param('email'))) {
      $error->{email} = 'Email chưa đúng định dạng!';
    } else {
      $email = $self->param('email');
    }
  }
  # Check password defined
  if (not defined $self->param('password') or $self->param('password') eq '') {
    $error->{password} = 'Password không được để trống !';
  } else {
    if ($self->param('password') !~ /^[A-Za-z0-9_\.]{3,32}$/) {
      $error->{password} = 'Password chưa đúng định dạng !';
    } else {
      $password = $self->param('password');
    }
  }
  # Check not error and insert to database
  if (not $error) {
    # Check email có tồn tại trên database hay không tức là đã đăng kí trước đó thì mới cho vào 
    # $get_user = $self->rs('User')->search({ email => $email })->first;
    # if ($get_user && $self->validate_password($get_user->get_column('password'), $password)) {
      $self->session(logged_in => 1);   # Setting sesion logged_in = 1
      $self->session(experation => 600);  # Settings sesion timeout 600s 
      $self->flash(success => 'Đăng nhập thành công');
      return $self->redirect_to('/');
    } else {
      $self->flash(error => 'Email hoặc mật khẩu không chính xác!');
      return $self->redirect_to('/form_login');
    }
  # } 
}

# Action Logout 
sub logout($self) {
  $self->logout;
  $self->session(expires => 1);
  return $self->redirect_to('/form_login');
}

# Action validate form use Email::Valid
# sub validate_form($self, $email, $password) {
#   my @errors = ();
#   # Check email correct format
#   unless(Email::Valid->address($email)) {
#     push(@errors, 'Email chưa được nhập hoặc email không chính xác');
#   }
#   # Check email not null
#   if($password eq "") {
#     push(@errors, 'Pasword chưa được nhập hoặc pasword không chính xác');
#   }
#   return @errors;
# }

# # Action login
# sub login($self) {
#   my $email       = $self->param('email');
#   my $password    = $self->param('password');
#   my @valid_input = $self->validate_form($email, $password);
#   # If errors else show error message
#   if(scalar @valid_input > 0) {
#     return $self->render(
#       template  => 'layouts/login',
#       message   => \@valid_input,
#       # message   => [@valid_input],
#     );
#   }
#   # Get the email form table users
#   my $get_user = $self->rs('User')->search({ email => $email })->first;
#   if($get_user && $self->validate_password($get_user->get_column('password'), $password)) {
#     my $user_infor = [];
#     push @$user_infor, { $get_user->get_columns };
#     return $self->render(
#       template  => 'layouts/login',
#       message   => 'Xác thực thành công',
#     );
#   } else {
#     return $self->render(
#       template  => 'layouts/login',
#       message   => 'Không kết nối được với máy chủ.',
#     );
#   }
# }



1;