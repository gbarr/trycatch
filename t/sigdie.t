use strict;
use warnings;

use Test::More;
use TryCatch;

$SIG{__DIE__} = sub { die "different message\n" };

try        { die "original message\n"  }
catch ($e) { is($e,"original message\n") }

try  ( sigdie )   { die "original message\n"  }
catch ($e)        { is($e,"different message\n") }

done_testing;

