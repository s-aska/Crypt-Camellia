use diagnostics;
use strict;
use warnings;
use Test::More tests => 2;
BEGIN {
    use_ok('Crypt::Camellia')
};

BEGIN {
    my $key = pack "H32", "04000000000000000000000000000000";
    my $cipher = new Crypt::Camellia $key;
    my $plaintext = pack "H32", "00000000000000000000000000000000";
    my $ciphertext = $cipher->encrypt($plaintext);
    my $answer = unpack "H*", $ciphertext;
    is("1d20d15f3ee21ee6051803adf83e31d7", $answer);
};

