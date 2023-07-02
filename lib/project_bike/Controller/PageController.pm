package project_bike::Controller::PageController;
use Mojo::Base 'Mojolicious::Controller',-signatures;
use project_bike::Model::MBrand;
use project_bike::Model::MCategory;
use project_bike::Model::MProduct;
use Data::Dumper;

has _MCategory => sub($self) {
  return project_bike::Model::MCategory->new({ schema => $self->schema });
};

has _MBrand => sub($self) {
  return project_bike::Model::MBrand->new({ schema => $self->schema });
};

has _MProduct => sub($self) {
  return project_bike::Model::MProduct->new({ schema => $self->schema });
};


# Action List products 
sub get_products($self) {
  my $list_category = $self->_MCategory->get_list_category;
  my $list_brand    = $self->_MBrand->get_list_brand;
  my $list_product  = $self->_MProduct->get_products;
  return $self->render(
    categories        => $list_category,
    brands            => $list_brand,
    product_details   => $list_product,
    template          => 'pages/home'
  );
}

# Action List products detail 
sub get_product_detail($self) {
  my $product_id        = $self->param('id');
  # Lấy chi tiết sản phẩm
  my $product_detail    = $self->_MProduct->get_product_detail($product_id);
  # Lấy sản phẩm tương ứng để lấy ra thương hiệu tương ứng từ bảng products
  my $product           = $product_detail->product;
  # Lấy brand_id của sản phẩm
  my $brand_id          = $product->brand_id;
  # Lấy thông tin nhãn hiệu từ brand_id
  my $brand             = $self->_MBrand->get_brand_by_id($brand_id);
  # Lấy danh sách các sản phẩm gợi ý
  my $related_products  = $self->_MProduct->get_related_products($product_id, 5); 
  
  return $self->render(
    product_detail    => $product_detail,
    product           => $product,
    related_products  => $related_products,
    brand             => $brand,
    template          => 'pages/product_detail'
  );
}
    
    








1;
