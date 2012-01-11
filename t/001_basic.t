#!perl -w
use strict;
use Test::More;

use Test::TypeCheck;

subtest 'real test' => sub {
    is(1, 1);
    is_string("hoge");
    is_string("hoge", "hoge is string");
    is(1, 1);
};

done_testing;
