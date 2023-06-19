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
  $self->render(
    template  => 'layouts/login',
  );
}

# Action login
sub login($self) {
  my $validation  = $self->validation;
  my $email       = $self->param('email');
  my $password    = $self->param('password');
  # Check empty email password
  if(!$email || !$password) {
    return $self->render(
      template  => 'layouts/login',
      message   => 'Địa chỉ email và mật khẩu không được bỏ trống'
    );
  # Check valid characters
  } else {
    $validation->required('email')->like(qr/^\w+@\w+\.\w+$/);
    if ($validation->has_error) {
      return $self->render(
        template  => 'layouts/login',
        message   => 'Địa chỉ email không đúng định dạng'
      );
    }
    $validation->required('password')->size(6, 20);
    if ($validation->has_error) {
      return $self->render(
        template  => 'layouts/login',
        message   => 'Mật khẩu phải từ 6 đến 20 ký tự'
      );
    }
    my $get_user = $self->rs('User')->search({ email => $email })->first;
    if ($get_user && $self->validate_password($get_user->get_column('password'), $password)) {
      $self->session(logged_in => 1);   
      $self->session(experation => 600);
      return $self->render(
        template => 'layouts/success',
        message  => 'Đăng nhập thành công'
      );
    } else {
      return $self->render(
        template => 'layouts/login',
        message  => 'Tài khoản này không tồn tại, bạn vui lòng tạo tài khoản để đăng nhập'
      );
    }
  }
}

# Action Logout 
sub logout($self) {
  $self->logout;
  $self->session(expires => 1);
  return $self->redirect_to('/form_login');
}

1;