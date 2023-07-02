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

# Function get a brands by id of detal product
sub get_brand_by_id {
    my ($self, $brand_id) = @_;
    my $brand = $self->schema->resultset('Brand')->find($brand_id);
    return $brand;
}
1;
