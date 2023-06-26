package project_bike::Controller::UserController;
use Mojo::Base 'Mojolicious::Controller',-signatures;
use project_bike::Model::MUser;
use Email::Valid;
use Crypt::PBKDF2;


# Define sub from model-user
has _MUser => sub($self) {
  return project_bike::Model::MUser->new({ schema => $self->schema });
};

# Action List users 
sub index($self) {
  my $data = $self->_MUser->all;
  return $self->render(
    template => 'auth/list',
    users    => $data
  );
}

# Action from register
sub form_register($self) {
  return $self->render(
    template  => 'auth/register',
  );
}

# Action register
sub register($self) {
  my $email       = $self->param('email'); 
  my $username    = $self->param('username');
  my $validation  = $self->validation;
  my $password    = $self->generate($self->param('password'));
  my $phone       = $self->param('phone');
  my $fullname    = $self->param('fullname');
  my $gender      = $self->param('gender');
  my $address     = $self->param('address');
  if(!$email || !$password || !$username || !$phone || !$fullname || !$gender || !$address) {
    return $self->render(
      template  => 'auth/register' ,
      message   => 'Tên đăng nhập, mật khẩu, họ tên, địa chỉ, email không được để trống' ,
    );
  } else {  
    $validation->required('username')->size(6)->like(qr/^\w+$/);
    if($validation->has_error) {
      return $self->render(
        template  => 'auth/register',
        message   => 'Tên đăng nhập ít nhất phải được 6 ký tự và không được chứa ký tự đặc biệt',
      );
    }
    $validation->required('password')->size(8)->like(qr/(?=.*[0-9])(?=.*[A-Z])(?=.*[\W])/);
    if($validation->has_error) {
      return $self->render(
        template  => 'auth/register',
        message   => 'Mật khẩu có ít nhất 8 ký tự, chứa ít nhất một ký tự số, một ký tự chữ cái viết hoa và một ký tự đặc biệt',
      );
    }
    $validation->optional('phone')->size(10)->like(qr/^\d+$/);
    if($validation->has_error){
      return $self->render(
        template  => 'auth/register',
        message   => 'Số điện thoại phải đủ 10 chữ số',
      );
    }
    $validation->required('fullname')->size(5);
    if ($validation->has_error) {
      return $self->render(
        template  => 'auth/register',
        message   => 'Họ tên phải chứa ít nhất 5 ký tự',
      );
    }
    $validation->required('address')->size(5);
    if ($validation->has_error){
      return $self->render(
        template  => 'auth/register',
        message   => 'Địa chỉ có chứa ít nhất 5 ký tự',
      );
    }
    if(!Email::Valid->address($email)){
      return $self->render(
        template  => 'auth/register',
        message   => 'Địa chỉ email không hợp lệ'
      );
    }
    my $user = $self->_MUser->check_email_exist($email);
    if($user){
      return $self->render(
        template  => 'auth/register',
        message   => 'Tài khoản đã tồn tại',
      );
    }
    my $register = $self->_MUser->register_user($username, $password, $phone, $fullname, $gender, $address, $email);
    if (!$register) {
      return $self->render(
        template  => 'auth/register',
        message   => 'Tạo tài khoản không thành công',
      );
    } else {
      return $self->render(
        template  => 'auth/register',
        message   => 'Tạo tài khoản thành công',
      );
    }
  }
}

# Action form Login
sub form_login($self) {
  return $self->render(
    template  => 'auth/login',
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
      template  => 'auth/login',
      message   => 'Địa chỉ email và mật khẩu không được bỏ trống'
    );
  # Check valid characters
  } else {
    $validation->required('email')->like(qr/^\w+@\w+\.\w+$/);
    if ($validation->has_error) {
      return $self->render(
        template  => 'auth/login',
        message   => 'Địa chỉ email không đúng định dạng'
      );
    }
    $validation->required('password')->size(6, 20);
    if ($validation->has_error) {
      return $self->render(
        template  => 'auth/login',
        message   => 'Mật khẩu phải từ 6 đến 20 ký tự'
      );
    }
    my $get_user = $self->rs('User')->search({ email => $email })->first;
    if ($get_user && $self->validate_password($get_user->get_column('password'), $password)) {
      $self->session(logged_in => 1);   
      $self->session(experation => 600);
      return $self->render(
        template => 'auth/success',
        message  => 'Đăng nhập thành công'
      );
    } else {
      return $self->render(
        template => 'auth/login',
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