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
    my $plaintext = pack "H32", "ffffffffffffffffffffffffffffffff";
    my $ciphertext = $cipher->encrypt($plaintext);
    my $answer = unpack "H*", $ciphertext;
    is("25dd9eb9dd67fbc6e8431f56f4fbe651", $answer);
};

