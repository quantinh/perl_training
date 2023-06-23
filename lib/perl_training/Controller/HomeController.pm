package perl_training::Controller::HomeController;
use Mojo::Base 'Mojolicious::Controller',-signatures;
use perl_training::Model::MBrand;
use perl_training::Model::MCategory;
use perl_training::Model::MProduct;

has _MBrand => sub($self) {
  return perl_training::Model::MBrand->new({ schema => $self->schema });
};

has _MCategory => sub($self) {
  return perl_training::Model::MCategory->new({ schema => $self->schema });
};

has _MProduct => sub($self) {
  return perl_training::Model::MProduct->new({ schema => $self->schema });
};

# Testing brand
# sub get_test($self) {
#   my $data = $self->_MBrand->get_list_brand;
#   return $self->render(
#     template  => 'pages/home',
#     brands    => $data
#   );
# }

# Testing product detail
# sub get_test($self) {
#   my $data = $self->_MCategory->get_list_category;
#   return $self->render(
#     template  => 'pages/home',
#     brands    => $data
#   );
# }

# sub get_test($self) {
#   my $data = $self->_MProduct->get_product_detail;
#   return $self->render(
#     template  => 'pages/home',
#     brands    => $data
#   );
# }

sub get_brands($self) {
  my $data = $self->_MBrand->get_list_brand;
  return $self->render(
    template  => 'pages/home',
    brands    => $data
  );
}

sub get_categories($self) {
  my $data = $self->_MCategory->get_list_category;
  return $self->render(
    template   => 'pages/home',
    categories => $data
  );
}

sub get_items {
  my $self = shift;
  my $list_brand = $self->_MBrand->get_list_brand;
  my $list_category = $self->_MCategory->get_list_category;
  my $list_product = $self->_MProduct->get_product_detail;
  return $self->render(
    template        => 'pages/home',
    categories      => $list_category,
    product_details => $list_product,
    brands          => $list_brand
  );
}



1;
