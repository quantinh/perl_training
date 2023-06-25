use utf8;
package Schema::Result::Cart;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Schema::Result::Cart

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::TimeStamp>

=item * L<DBIx::Class::EncodedColumn>

=back

=cut

__PACKAGE__->load_components("InflateColumn::DateTime", "TimeStamp", "EncodedColumn");

=head1 TABLE: C<cart>

=cut

__PACKAGE__->table("cart");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'cart_id_seq'

=head2 user_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 product_detail_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 quantity

  data_type: 'numeric'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    is_auto_increment => 1,
    is_nullable => 0,
    sequence => "cart_id_seq",
  },
  "user_id",
  { 
    data_type => "integer", 
    is_foreign_key => 1, 
    is_nullable => 1 
  },
  "product_detail_id",
  { 
    data_type => "integer", 
    is_foreign_key => 1, 
    is_nullable => 1 
  },
  "quantity",
  { 
    data_type => "numeric", 
    is_nullable => 1 
  },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 product_detail

Type: belongs_to

Related object: L<Schema::Result::ProductDetail>

=cut

__PACKAGE__->belongs_to(
  "product_detail",
  "Schema::Result::ProductDetail",
  { 
    id => "product_detail_id" 
  },
  {
    is_deferrable => 0,
    join_type => "LEFT",
    on_delete => "NO ACTION",
    on_update => "NO ACTION",
  },
);

=head2 user

Type: belongs_to

Related object: L<Schema::Result::User>

=cut

__PACKAGE__->belongs_to(
  "user",
  "Schema::Result::User",
  { 
    id => "user_id" 
  },
  {
    is_deferrable => 0,
    join_type => "LEFT",
    on_delete => "NO ACTION",
    on_update => "NO ACTION",
  },
);


# Created by DBIx::Class::Schema::Loader v0.07051 @ 2023-06-16 03:21:12
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:g6OErHV4+YdEzuWUqNtDYA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
