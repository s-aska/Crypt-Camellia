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
    my $ciphertext = pack "H32", "f04d51e45e70fb6dee0d16a204fbba16";
    my $plaintext = $cipher->decrypt($ciphertext);
    my $answer = unpack "H*", $plaintext;
    is("00000000000000000000000000000000", $answer);
};

