# <<< COMPILE_ERROR: 'ERROR ECVPARP00' >>>
# [[[ HEADER ]]]
package RPerl::Test::VersionNumber::Class_00_Bad_01;
use strict;
use warnings;
use RPerl;
our $VERSION = 0.01_000;

# [[[ OO INHERITANCE ]]]
use parent qw(RPerl::Test);
use RPerl::Test;

# [[[ OO PROPERTIES ]]]
our %properties = ( ## no critic qw(ProhibitPackageVars)  # USER DEFAULT 2: allow OO properties
    empty_property => my integer $TYPED_empty_property = 2
);

# [[[ OO METHODS ]]]
our void__method $empty_method = sub { 2; };

1;                  # end of class
