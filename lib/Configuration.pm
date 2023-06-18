use strict;
use warnings;

package Configuration;

our $db_host        = "host=192.168.33.10";
our $db_name        = "dbname=db_bikes";
our $db_user        = "postgres";
our $db_password    = "123456";
our $dsn            = "dbi:Pg:$db_name;$db_host";