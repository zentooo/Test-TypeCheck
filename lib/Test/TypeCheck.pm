package Test::TypeCheck;
use 5.008_001;
use strict;
use warnings;

our $VERSION = '0.01';

use Test::Builder;
use Data::Util;

sub import {
    my $self = shift;
    my $package = caller;

    my $tb = Test::Builder->new;

    no strict 'refs';
    for my $name (@{ $Data::Util::EXPORT_TAGS{'check'} }) {
        if ( $name eq "is_instance" ) {
            *{"$package\::$name"} = sub {
                my $msg = pop @_
                    if scalar @_ == 3;
                $tb->ok(&{"Data\::Util\::$name"}(@_), $msg);
            };
        }
        else {
            *{"$package\::$name"} = sub {
                my $msg = pop @_
                    if scalar @_ == 2;
                $tb->ok(&{"Data\::Util\::$name"}(@_), $msg);
            };
        }
    }
}



1;
__END__

=head1 NAME

Test::TypeCheck - Perl extention to do something

=head1 VERSION

This document describes Test::TypeCheck version 0.01.

=head1 SYNOPSIS

    use Test::TypeCheck;

=head1 DESCRIPTION

# TODO

=head1 INTERFACE

=head2 Functions

=head3 C<< hello() >>

# TODO

=head1 DEPENDENCIES

Perl 5.8.1 or later.

=head1 BUGS

All complex software has bugs lurking in it, and this module is no
exception. If you find a bug please either email me, or add the bug
to cpan-RT.

=head1 SEE ALSO

L<perl>

=head1 AUTHOR

zentooo E<lt>ankerasoy@gmail.comE<gt>

=head1 LICENSE AND COPYRIGHT

Copyright (c) 2012, zentooo. All rights reserved.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
