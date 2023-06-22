package perl_training::Model::MCategory;
use Mojo::Base -base;

has 'schema';

has rsMCategory => sub {
    return shift->schema->resultset('Category');
};

sub get_list_category {
    my $record = shift->rsMCategory->search({});
    my $list_category = [];
    while (my $item = $record->next) {
        push @$list_category, {$item->get_columns};
    }
    return $list_category;
}
