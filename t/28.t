use diagnostics;
use strict;
use warnings;
use Test::More tests => 2;
BEGIN {
    use_ok('Crypt::Camellia')
};

BEGIN {
    my $key = pack "H32", "ffffffffffffffffffffffffffffffff";
    my $cipher = new Crypt::Camellia $key;
    my $ciphertext = pack "H32", "25dd9eb9dd67fbc6e8431f56f4fbe651";
    my $plaintext = $cipher->decrypt($ciphertext);
    my $answer = unpack "H*", $plaintext;
    is("ffffffffffffffffffffffffffffffff", $answer);
};

