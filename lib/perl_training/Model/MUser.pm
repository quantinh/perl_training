package perl_training::Model::MUser;
use Mojo::Base -base;

has 'schema';

# Arrow functions correct table User from Schema/User
has rs => sub {
	return shift->schema->resultset('User');
};

# Function get all ursers
sub all {
	my $records = shift->rs->search({});
	my $list_admin_item = [];
	while(my $item = $records->next) {
		push @$list_admin_item, { $item->get_columns };
	}
	return $list_admin_item;
}

# Function insert a new record users 
sub register_user {
    my $self       = shift;
    my $username   = shift;
    my $password   = shift;
    my $phone      = shift; 
    my $fullname   = shift;
    my $gender     = shift; 
    my $address    = shift;
    my $email      = shift;
    my $result     = $self->schema->resultset('User')->create({
        username => $username,
        password => $password,
        phone    => $phone,
        fullname => $fullname,
        gender   => $gender,
        address  => $address,
        email    => $email
    });
    return $result;
}

# Function check email user exits
sub check_email_exist {
    my($self, $email) = @_;
    my $result = $self->rs->search({email => $email})->first;
	return $result;
}


1;
