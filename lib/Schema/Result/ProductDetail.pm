use utf8;
package Schema::Result::ProductDetail;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Schema::Result::ProductDetail

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

=head1 TABLE: C<product_detail>

=cut

__PACKAGE__->table("product_detail");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'product_detail_id_seq'

=head2 name

  data_type: 'varchar'
  is_nullable: 1
  size: 100

=head2 status

  data_type: 'varchar'
  is_nullable: 1
  size: 100

=head2 manufactured_year

  data_type: 'numeric'
  is_nullable: 1

=head2 fuel

  data_type: 'varchar'
  is_nullable: 1
  size: 100

=head2 color

  data_type: 'varchar'
  is_nullable: 1
  size: 50

=head2 price

  data_type: 'numeric'
  is_nullable: 1

=head2 mileage

  data_type: 'numeric'
  is_nullable: 1

=head2 displacement

  data_type: 'varchar'
  is_nullable: 1
  size: 20

=head2 city

  data_type: 'varchar'
  is_nullable: 1
  size: 100

=head2 image

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 description

  data_type: 'text'
  is_nullable: 1

=head2 product_id

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
    sequence          => "product_detail_id_seq",
  },
  "name",
  { data_type => "varchar", is_nullable => 1, size => 100 },
  "status",
  { data_type => "varchar", is_nullable => 1, size => 100 },
  "manufactured_year",
  { data_type => "numeric", is_nullable => 1 },
  "fuel",
  { data_type => "varchar", is_nullable => 1, size => 100 },
  "color",
  { data_type => "varchar", is_nullable => 1, size => 50 },
  "price",
  { data_type => "numeric", is_nullable => 1 },
  "mileage",
  { data_type => "numeric", is_nullable => 1 },
  "displacement",
  { data_type => "varchar", is_nullable => 1, size => 20 },
  "city",
  { data_type => "varchar", is_nullable => 1, size => 100 },
  "image",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "description",
  { data_type => "text", is_nullable => 1 },
  "product_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 carts

Type: has_many

Related object: L<Schema::Result::Cart>

=cut

__PACKAGE__->has_many(
  "carts",
  "Schema::Result::Cart",
  { "foreign.product_detail_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 product

Type: belongs_to

Related object: L<Schema::Result::Product>

=cut

__PACKAGE__->belongs_to(
  "product",
  "Schema::Result::Product",
  { id => "product_id" },
  {
    is_deferrable => 0,
    join_type     => "LEFT",
    on_delete     => "NO ACTION",
    on_update     => "NO ACTION",
  },
);


# Created by DBIx::Class::Schema::Loader v0.07051 @ 2023-07-02 07:56:27
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:ip/RkS8ekh9VXJOfoaSbWQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
