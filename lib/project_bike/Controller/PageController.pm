package project_bike::Controller::PageController;
use Mojo::Base 'Mojolicious::Controller',-signatures;
use project_bike::Model::MBrand;
use project_bike::Model::MCategory;
use project_bike::Model::MProduct;

has _MBrand => sub($self) {
  return project_bike::Model::MBrand->new({ schema => $self->schema });
};

has _MCategory => sub($self) {
  return project_bike::Model::MCategory->new({ schema => $self->schema });
};

has _MProduct => sub($self) {
  return project_bike::Model::MProduct->new({ schema => $self->schema });
};


# Action List products 
sub get_products($self) {
  my $list_category = $self->_MCategory->get_list_category;
  my $list_brand    = $self->_MBrand->get_list_brand;
  my $list_product  = $self->_MProduct->get_product_detail;
  return $self->render(
    template          => 'pages/home',
    categories        => $list_category,
    brands            => $list_brand,
    product_details   => $list_product
  );
}

# Action List products detail 
sub get_product_detail($self) {
  return $self->render(
    template          => 'pages/product_detail',
  );
}




1;
