package perl_training::Model::MUser;
use Mojo::Base -base;
use POSIX qw(strftime);

has 'schema';

has rs => sub {
	return shift->schema->resultset('User');
};

#Phương thức lấy tất cả dữ liệu từ 1 bảng nào đó
sub all {
	my $records = shift->rs->search({});
	my $list_admin_item = [];
	while (my $item = $records->next) {
		push @$list_admin_item, { $item->get_columns };
	}
	return $list_admin_item;
}
# sub get_email {
# 	my $result = shift->rs->search({email => $email})->first;
# 	return $result; 
# }

1;
