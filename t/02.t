use diagnostics;
use strict;
use warnings;
use Test::More tests => 2;
BEGIN {
    use_ok('Crypt::Camellia')
};

BEGIN {
    my $key = pack "H32", "40000000000000000000000000000000";
    my $cipher = new Crypt::Camellia $key;
    my $plaintext = pack "H32", "00000000000000000000000000000000";
    my $ciphertext = $cipher->encrypt($plaintext);
    my $answer = unpack "H*", $ciphertext;
    is("f04d51e45e70fb6dee0d16a204fbba16", $answer);
};

