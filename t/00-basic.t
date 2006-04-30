#
# $Id: 00-basic.t,v 0.1 2006/04/30 13:19:53 dankogai Exp dankogai $
#
use strict;
use warnings;
#use Test::More qw/no_plan/;
use Test::More tests => 7;

BEGIN{ use_ok('Crypt::Camellia') };

my $plain = "Hello, World!";
my $enc = Crypt::Camellia->new("foobar")->encrypt($plain);
my $dec = Crypt::Camellia->new("foobar")->decrypt($enc);
isnt($dec, $plain, $plain);
is(substr($dec,0,length($plain)), $plain, $plain);

$plain = "0123456789abcdefefghijklmnopqrstuvwxyz";
$enc = Crypt::Camellia->new("foobar")->encrypt($plain);
$dec = Crypt::Camellia->new("foobar")->decrypt($enc);
isnt($dec, $plain, $plain);
is($dec, substr($plain,0,length($dec)), $plain);

$plain = "0123456789abcdef";
$enc = Crypt::Camellia->new("foobar")->encrypt($plain);
$dec = Crypt::Camellia->new("foobar")->decrypt($enc);
is($dec, $plain, $plain);
$dec = Crypt::Camellia->new("barbaz")->decrypt($enc);
isnt($dec, $plain, $plain);
