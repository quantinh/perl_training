package perl_training::Model::MProduct;
use Mojo::Base -base;

has 'schema';

# Arrow functions correct table User from Schema/User
has rs => sub {
    return shift->schema->resultset('ProductDetail');
};

# Function get all products details
sub get_product_detail {
    my $record = shift->rs->search({}, { join => 'product' });
    my $list_product_item = [];
    while (my $item = $record->next) {
        push @$list_product_item, { $item->get_columns };
    }
    return $list_product_item;
}

1;
