package project_bike::Model::MProduct;
use Mojo::Base -base;

has 'schema';

# Arrow functions correct table User from Schema/User
has rsProduct => sub {
    return shift->schema->resultset('ProductDetail');
};

# Function get all products details
sub get_products {
    my $record = shift->rsProduct->search({}, { join => 'product' });
    my $list_product_item = [];
    while (my $item = $record->next) {
        push @$list_product_item, { $item->get_columns };
    }
    return $list_product_item;
}

# Function get product details by id 
sub get_product_detail {
    my ($self, $product_id) = @_;
    my $product = $self->schema->resultset('ProductDetail')->find($product_id);
    return $product;
}

# Function get related products
sub get_related_products {
    my ($self, $product_id, $limit) = @_;
    # Lấy các sản phẩm khác của cùng nhãn hiệu và join với bảng 'product_details'
    my $records      = $self->schema->resultset('ProductDetail')->search(
        { 
            'me.id'  => { '!=' => $product_id }  # Lấy ra sản phẩm nhưng phải khác sản phẩm hiện tại 
        },
        {
            join     => 'product',
            rows     => $limit,
            order_by => { -desc => 'product.id' }
        }
    );
    my $list_product_item = [];
    while (my $item = $records->next) {
        push @$list_product_item, { $item->get_columns };
    }
    return $list_product_item;
}

# Không join được các trường của bảng product_details
# sub get_related_products {
#     my ($self, $product_id, $limit) = @_;

#     # Lấy thông tin sản phẩm chi tiết hiện tại
#     my $current_product = $self->schema->resultset('Product')->find($product_id);
#     # Lấy brand_id của sản phẩm chi tiết hiện tại
#     my $brand_id = $current_product->brand_id;

#     # Lấy các sản phẩm khác cùng nhãn hiệu và join với bảng 'product_details'
#     my $related_products = $self->schema->resultset('Product')->search(
#         {
#             'me.brand_id' => $brand_id,  # Lấy ra các sản phẩm cùng nhãn hiệu
#             'me.id'       => { '!=' => $product_id }  # Lấy ra sản phẩm khác sản phẩm hiện tại
#         },
#         {
#             join     => 'product_detail',
#             rows     => $limit ,  # Lấy ra số lượng sản phẩm tối đa, mặc định là 5 nếu không được chỉ định
#             order_by => { -desc => 'me.id' }  # Sắp xếp theo thứ tự giảm dần của id
#         }
#     );

#     my $list_product_item = [];
#     while (my $item = $related_products->next) {
#         my $product_detail = $item->product_detail;
#         push @$list_product_item, {
#             $item->get_columns 
#         };
#     }
#     return $list_product_item;
# }



1;
