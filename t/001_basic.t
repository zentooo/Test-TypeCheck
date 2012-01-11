#!perl -w
use strict;
use Test::More;

use Test::TypeCheck;

package Klass {
    sub new { bless +{}, $_[0] }
}
1;

subtest 'test types' => sub {
    my $scalar_ref = \'0';
    is_scalar_ref($scalar_ref);
    is_scalar_ref($scalar_ref, "scalar_ref");

    my $array_ref = [];
    is_array_ref($array_ref);
    is_array_ref($array_ref, "array_ref");

    my $hash_ref = +{};
    is_hash_ref($hash_ref);
    is_hash_ref($hash_ref, "hash_ref");

    my $code_ref = sub {};
    is_code_ref($code_ref);
    is_code_ref($code_ref, "code_ref");

    my $glob_ref = \*glob;
    is_glob_ref($glob_ref);
    is_glob_ref($glob_ref, "glob_ref");

    my $regex_ref = qr//;
    is_rx($regex_ref);
    is_rx($regex_ref, "regex_ref");

    my $instance = Klass->new;
    is_instance($instance, "Klass");
    is_instance($instance, "Klass", "instance");

    is_invocant($instance);
    is_invocant($instance, "invocant");
    is_invocant("Klass");
    is_invocant("Klass", "invocant");

    my $value = 1;
    is_value($value);
    is_value($value, "value");

    my $string = "big";
    is_string($string);
    is_string($string, "string");

    my $number = 0.1;
    is_number($number);
    is_number($number, "number");

    my $integer = 1;
    is_integer($integer);
    is_integer($integer, "integer");
};

done_testing;
