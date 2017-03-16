# [[[ HEADER ]]]
package RPerl::DataType::Modifier::Reference;
use strict;
use warnings;
use RPerl::AfterSubclass;
our $VERSION = 0.002_001;

# [[[ OO INHERITANCE ]]]
use parent qw(RPerl::DataType::Modifier);
use RPerl::DataType::Modifier;

# [[[ SUB-TYPES ]]]
# a reference is the location of a data type or data structure;
# a reference is not a data type, regardless of Perl's internal RV type, use 'unknown' instead
# NEED FIX???: overload Perl's 'ref' keyword via %ref::
#package  # hide from PAUSE indexing
#    ref;
#use strict;
#use warnings;
#use parent qw(RPerl::DataType::Modifier::Reference);
@ref::ISA = qw(RPerl::DataType::Modifier::Reference);

1;  # end of class
