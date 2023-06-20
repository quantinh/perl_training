package Mojolicious::Plugin::Helper;
use Mojo::Base 'Mojolicious::Plugin';
use Mojo::Base 'Mojolicious', -signatures;
use Crypt::PBKDF2;
use Schema;
use Configuration;
use perl_training::Model::MUser;
use Email::Send::SMTP::Gmail;

sub register {
    my ($self, $app) = @_;

    $app->helper(schema => sub {
        my ($c)       = @_;
        my $dsn       = $Configuration::dsn;
        my $user      = $Configuration::db_user;
        my $password  = $Configuration::db_password;
        return state $schema = Schema->connect($dsn, $user, $password, { AutoCommit=>1, RaiseError=>1, PrintError=>0 });
    });
    
    $app->helper(rs => sub {
        return shift->schema->resultset(@_);
    });

    $app->helper(t_users => sub {
        my ($c)                = @_;
        return state $t_users  = perl_training::Model::MUser->new(schema => $c->schema);
    });

    $app->helper(validate_password => sub {
        my ($c, $user_pass, $password) = @_;
        my $pbkdf2 = Crypt::PBKDF2->new(
            hash_class  => 'HMACSHA1',
            iterations  => 1000,
            output_len  => 20,
            salt_len    => 4,
        );
        if ($pbkdf2->validate($user_pass, $password)) {
            return 1;
        }
    });

    $app->helper(generate => sub {
        my ($c, $password) = @_;
        my $pbkdf2 = Crypt::PBKDF2->new(
            hash_class  => 'HMACSHA1',
            iterations  => 1000,
            output_len  => 20,
            salt_len    => 4,
        );
        my $hash = $pbkdf2->generate($password);
        return $hash;
    });
}

1;