# [[[ HEADER ]]]
package RPerl::Operation::Expression::SubExpression::Literal;
use strict;
use warnings;
use RPerl;
our $VERSION = 0.000_011;

# [[[ OO INHERITANCE ]]]
use parent qw(RPerl::Operation::Expression::SubExpression);
use RPerl::Operation::Expression::SubExpression;

# [[[ OO PROPERTIES ]]]
our hash_ref $properties = {};

# [[[ OO METHODS ]]]

our string__hash_ref__method $ast_to_rperl__generate = sub {
    ( my object $self, my string__hash_ref $modes) = @_;
    my string__hash_ref $rperl_source_group = { PMC => q{} };

    RPerl::diag( 'in Literal->ast_to_rperl__generate(), received $self = ' . "\n" . RPerl::Parser::rperl_ast__dump($self) . "\n" );

    my object $number_or_string = $self->{children}->[0];
    $rperl_source_group = $number_or_string->ast_to_rperl__generate($modes);

    return $rperl_source_group;
};

our string__hash_ref__method $ast_to_cpp__generate__CPPOPS_PERLTYPES = sub {
    ( my object $self, my string__hash_ref $modes) = @_;
    my string__hash_ref $cpp_source_group
        = { CPP => q{<<< RP::O::E::SE::L DUMMY CPPOPS_PERLTYPES SOURCE CODE >>>}
            . "\n" };

    #...
    return $cpp_source_group;
};

our string__hash_ref__method $ast_to_cpp__generate__CPPOPS_CPPTYPES = sub {
    ( my object $self, my string__hash_ref $modes) = @_;
    my string__hash_ref $cpp_source_group
        = { CPP => q{<<< RP::O::E::SE::L DUMMY CPPOPS_PERLTYPES SOURCE CODE >>>}
            . "\n" };

    #...
    return $cpp_source_group;
};

1;
