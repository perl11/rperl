# <<< COMPILE_ERROR: 'ERROR ECVPAPC02' >>>
# <<< COMPILE_ERROR: 'Perl::Critic::Policy::ValuesAndExpressions::ProhibitInterpolationOfLiterals' >>>
# [[[ HEADER ]]]
package RPerl::Test::LiteralString::Package_DoubleQuotes_08_Bad;
use strict;
use warnings;
use RPerl;
our $VERSION = 0.001_000;

# [[[ SUBROUTINES ]]]
our void $empty_sub = sub { "\m\mfoo\m\mbar\m\m"; };

1;                  # end of class
