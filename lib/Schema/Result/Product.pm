use utf8;
package Schema::Result::Product;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Schema::Result::Product

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

=head1 TABLE: C<product>

=cut

__PACKAGE__->table("product");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'product_id_seq'

=head2 name

  data_type: 'varchar'
  is_nullable: 1
  size: 100

=head2 brand_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 category_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "product_id_seq",
  },
  "name",
  { 
    data_type => "varchar", 
    is_nullable => 1, 
    size => 100 
  },
  "brand_id",
  { 
    data_type => "integer", 
    is_foreign_key => 1, 
    is_nullable => 1 
  },
  "category_id",
  { 
    data_type => "integer", 
    is_foreign_key => 1, 
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

=head2 brand

Type: belongs_to

Related object: L<Schema::Result::Brand>

=cut

__PACKAGE__->belongs_to(
  "brand",
  "Schema::Result::Brand",
  { id => "brand_id" },
  {
    is_deferrable => 0,
    join_type     => "LEFT",
    on_delete     => "NO ACTION",
    on_update     => "NO ACTION",
  },
);

=head2 category

Type: belongs_to

Related object: L<Schema::Result::Category>

=cut

__PACKAGE__->belongs_to(
  "category",
  "Schema::Result::Category",
  { id => "category_id" },
  {
    is_deferrable => 0,
    join_type     => "LEFT",
    on_delete     => "NO ACTION",
    on_update     => "NO ACTION",
  },
);

=head2 product_details

Type: has_many

Related object: L<Schema::Result::ProductDetail>

=cut

__PACKAGE__->has_many(
  "product_details",
  "Schema::Result::ProductDetail",
  { "foreign.product_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07051 @ 2023-06-16 03:21:12
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:c09Z8mBq4LWlnxavc7JXKA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
