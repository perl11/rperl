#!/usr/bin/perl

# [[[ PREPROCESSOR ]]]
# <<< EXECUTE_SUCCESS: 'Hello, World!' >>>
# <<< EXECUTE_SUCCESS: 'Hello, World!' >>>

# [[[ HEADER ]]]
use RPerl;
use strict;
use warnings;
our $VERSION = 0.001_000;
BEGIN { warnings->unimport('types') if $^V =~ /c$/; }

# [[[ CRITICS ]]]
## no critic qw(ProhibitUselessNoCritic ProhibitMagicNumbers RequireCheckedSyscalls)  # USER DEFAULT 1: allow numeric values & print operator
## no critic qw(RequireInterpolationOfMetachars)  # USER DEFAULT 2: allow single-quoted control characters & sigils

# [[[ OPERATIONS ]]]
my string $greets = RPerl::TEST_CONSTANT() . "\n";
my string $twin_greets = $greets x 2;
print '$twin_greets = ' . "\n\n" . $twin_greets, "\n";
