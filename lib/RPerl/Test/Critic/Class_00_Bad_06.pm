# <<< COMPILE_ERROR: 'ERROR ECVPAPC02' >>>
# <<< COMPILE_ERROR: 'Perl::Critic::Policy::Miscellanea::ProhibitUnrestrictedNoCritic' >>>
# [[[ HEADER ]]]
package RPerl::Test::Critic::Class_00_Bad_06;
use strict;
use warnings;
use RPerl;
our $VERSION = 0.001_000;

# [[[ OO INHERITANCE ]]]
use parent qw(RPerl::Test);
use RPerl::Test;

# [[[ CRITICS ]]]
## no critic qwProhibitUselessNoCritic ProhibitMagicNumbers RequireCheckedSyscalls)  # USER DEFAULT 1: allow numeric values and print operator

# [[[ OO PROPERTIES ]]]
our %properties = ( ## no critic qw(ProhibitPackageVars)  # USER DEFAULT 2: allow OO properties
    empty_property => my integer $TYPED_empty_property = 2
);

# [[[ OO METHODS ]]]
our void__method $empty_method = sub { 2; };

1;                  # end of class
