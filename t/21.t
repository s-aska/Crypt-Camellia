use diagnostics;
use strict;
use warnings;
use Test::More tests => 2;
BEGIN {
    use_ok('Crypt::Camellia')
};

BEGIN {
    my $key = pack "H32", "02000000000000000000000000000000";
    my $cipher = new Crypt::Camellia $key;
    my $ciphertext = pack "H32", "6896b2fb85d26a243bb5697f6a764307";
    my $plaintext = $cipher->decrypt($ciphertext);
    my $answer = unpack "H*", $plaintext;
    is("00000000000000000000000000000000", $answer);
};

