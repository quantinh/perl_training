package perl_training::Model::MUser;
use Mojo::Base -base;
use POSIX qw(strftime);

has 'schema';

# Arrow functions correct table User from Schema/User
has rs => sub {
	return shift->schema->resultset('User');
};

# Function get all ursers
sub all {
	my $records = shift->rs->search({});
	my $list_admin_item = [];
	while (my $item = $records->next) {
		push @$list_admin_item, { $item->get_columns };
	}
	return $list_admin_item;
}

1;
