use diagnostics;
use strict;
use warnings;
use Test::More tests => 2;
BEGIN {
    use_ok('Crypt::Camellia')
};

BEGIN {
    my $key = pack "H32", "01000000000000000000000000000000";
    my $cipher = new Crypt::Camellia $key;
    my $ciphertext = pack "H32", "43a865a61e1117008372932ea9ce8bb2";
    my $plaintext = $cipher->decrypt($ciphertext);
    my $answer = unpack "H*", $plaintext;
    is("00000000000000000000000000000000", $answer);
};

