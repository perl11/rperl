# [[[ HEADER ]]]
package RPerl::GrammarRule;
use strict;
use warnings;
use RPerl::AfterSubclass;
our $VERSION = 0.000_003;

# [[[ OO INHERITANCE ]]]
use parent qw(RPerl::CompileUnit::Module::Class);
use RPerl::CompileUnit::Module::Class;

# [[[ OO PROPERTIES ]]]
our hashref $properties = {};

# Map cperl/perl6 types to rperl types
sub integer_type {
  my ($self, $type) = @_;
  if ($type =~ /^(UInt|uint)$/) {
    return 'unsigned_integer';
  }
  elsif ($type =~ /^(Int|int)$/) {
    return 'integer';
  }
  else {
    return $type;
  }
}

sub number_type {
  my string $type = shift;
  if ($type =~ /^(Num|num)$/) {
    return 'number';
  }
  else {
    return $type;
  }
}

sub string_type {
  my string $type = shift;
  if ($type =~ /^(str|Str)$/) {
    return 'string';
  }
  else {
    return $type;
  }
}

1;  # end of class
