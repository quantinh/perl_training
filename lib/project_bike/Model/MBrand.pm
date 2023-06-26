package project_bike::Model::MBrand;
use Mojo::Base -base;

has 'schema';

# Arrow functions correct table User from Schema/User
has rsMBrand => sub {
    return shift->schema->resultset('Brand');
};

# Function get all brands
sub get_list_brand {
    my $records = shift->rsMBrand->search({});
    my $list_brand_item = [];
    while(my $item = $records->next) {
        push @$list_brand_item, { $item->get_columns };
    }
    return $list_brand_item;
}

1;
