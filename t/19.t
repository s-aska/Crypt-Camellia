use diagnostics;
use strict;
use warnings;
use Test::More tests => 2;
BEGIN {
    use_ok('Crypt::Camellia')
};

BEGIN {
    my $key = pack "H32", "08000000000000000000000000000000";
    my $cipher = new Crypt::Camellia $key;
    my $ciphertext = pack "H32", "8a42bda76c84b8960b23530100afb748";
    my $plaintext = $cipher->decrypt($ciphertext);
    my $answer = unpack "H*", $plaintext;
    is("00000000000000000000000000000000", $answer);
};

