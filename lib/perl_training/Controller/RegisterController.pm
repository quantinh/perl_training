package perl_training::Controller::RegisterController;
use Mojo::Base 'Mojolicious::Controller', -signatures;
use Mojo::JSON qw(encode_json);
use Crypt::PBKDF2;
use Email::Valid;
use Mojo::Parameters;
use POSIX qw(strftime);

has _MUser => sub ($self){
  return perl_training::Model::MUser->new(
      { schema => $self->schema });
};

sub index ($self) {
  $self->render(
        template => 'Register/register',
  );
}

sub register_user($self){
    my $c = shift;
    my $email          = $c->param('email'); 
    my $user_name      = $c->param('user_name');
    my $validation     = $self->validation;
    my $password       = $self->generate($c->param('password'));
    my $phone          = $c->param('phone');
    my $full_name      = $c->param('full_name');
    my $gender         = $c->param('gender');
    my $address        = $c->param('address');
    if(! $email || !$password || ! $user_name || ! $phone || ! $full_name || ! $gender || ! $address){
        return $self->render(
            template => 'Register/register' ,
            ok => Mojo::JSON->false,
            code => '202',
            message => 'Tên đăng nhập, Mật khẩu, Họ tên, Địa chỉ, Email không được để trống.' ,
            status => 400
        );
    } else {  
        $validation->required('user_name')->size(6)->like(qr/^\w+$/);
        if($validation->has_error){
            return $self->render(
                template => 'Register/register',
                message => 'Tên đăng nhập ít nhất phải được 6 ký tự và không được chứa ký tự đặc biệt.',
            );
        }
        $validation->required('password')->size(8)->like(qr/(?=.*[0-9])(?=.*[A-Z])(?=.*[\W])/);
        if($validation->has_error){
            return $self->render(
                template => 'Register/register',
                message => 'Mật khẩu có ít nhất 8 ký tự, chứa ít nhất một ký tự số, một ký tự chữ cái viết hoa và một ký tự đặc biệt.',
            );
        }
        $validation->optional('phone')->size(10)->like(qr/^\d+$/);
        if($validation->has_error){
            return $self->render(
                template => 'Register/register',
                message => 'Số điện thoại phải đủ 10 chữ số',
            );
        }
        $validation->required('full_name')->size(5);
        if ($validation->has_error) {
            return $self->render(
                template => 'Register/register',
                message => 'Họ tên phải chứa ít nhất 5 ký tự',
            );
        }
        $validation->required('address')->size(5);
        if ($validation->has_error){
            return $self->render(
                template => 'Register/register',
                message => 'Địa chỉ có chứa ít nhất 5 ký tự',
            );
        }
        if(!Email::Valid->address($email)){
            return $self->render(
                template => 'Register/register',
                message => 'Địa chỉ email không hợp lệ'
            );
        }
        my $user = $self->_MUser->check_Email_Exist($email);
        if($user){
            return $self->render(
                template => 'Register/register',
                ok => Mojo::JSON->false,
                code => '202',
                message => 'Tài khoản đã tồn tại.',
                status => 400
            );
        }
        my $register = $self->_MUser->register_user($user_name, $password, $phone, $full_name, $gender, $address, $email);
        if (!$register) {
            return $self->render(
                template => 'Register/register',
                ok => Mojo::JSON->false,
                code => '202',
                message => 'Tạo tài khoản không thành công.',
                status => 400
            );
        }else{
            return $self->render(
                template => 'Register/register',
                ok => Mojo::JSON->true,
                code => '200',
                message => 'Tạo tài khoản thành công.',
                status => 200
            );
        }
    }
}

1;