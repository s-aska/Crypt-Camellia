use diagnostics;
use strict;
use warnings;
use Test::More tests => 2;
BEGIN {
    use_ok('Crypt::Camellia')
};

BEGIN {
    my $key = pack "H32", "00200000000000000000000000000000";
    my $cipher = new Crypt::Camellia $key;
    my $plaintext = pack "H32", "00000000000000000000000000000000";
    my $ciphertext = $cipher->encrypt($plaintext);
    my $answer = unpack "H*", $ciphertext;
    is("1d28a0a70b3c72adc5b77487ad442873", $answer);
};

