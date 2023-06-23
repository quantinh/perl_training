package perl_training::Model::MBrand;
use Mojo::Base -base;

has 'schema';

# Arrow functions correct table User from Schema/User
has rs => sub {
    return shift->schema->resultset('Brand');
};

# Function get all brands
sub get_list_brand {
    my $records = shift->rs->search({});
    my $list_brand_item = [];
    while(my $item = $records->next) {
        push @$list_brand_item, { $item->get_columns };
    }
    return $list_brand_item;
}

1;
