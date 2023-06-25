use utf8;
package Schema::Result::User;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Schema::Result::User

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

=head1 TABLE: C<users>

=cut

__PACKAGE__->table("users");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'users_id_seq'

=head2 username

  data_type: 'varchar'
  is_nullable: 1
  size: 50

=head2 password

  data_type: 'varchar'
  is_nullable: 1
  size: 50

=head2 phone

  data_type: 'varchar'
  is_nullable: 1
  size: 10

=head2 fullname

  data_type: 'varchar'
  is_nullable: 1
  size: 50

=head2 gender

  data_type: 'varchar'
  is_nullable: 1
  size: 20

=head2 address

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 email

  data_type: 'varchar'
  is_nullable: 1
  size: 50

=cut

__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    is_auto_increment => 1,
    is_nullable => 0,
    sequence => "users_id_seq",
  },
  "username",
  { 
    data_type => "varchar", 
    is_nullable => 1, 
    size => 50 
  },
  "password",
  { 
    data_type => "varchar", 
    is_nullable => 1, 
    size => 50 
  },
  "phone",
  { 
    data_type => "varchar", 
    is_nullable => 1, 
    size => 10 
  },
  "fullname",
  { 
    data_type => "varchar", 
    is_nullable => 1, 
    size => 50 
  },
  "gender",
  { 
    data_type => "varchar", 
    is_nullable => 1, 
    size => 20 
  },
  "address",
  { 
    data_type => "varchar", 
    is_nullable => 1, 
    size => 255 
  },
  "email",
  { 
    data_type => "varchar", 
    is_nullable => 1, 
    size => 50 
  },
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
  { 
    "foreign.user_id" => "self.id" 
  },
  { 
    cascade_copy => 0, 
    cascade_delete => 0 
  },
);


# Created by DBIx::Class::Schema::Loader v0.07051 @ 2023-06-16 03:21:12
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:+BP3kpnHWllXTjjufhD+rQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
