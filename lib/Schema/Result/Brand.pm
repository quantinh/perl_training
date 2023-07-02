use utf8;
package Schema::Result::Brand;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Schema::Result::Brand

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

=head1 TABLE: C<brand>

=cut

__PACKAGE__->table("brand");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'brand_id_seq'

=head2 name

  data_type: 'varchar'
  is_nullable: 1
  size: 100

=head2 country

  data_type: 'varchar'
  is_nullable: 1
  size: 100

=head2 company

  data_type: 'varchar'
  is_nullable: 1
  size: 100

=head2 image

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=cut

__PACKAGE__->add_columns(
  "id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "brand_id_seq",
  },
  "name",
  { data_type => "varchar", is_nullable => 1, size => 100 },
  "country",
  { data_type => "varchar", is_nullable => 1, size => 100 },
  "company",
  { data_type => "varchar", is_nullable => 1, size => 100 },
  "image",
  { data_type => "varchar", is_nullable => 1, size => 255 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 products

Type: has_many

Related object: L<Schema::Result::Product>

=cut

__PACKAGE__->has_many(
  "products",
  "Schema::Result::Product",
  { "foreign.brand_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07051 @ 2023-07-02 07:56:27
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:/v+AjnGMnC9eBEya/pICwA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
