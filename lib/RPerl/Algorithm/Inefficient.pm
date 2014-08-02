# [[[ PACKAGE, HEADER ]]]
package RPerl::Algorithm::Inefficient;
use strict;
use warnings;
our $VERSION = 0.004_000;
use Carp;
use RPerl;

# [[[ CRITIC, PARENT INHERITANCE, INCLUDES, CONSTANTS, OO PROPERTIES ]]]
# USER DEFAULT 1: allow numeric values and print operator
## no critic qw(ProhibitUselessNoCritic ProhibitMagicNumbers RequireCheckedSyscalls)
use parent qw(RPerl::Algorithm);
use RPerl::Algorithm;
our %properties = (); ## no critic qw(ProhibitPackageVars)  # USER DEFAULT 2: allow OO properties

# [[[ OO METHODS ]]]

our void__method $inherited__Inefficient = sub {
    ( my object $self, my string $person) = @_;
    RPerl::diag
        "in PERLOPS_PERLTYPES Inefficient->inherited__Inefficient(), received \$self = '$self' and \$person = '$person', FLUFFY\n";
};

our void__method $inherited = sub {
    ( my object $self, my string $person) = @_;
    RPerl::diag
        "in PERLOPS_PERLTYPES Inefficient->inherited(), received \$self = '$self' and \$person = '$person', INCOMPATIBLE\n";
};

# all of the following happen before the INIT block, and thus rely upon AUTOLOAD
#RPerl::diag "WAZZUP FROM Inefficient.pm\n";
#inherited('FAKESELF', "Spidey");
#RPerl::Algorithm::Inefficient::inherited("FAKECLASS", "Peter Parker");
#RPerl::Algorithm::Inefficient->inherited("Mary Jane");

# pre-INIT AUTOLOAD resolution below only works with Perl, not Inline::CPP
#uninherited('Doc Oc');
#RPerl::Algorithm::Inefficient::uninherited("Doctor Octavius");
#RPerl::Algorithm::Inefficient->uninherited("Mad Scientist");  # ignores "Mad Scientist"
#RPerl::diag "LATERZ FROM Inefficient.pm\n";

1;
1;    # CODE SEPARATOR: methods above, subroutines below

# [[[ PROCEDURAL SUBROUTINES ]]]

our string $uninherited__Inefficient = sub {
    ( my string $person) = @_;
    RPerl::diag
        "in PERLOPS_PERLTYPES Inefficient::uninherited__Inefficient(), received \$person = '$person', MESSY\n";
    return 'Inefficient::uninherited__Inefficient() RULES! PERLOPS_PERLTYPES';
};

# DEV NOTE, CORRELATION #04: inheritance testing, manually enable uninherited() in exactly one of Algorithm.*, Inefficient.*, Sort.*, or Bubble.*
#our string $uninherited = sub { ( my string $person) = @_; RPerl::diag "in PERLOPS_PERLTYPES Inefficient::uninherited(), received \$person = '$person', TRICKS\n"; return 'Inefficient::uninherited() ROCKS! PERLOPS_PERLTYPES'; };

1;
1;    # CODE SEPARATOR: end of package or class
