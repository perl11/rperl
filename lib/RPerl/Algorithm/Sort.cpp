// [[[ HEADER ]]]
using std::cout;  using std::cerr;

#ifndef __CPP__INCLUDED__RPerl__Algorithm__Sort
#define __CPP__INCLUDED__RPerl__Algorithm__Sort 0.005_000

// [[[ INCLUDES ]]]
#include <RPerl/Algorithm/Sort.h>

# ifdef __PERL__TYPES

Purposefully_die_from_a_compile-time_error,_due_to____PERL__TYPES_being_defined.__We_need_to_define_only___CPP__TYPES_in_this_file!

# elif defined __CPP__TYPES

// [[[<<< BEGIN CPP TYPES >>>]]]
// [[[<<< BEGIN CPP TYPES >>>]]]
// [[[<<< BEGIN CPP TYPES >>>]]]

// [[[ OO METHODS & SUBROUTINES ]]]

void RPerl__Algorithm__Sort::inherited__Sort(string person) {
    RPerl::diag((const string) "in CPPOPS_CPPTYPES Sort->inherited__Sort(), have ::class($self) = " + classname(this) + (const string) " and $person = " + person + (const string) ", FISH" + (const string) "\n");
}

string uninherited__Sort(string person) {
    RPerl::diag((const string) "in CPPOPS_CPPTYPES Sort::uninherited__Sort(), received $person = " + person + (const string) ", MY" + (const string) "\n");
    return (const string) "Sort::uninherited__Sort() RULES! CPPOPS_CPPTYPES";
}

// [[[<<< END CPP TYPES >>>]]]
// [[[<<< END CPP TYPES >>>]]]
// [[[<<< END CPP TYPES >>>]]]

# else

Purposefully_die_from_a_compile-time_error,_due_to_neither___PERL__TYPES_nor___CPP__TYPES_being_defined.__We_need_to_define_only___CPP__TYPES_in_this_file!

# endif

#endif
