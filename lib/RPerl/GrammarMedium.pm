########################################################################################
#
#    This file was generated using Parse::Eyapp version 1.182.
#
# (c) Parse::Yapp Copyright 1998-2001 Francois Desarmenien.
# (c) Parse::Eyapp Copyright 2006-2008 Casiano Rodriguez-Leon. Universidad de La Laguna.
#        Don't edit this file, use source file 'lib/RPerl/GrammarMedium.eyp' instead.
#
#             ANY CHANGE MADE HERE WILL BE LOST !
#
########################################################################################
package RPerl::GrammarMedium;
use strict;

push @RPerl::GrammarMedium::ISA, 'Parse::Eyapp::Driver';




BEGIN {
  # This strange way to load the modules is to guarantee compatibility when
  # using several standalone and non-standalone Eyapp parsers

  require Parse::Eyapp::Driver unless Parse::Eyapp::Driver->can('YYParse');
  require Parse::Eyapp::Node unless Parse::Eyapp::Node->can('hnew'); 
}
  

sub unexpendedInput { defined($_) ? substr($_, (defined(pos $_) ? pos $_ : 0)) : '' }

#line 6 "lib/RPerl/GrammarMedium.eyp"

    # [[[ HEADER ]]]
    use strict;
    use warnings;
    our $VERSION = 0.006_100;

    use Carp;
    use rperlrules;  # affirmative, it totally does


# Default lexical analyzer
our $LEX = sub {
    my $self = shift;
    my $pos;

    for (${$self->input}) {
      

      /\G((?:\s*(?:[#][^#!].*)?\s*)*|\s)/gc and $self->tokenline($1 =~ tr{\n}{});

      m{\G(our\ hashref\ \$properties|\#\#\ no\ critic\ qw\(|use\ parent\ qw\(|use\ warnings\;|use\ constant|use\ strict\;|package|foreach|\=\ sub\ \{|\$TYPED_|\@ARG\;|undef|elsif|while|else|our|for|\@\{|\%\{|if|\;|\}|\]|\))}gc and return ($1, $1);

      /\G(^#!\/(?:\w+\/)*perl)/gc and return ('SHEBANG', $1);
      /\G(\s*use\s+RPerl\s*;\s*)/gc and return ('USE_RPERL', $1);
      /\G(\s*use\s+RPerl::AfterSubclass\s*;\s*)/gc and return ('USE_RPERL_AFTER', $1);
      /\G(use\s+)/gc and return ('USE', $1);
      /\G\$VERSION\ =\ (\d\d?\.\d{3}\_\d{3});/gc and return ('VERSION_NUMBER_ASSIGN', $1);
      /\G(my)/gc and return ('MY', $1);
      /\G([+-]?(((\d{1,2}_)?(\d{3}_)*\d{3})|\d{1,2})(\.((\d{3}(_\d{3})*(_\d{1,2})?)|\d{1,2}))?(e[+-]?\d+)?)/gc and return ('LITERAL_NUMBER', $1);
      /\G(('([^'\\]+|(?:\\\\)+)+')|("((\\n)|(\\t)|[^"\@\$\\])*((\\n)|(\\t))+((\\n)|(\\t)|[^"\@\$\\])*")|(q\{([^}\\]+|(?:\\\\)+)*\}))/gc and return ('LITERAL_STRING', $1);
      /\G(\$self)/gc and return ('SELF', $1);
      /\G(\$(?:[a-zA-Z]\w*)?[a-z]\w*(::[a-zA-Z]\w*)*)/gc and return ('VARIABLE_SYMBOL', $1);
      /\G(\<\$[A-Z][A-Z0-9_]*\>)/gc and return ('FHREF_SYMBOL_IN', $1);
      /\G(\{\$[A-Z][A-Z0-9_]*\})/gc and return ('FHREF_SYMBOL_BRACES', $1);
      /\G(\$[A-Z][A-Z0-9_]*)/gc and return ('FHREF_SYMBOL', $1);
      /\G(int|uint|Int|UInt|integer|unsigned_integer)\s+/gc and return ('TYPE_INTEGER', $1);
      /\G(filehandleref\s+)/gc and return ('TYPE_FHREF', $1);
      /\G((?:[a-zA-Z]\w*)+(?:::[a-zA-Z]\w*)*::method)/gc and return ('TYPE_METHOD', $1);
      /\G((?:[a-zA-Z]\w*)(?:::[a-zA-Z]\w*)*(?:::[A-Z0-9_]*)\(\))/gc and return ('CONSTANT_CALL_SCOPED', $1);
      /\G((?:[a-zA-Z]\w*)?(?:::[a-zA-Z]\w*)+)/gc and return ('WORD_SCOPED', $1);
      /\G(\{\*STDOUT\}|\{\*STDERR\})/gc and return ('STDOUT_STDERR', $1);
      /\G(<STDIN>)/gc and return ('STDIN', $1);
      /\G(\@ARGV)/gc and return ('ARGV', $1);
      /\G(\%ENV)/gc and return ('ENV', $1);
      /\G(or|xor)\s/gc and return ('OP24_LOGICAL_OR_XOR', $1);
      /\G(and)\s/gc and return ('OP23_LOGICAL_AND', $1);
      /\G(not)/gc and return ('OP22_LOGICAL_NEG', $1);
      /\G(,)/gc and return ('OP21_LIST_COMMA', $1);
      /\G(=>)/gc and return ('OP20_HASH_FATARROW', $1);
      /\G(next;|last;)/gc and return ('OP19_LOOP_CONTROL_SCOLON', $1);
      /\G(next|last|redo)\s/gc and return ('OP19_LOOP_CONTROL', $1);
      /\G(\?)/gc and return ('OP18_TERNARY', $1);
      /\G(\.\.)/gc and return ('OP17_LIST_RANGE', $1);
      /\G(\|\|)/gc and return ('OP16_LOGICAL_OR', $1);
      /\G(&&)/gc and return ('OP15_LOGICAL_AND', $1);
      /\G(\||\^)/gc and return ('OP14_BITWISE_OR_XOR', $1);
      /\G(&)/gc and return ('OP13_BITWISE_AND', $1);
      /\G(==|!=|<=>|eq|ne|cmp)\s/gc and return ('OP12_COMPARE_EQ_NE', $1);
      /\G(<<|>>)/gc and return ('OP09_BITWISE_SHIFT', $1);
      /\G(-A;|-B;|-C;|-M;|-O;|-R;|-S;|-T;|-W;|-X;|-b;|-c;|-d;|-e;|-f;|-g;|-k;|-l;|-o;|-p;|-r;|-s;|-t;|-u;|-w;|-x;|-z;|alarm;|caller;|chdir;|chroot;|cos;|defined;|delete;|do;|eval;|exists;|gethostbyname;|getnetbyname;|getpgrp;|getprotobyname;|glob;|gmtime;|goto;|hex;|int;|lc;|lcfirst;|length;|localtime;|lock;|log;|lstat;|oct;|ord;|quotemeta;|rand;|readlink;|ref;|require;|rmdir;|scalar;|sin;|sleep;|sqrt;|srand;|stat;|uc;|ucfirst;|umask;)/gc and return ('OP10_NAMED_UNARY_SCOLON', $1);
      /\G(-A\s|-B\s|-C\s|-M\s|-O\s|-R\s|-S\s|-T\s|-W\s|-X\s|-b\s|-c\s|-d\s|-e\s|-f\s|-g\s|-k\s|-l\s|-o\s|-p\s|-r\s|-s\s|-t\s|-u\s|-w\s|-x\s|-z\s|alarm\s|caller\s|chdir\s|chroot\s|cos\s|defined\s|delete\s|do\s|eval\s|exists\s|gethostbyname\s|getnetbyname\s|getpgrp\s|getprotobyname\s|glob\s|gmtime\s|goto\s|hex\s|int\s|lc\s|lcfirst\s|length\s|localtime\s|lock\s|log\s|lstat\s|oct\s|ord\s|quotemeta\s|rand\s|readlink\s|ref\s|require\s|rmdir\s|scalar\s|sin\s|sleep\s|sqrt\s|srand\s|stat\s|uc\s|ucfirst\s|umask\s)/gc and return ('OP10_NAMED_UNARY', $1);
      /\G(\+=|-=|\*=|\/=|\.=)/gc and return ('OP19_VARIABLE_ASSIGN_BY', $1);
      /\G(\.)/gc and return ('OP08_STRING_CAT', $1);
      /\G(\+\+|--)/gc and return ('OP03_MATH_INC_DEC', $1);
      /\G(\*\*)/gc and return ('OP04_MATH_POW', $1);
      /\G(\*|\/|\%|sse_mul|sse_div)/gc and return ('OP07_MATH_MULT_DIV_MOD', $1);
      /\G(x)\s/gc and return ('OP07_STRING_REPEAT', $1);
      /\G([ms]\/.*(?:\/.*)?\/[a-z]*)/gc and return ('OP06_REGEX_PATTERN', $1);
      /\G(=\~|!\~)/gc and return ('OP06_REGEX_MATCH', $1);
      /\G(!)/gc and return ('OP05_LOGICAL_NEG', $1);
      /\G(\~\()/gc and return ('OP05_BITWISE_NEG_LPAREN', $1);
      /\G(->\{)/gc and return ('OP02_HASH_THINARROW', $1);
      /\G(->\[)/gc and return ('OP02_ARRAY_THINARROW', $1);
      /\G(->new\()/gc and return ('OP02_METHOD_THINARROW_NEW', $1);
      /\G(->[a-zA-Z]\w*)/gc and return ('OP02_METHOD_THINARROW', $1);
      /\G(-\()/gc and return ('OP05_MATH_NEG_LPAREN', $1);
      /\G(\+|-\s|sse_add|sse_sub)/gc and return ('OP08_MATH_ADD_SUB', $1);
      /\G(<=|>=|<|>|le|ge|lt|gt)\s/gc and return ('OP11_COMPARE_LT_GT', $1);
      /\G(=)/gc and return ('OP19_VARIABLE_ASSIGN', $1);
      /\G(print|printf)\s/gc and return ('OP01_PRINT', $1);
      /\G(croak;|die;|exit;|return;)/gc and return ('OP01_NAMED_VOID_SCOLON', $1);
      /\G(croak\(|exit\(|return\()/gc and return ('OP01_NAMED_VOID_LPAREN', $1);
      /\G(croak|die|exit|return)\s/gc and return ('OP01_NAMED_VOID', $1);
      /\G(qw\([^()]*\))/gc and return ('OP01_QW', $1);
      /\G(open)\s/gc and return ('OP01_OPEN', $1);
      /\G(close)\s/gc and return ('OP01_CLOSE', $1);
      /\G(abs;|accept;|atan2;|bind;|binmode;|bless;|break;|chmod;|chomp;|chop;|chown;|chr;|closedir;|connect;|continue;|crypt;|dbmclose;|dbmopen;|default;|dump;|each;|endgrent;|endhostent;|endnetent;|endprotoent;|endpwent;|endservent;|eof;|evalbytes;|exec;|exp;|fc;|fcntl;|fileno;|flock;|fork;|format;|formline;|getc;|getgrent;|getgrgid;|getgrnam;|gethostbyaddr;|gethostent;|getlogin;|getnetbyaddr;|getnetent;|getpeername;|getppid;|getpriority;|getprotobynumber;|getprotoent;|getpwent;|getpwnam;|getpwuid;|getservbyname;|getservbyport;|getservent;|getsockname;|getsockopt;|given;|grep;|index;|ioctl;|join;|keys;|kill;|link;|listen;|local;|m;|map;|mkdir;|msgctl;|msgget;|msgrcv;|msgsnd;|opendir;|pack;|pipe;|pop;|pos;|prototype;|push;|q;|qq;|qr;|qx;|read;|readdir;|readline;|readpipe;|recv;|rename;|reset;|reverse;|rewinddir;|rindex;|s;|say;|seek;|seekdir;|select;|semctl;|semget;|semop;|send;|setgrent;|sethostent;|setnetent;|setpgrp;|setpriority;|setprotoent;|setpwent;|setservent;|setsockopt;|shift;|shmctl;|shmget;|shmread;|shmwrite;|shutdown;|socket;|socketpair;|sort;|splice;|split;|sprintf;|state;|study;|substr;|symlink;|syscall;|sysopen;|sysread;|sysseek;|system;|syswrite;|tell;|telldir;|tie;|tied;|time;|times;|tr;|truncate;|unless;|unlink;|unpack;|unshift;|untie;|until;|utime;|values;|vec;|wait;|waitpid;|wantarray;|warn;|when;|write;|y;)/gc and return ('OP01_NAMED_SCOLON', $1);
      /\G(abs\s|accept\s|atan2\s|bind\s|binmode\s|bless\s|break\s|chmod\s|chomp\s|chop\s|chown\s|chr\s|closedir\s|connect\s|continue\s|crypt\s|dbmclose\s|dbmopen\s|default\s|dump\s|each\s|endgrent\s|endhostent\s|endnetent\s|endprotoent\s|endpwent\s|endservent\s|eof\s|evalbytes\s|exec\s|exp\s|fc\s|fcntl\s|fileno\s|flock\s|fork\s|format\s|formline\s|getc\s|getgrent\s|getgrgid\s|getgrnam\s|gethostbyaddr\s|gethostent\s|getlogin\s|getnetbyaddr\s|getnetent\s|getpeername\s|getppid\s|getpriority\s|getprotobynumber\s|getprotoent\s|getpwent\s|getpwnam\s|getpwuid\s|getservbyname\s|getservbyport\s|getservent\s|getsockname\s|getsockopt\s|given\s|grep\s|index\s|ioctl\s|join\s|keys\s|kill\s|link\s|listen\s|local\s|m\s|map\s|mkdir\s|msgctl\s|msgget\s|msgrcv\s|msgsnd\s|opendir\s|pack\s|pipe\s|pop\s|pos\s|prototype\s|push\s|q\s|qq\s|qr\s|qx\s|read\s|readdir\s|readline\s|readpipe\s|recv\s|rename\s|reset\s|reverse\s|rewinddir\s|rindex\s|s\s|say\s|seek\s|seekdir\s|select\s|semctl\s|semget\s|semop\s|send\s|setgrent\s|sethostent\s|setnetent\s|setpgrp\s|setpriority\s|setprotoent\s|setpwent\s|setservent\s|setsockopt\s|shift\s|shmctl\s|shmget\s|shmread\s|shmwrite\s|shutdown\s|socket\s|socketpair\s|sort\s|splice\s|split\s|sprintf\s|state\s|study\s|substr\s|symlink\s|syscall\s|sysopen\s|sysread\s|sysseek\s|system\s|syswrite\s|tell\s|telldir\s|tie\s|tied\s|time\s|times\s|tr\s|truncate\s|unless\s|unlink\s|unpack\s|unshift\s|untie\s|until\s|utime\s|values\s|vec\s|wait\s|waitpid\s|wantarray\s|warn\s|when\s|write\s|y\s)/gc and return ('OP01_NAMED', $1);
      /\G(:)/gc and return ('COLON', $1);
      /\G(\(\s*my)/gc and return ('LPAREN_MY', $1);
      /\G(\()/gc and return ('LPAREN', $1);
      /\G(\[)/gc and return ('LBRACKET', $1);
      /\G(\{)/gc and return ('LBRACE', $1);
      /\G([a-z]\w*|[A-Z]\w*[a-z]\w*)/gc and return ('WORD', $1);
      /\G([A-Z][A-Z0-9_]*|[A-Z])/gc and return ('WORD_UPPERCASE', $1);


      return ('', undef) if ($_ eq '') || (defined(pos($_)) && (pos($_) >= length($_)));
      /\G\s*(\S+)/;
      my $near = substr($1,0,10); 

      return($near, $near);

     # die( "Error inside the lexical analyzer near '". $near
     #     ."'. Line: ".$self->line()
     #     .". File: '".$self->YYFilename()."'. No match found.\n");
    }
  }
;


#line 143 lib/RPerl/GrammarMedium.pm

my $warnmessage =<< "EOFWARN";
Warning!: Did you changed the \@RPerl::GrammarMedium::ISA variable inside the header section of the eyapp program?
EOFWARN

sub new {
  my($class)=shift;
  ref($class) and $class=ref($class);

  warn $warnmessage unless __PACKAGE__->isa('Parse::Eyapp::Driver'); 
  my($self)=$class->SUPER::new( 
    yyversion => '1.182',
    yyGRAMMAR  =>
[#[productionNameAndLabel => lhs, [ rhs], bypass]]
  [ '_SUPERSTART' => '$start', [ 'CompileUnit', '$end' ], 0 ],
  [ '_PAREN' => 'PAREN-1', [ 'ModuleHeader', 'Module' ], 0 ],
  [ '_PLUS_LIST' => 'PLUS-2', [ 'PLUS-2', 'PAREN-1' ], 0 ],
  [ '_PLUS_LIST' => 'PLUS-2', [ 'PAREN-1' ], 0 ],
  [ 'CompileUnit_4' => 'CompileUnit', [ 'Program' ], 0 ],
  [ 'CompileUnit_5' => 'CompileUnit', [ 'PLUS-2' ], 0 ],
  [ '_OPTIONAL' => 'OPTIONAL-3', [ 'Critic' ], 0 ],
  [ '_OPTIONAL' => 'OPTIONAL-3', [  ], 0 ],
  [ '_STAR_LIST' => 'STAR-4', [ 'STAR-4', 'Critic' ], 0 ],
  [ '_STAR_LIST' => 'STAR-4', [  ], 0 ],
  [ '_STAR_LIST' => 'STAR-5', [ 'STAR-5', 'Include' ], 0 ],
  [ '_STAR_LIST' => 'STAR-5', [  ], 0 ],
  [ '_STAR_LIST' => 'STAR-6', [ 'STAR-6', 'Constant' ], 0 ],
  [ '_STAR_LIST' => 'STAR-6', [  ], 0 ],
  [ '_STAR_LIST' => 'STAR-7', [ 'STAR-7', 'Subroutine' ], 0 ],
  [ '_STAR_LIST' => 'STAR-7', [  ], 0 ],
  [ '_PLUS_LIST' => 'PLUS-8', [ 'PLUS-8', 'Operation' ], 0 ],
  [ '_PLUS_LIST' => 'PLUS-8', [ 'Operation' ], 0 ],
  [ 'Program_18' => 'Program', [ 'SHEBANG', 'OPTIONAL-3', 'USE_RPERL', 'Header', 'STAR-4', 'STAR-5', 'STAR-6', 'STAR-7', 'PLUS-8' ], 0 ],
  [ '_OPTIONAL' => 'OPTIONAL-9', [ 'Critic' ], 0 ],
  [ '_OPTIONAL' => 'OPTIONAL-9', [  ], 0 ],
  [ '_OPTIONAL' => 'OPTIONAL-10', [ 'USE_RPERL' ], 0 ],
  [ '_OPTIONAL' => 'OPTIONAL-10', [  ], 0 ],
  [ 'ModuleHeader_23' => 'ModuleHeader', [ 'OPTIONAL-9', 'OPTIONAL-10', 'package', 'WordScoped', ';', 'Header' ], 0 ],
  [ 'Module_24' => 'Module', [ 'Package' ], 0 ],
  [ 'Module_25' => 'Module', [ 'Class' ], 0 ],
  [ '_STAR_LIST' => 'STAR-11', [ 'STAR-11', 'Critic' ], 0 ],
  [ '_STAR_LIST' => 'STAR-11', [  ], 0 ],
  [ '_STAR_LIST' => 'STAR-12', [ 'STAR-12', 'Include' ], 0 ],
  [ '_STAR_LIST' => 'STAR-12', [  ], 0 ],
  [ '_STAR_LIST' => 'STAR-13', [ 'STAR-13', 'Constant' ], 0 ],
  [ '_STAR_LIST' => 'STAR-13', [  ], 0 ],
  [ '_PLUS_LIST' => 'PLUS-14', [ 'PLUS-14', 'Subroutine' ], 0 ],
  [ '_PLUS_LIST' => 'PLUS-14', [ 'Subroutine' ], 0 ],
  [ 'Package_34' => 'Package', [ 'STAR-11', 'STAR-12', 'STAR-13', 'PLUS-14', 'LITERAL_NUMBER', ';' ], 0 ],
  [ '_OPTIONAL' => 'OPTIONAL-15', [ 'USE_RPERL_AFTER' ], 0 ],
  [ '_OPTIONAL' => 'OPTIONAL-15', [  ], 0 ],
  [ 'Header_37' => 'Header', [ 'use strict;', 'use warnings;', 'OPTIONAL-15', 'our', 'VERSION_NUMBER_ASSIGN' ], 0 ],
  [ '_PLUS_LIST' => 'PLUS-16', [ 'PLUS-16', 'WORD' ], 0 ],
  [ '_PLUS_LIST' => 'PLUS-16', [ 'WORD' ], 0 ],
  [ 'Critic_40' => 'Critic', [ '## no critic qw(', 'PLUS-16', ')' ], 0 ],
  [ 'Include_41' => 'Include', [ 'USE', 'WordScoped', ';' ], 0 ],
  [ 'Include_42' => 'Include', [ 'USE', 'WordScoped', 'OP01_QW', ';' ], 0 ],
  [ 'Constant_43' => 'Constant', [ 'use constant', 'WORD_UPPERCASE', 'OP20_HASH_FATARROW', 'TypeInnerConstant', 'Literal', ';' ], 0 ],
  [ '_OPTIONAL' => 'OPTIONAL-17', [ 'SubroutineArguments' ], 0 ],
  [ '_OPTIONAL' => 'OPTIONAL-17', [  ], 0 ],
  [ '_STAR_LIST' => 'STAR-18', [ 'STAR-18', 'Operation' ], 0 ],
  [ '_STAR_LIST' => 'STAR-18', [  ], 0 ],
  [ 'Subroutine_48' => 'Subroutine', [ 'our', 'Type', 'VARIABLE_SYMBOL', '= sub {', 'OPTIONAL-17', 'STAR-18', '}', ';' ], 0 ],
  [ '_PAREN' => 'PAREN-19', [ 'OP21_LIST_COMMA', 'MY', 'Type', 'VARIABLE_SYMBOL' ], 0 ],
  [ '_STAR_LIST' => 'STAR-20', [ 'STAR-20', 'PAREN-19' ], 0 ],
  [ '_STAR_LIST' => 'STAR-20', [  ], 0 ],
  [ 'SubroutineArguments_52' => 'SubroutineArguments', [ 'LPAREN_MY', 'Type', 'VARIABLE_SYMBOL', 'STAR-20', ')', 'OP19_VARIABLE_ASSIGN', '@ARG;' ], 0 ],
  [ '_STAR_LIST' => 'STAR-21', [ 'STAR-21', 'Critic' ], 0 ],
  [ '_STAR_LIST' => 'STAR-21', [  ], 0 ],
  [ '_STAR_LIST' => 'STAR-22', [ 'STAR-22', 'Include' ], 0 ],
  [ '_STAR_LIST' => 'STAR-22', [  ], 0 ],
  [ '_STAR_LIST' => 'STAR-23', [ 'STAR-23', 'Constant' ], 0 ],
  [ '_STAR_LIST' => 'STAR-23', [  ], 0 ],
  [ '_STAR_LIST' => 'STAR-24', [ 'STAR-24', 'SubroutineOrMethod' ], 0 ],
  [ '_STAR_LIST' => 'STAR-24', [  ], 0 ],
  [ 'Class_61' => 'Class', [ 'use parent qw(', 'WordScoped', ')', ';', 'Include', 'STAR-21', 'STAR-22', 'STAR-23', 'Properties', 'STAR-24', 'LITERAL_NUMBER', ';' ], 0 ],
  [ '_PAREN' => 'PAREN-25', [ 'OP21_LIST_COMMA', 'HashEntryProperties' ], 0 ],
  [ '_STAR_LIST' => 'STAR-26', [ 'STAR-26', 'PAREN-25' ], 0 ],
  [ '_STAR_LIST' => 'STAR-26', [  ], 0 ],
  [ 'Properties_65' => 'Properties', [ 'our hashref $properties', 'OP19_VARIABLE_ASSIGN', 'LBRACE', 'HashEntryProperties', 'STAR-26', '}', ';' ], 0 ],
  [ 'Properties_66' => 'Properties', [ 'our hashref $properties', 'OP19_VARIABLE_ASSIGN', 'LBRACE', '}', ';' ], 0 ],
  [ '_OPTIONAL' => 'OPTIONAL-27', [ 'MethodArguments' ], 0 ],
  [ '_OPTIONAL' => 'OPTIONAL-27', [  ], 0 ],
  [ '_STAR_LIST' => 'STAR-28', [ 'STAR-28', 'Operation' ], 0 ],
  [ '_STAR_LIST' => 'STAR-28', [  ], 0 ],
  [ 'Method_71' => 'Method', [ 'our', 'TYPE_METHOD', 'VARIABLE_SYMBOL', '= sub {', 'OPTIONAL-27', 'STAR-28', '}', ';' ], 0 ],
  [ '_PAREN' => 'PAREN-29', [ 'OP21_LIST_COMMA', 'MY', 'Type', 'VARIABLE_SYMBOL' ], 0 ],
  [ '_STAR_LIST' => 'STAR-30', [ 'STAR-30', 'PAREN-29' ], 0 ],
  [ '_STAR_LIST' => 'STAR-30', [  ], 0 ],
  [ 'MethodArguments_75' => 'MethodArguments', [ 'LPAREN_MY', 'Type', 'SELF', 'STAR-30', ')', 'OP19_VARIABLE_ASSIGN', '@ARG;' ], 0 ],
  [ 'SubroutineOrMethod_76' => 'SubroutineOrMethod', [ 'Subroutine' ], 0 ],
  [ 'SubroutineOrMethod_77' => 'SubroutineOrMethod', [ 'Method' ], 0 ],
  [ 'Operation_78' => 'Operation', [ 'Expression', ';' ], 0 ],
  [ 'Operation_79' => 'Operation', [ 'OP01_NAMED_SCOLON' ], 0 ],
  [ 'Operation_80' => 'Operation', [ 'OP10_NAMED_UNARY_SCOLON' ], 0 ],
  [ 'Operation_81' => 'Operation', [ 'Statement' ], 0 ],
  [ 'Operator_82' => 'Operator', [ 'LPAREN', 'OP01_PRINT', 'FHREF_SYMBOL_BRACES', 'ListElements', ')' ], 0 ],
  [ 'Operator_83' => 'Operator', [ 'OP01_NAMED', 'SubExpression' ], 0 ],
  [ 'Operator_84' => 'Operator', [ 'LPAREN', 'OP01_NAMED', 'ListElement', 'OP21_LIST_COMMA', 'ListElements', ')' ], 0 ],
  [ 'Operator_85' => 'Operator', [ 'OP01_OPEN', 'MY', 'TYPE_FHREF', 'FHREF_SYMBOL', 'OP21_LIST_COMMA', 'LITERAL_STRING', 'OP21_LIST_COMMA', 'SubExpression' ], 0 ],
  [ 'Operator_86' => 'Operator', [ 'OP01_CLOSE', 'FHREF_SYMBOL' ], 0 ],
  [ 'Operator_87' => 'Operator', [ 'OP03_MATH_INC_DEC', 'Variable' ], 0 ],
  [ 'Operator_88' => 'Operator', [ 'Variable', 'OP03_MATH_INC_DEC' ], 0 ],
  [ 'Operator_89' => 'Operator', [ 'SubExpression', 'OP04_MATH_POW', 'SubExpression' ], 0 ],
  [ 'Operator_90' => 'Operator', [ 'OP05_BITWISE_NEG_LPAREN', 'SubExpression', ')' ], 0 ],
  [ 'Operator_91' => 'Operator', [ 'OP05_LOGICAL_NEG', 'SubExpression' ], 0 ],
  [ 'Operator_92' => 'Operator', [ 'OP05_MATH_NEG_LPAREN', 'SubExpression', ')' ], 0 ],
  [ 'Operator_93' => 'Operator', [ 'SubExpression', 'OP06_REGEX_MATCH', 'OP06_REGEX_PATTERN' ], 0 ],
  [ 'Operator_94' => 'Operator', [ 'SubExpression', 'OP07_STRING_REPEAT', 'SubExpression' ], 0 ],
  [ 'Operator_95' => 'Operator', [ 'SubExpression', 'OP07_MATH_MULT_DIV_MOD', 'SubExpression' ], 0 ],
  [ 'Operator_96' => 'Operator', [ 'SubExpression', 'OP08_MATH_ADD_SUB', 'SubExpression' ], 0 ],
  [ 'Operator_97' => 'Operator', [ 'SubExpression', 'OP08_STRING_CAT', 'SubExpression' ], 0 ],
  [ 'Operator_98' => 'Operator', [ 'SubExpression', 'OP09_BITWISE_SHIFT', 'SubExpression' ], 0 ],
  [ 'Operator_99' => 'Operator', [ 'OP10_NAMED_UNARY', 'SubExpression' ], 0 ],
  [ 'Operator_100' => 'Operator', [ 'OP10_NAMED_UNARY' ], 0 ],
  [ 'Operator_101' => 'Operator', [ 'SubExpression', 'OP11_COMPARE_LT_GT', 'SubExpression' ], 0 ],
  [ 'Operator_102' => 'Operator', [ 'SubExpression', 'OP12_COMPARE_EQ_NE', 'SubExpression' ], 0 ],
  [ 'Operator_103' => 'Operator', [ 'SubExpression', 'OP13_BITWISE_AND', 'SubExpression' ], 0 ],
  [ 'Operator_104' => 'Operator', [ 'SubExpression', 'OP14_BITWISE_OR_XOR', 'SubExpression' ], 0 ],
  [ 'Operator_105' => 'Operator', [ 'SubExpression', 'OP15_LOGICAL_AND', 'SubExpression' ], 0 ],
  [ 'Operator_106' => 'Operator', [ 'SubExpression', 'OP16_LOGICAL_OR', 'SubExpression' ], 0 ],
  [ 'Operator_107' => 'Operator', [ 'SubExpression', 'OP17_LIST_RANGE', 'SubExpression' ], 0 ],
  [ 'Operator_108' => 'Operator', [ 'SubExpression', 'OP18_TERNARY', 'VariableOrLiteral', 'COLON', 'VariableOrLiteral' ], 0 ],
  [ 'Operator_109' => 'Operator', [ 'OP22_LOGICAL_NEG', 'SubExpression' ], 0 ],
  [ 'Operator_110' => 'Operator', [ 'SubExpression', 'OP23_LOGICAL_AND', 'SubExpression' ], 0 ],
  [ 'Operator_111' => 'Operator', [ 'SubExpression', 'OP24_LOGICAL_OR_XOR', 'SubExpression' ], 0 ],
  [ '_PAREN' => 'PAREN-31', [ 'STDOUT_STDERR' ], 0 ],
  [ '_OPTIONAL' => 'OPTIONAL-32', [ 'PAREN-31' ], 0 ],
  [ '_OPTIONAL' => 'OPTIONAL-32', [  ], 0 ],
  [ '_OPTIONAL' => 'OPTIONAL-33', [ 'ListElements' ], 0 ],
  [ '_OPTIONAL' => 'OPTIONAL-33', [  ], 0 ],
  [ 'OperatorVoid_117' => 'OperatorVoid', [ 'OP01_PRINT', 'OPTIONAL-32', 'ListElements', ';' ], 0 ],
  [ 'OperatorVoid_118' => 'OperatorVoid', [ 'OP01_PRINT', 'FHREF_SYMBOL_BRACES', 'ListElements', ';' ], 0 ],
  [ 'OperatorVoid_119' => 'OperatorVoid', [ 'OP01_NAMED_VOID_SCOLON' ], 0 ],
  [ 'OperatorVoid_120' => 'OperatorVoid', [ 'OP01_NAMED_VOID_LPAREN', 'OPTIONAL-33', ')', ';' ], 0 ],
  [ 'OperatorVoid_121' => 'OperatorVoid', [ 'OP01_NAMED_VOID', 'ListElements', ';' ], 0 ],
  [ 'OperatorVoid_122' => 'OperatorVoid', [ 'OP01_NAMED', 'ListElement', 'OP21_LIST_COMMA', 'ListElements', ';' ], 0 ],
  [ 'OperatorVoid_123' => 'OperatorVoid', [ 'OP19_LOOP_CONTROL_SCOLON' ], 0 ],
  [ 'OperatorVoid_124' => 'OperatorVoid', [ 'OP19_LOOP_CONTROL', 'LoopLabel', ';' ], 0 ],
  [ '_OPTIONAL' => 'OPTIONAL-34', [ 'ListElements' ], 0 ],
  [ '_OPTIONAL' => 'OPTIONAL-34', [  ], 0 ],
  [ '_OPTIONAL' => 'OPTIONAL-35', [ 'ListElements' ], 0 ],
  [ '_OPTIONAL' => 'OPTIONAL-35', [  ], 0 ],
  [ 'Expression_129' => 'Expression', [ 'Operator' ], 0 ],
  [ 'Expression_130' => 'Expression', [ 'WORD_UPPERCASE', 'LPAREN', ')' ], 0 ],
  [ 'Expression_131' => 'Expression', [ 'CONSTANT_CALL_SCOPED' ], 0 ],
  [ 'Expression_132' => 'Expression', [ 'WordScoped', 'LPAREN', 'OPTIONAL-34', ')' ], 0 ],
  [ 'Expression_133' => 'Expression', [ 'Variable', 'OP02_METHOD_THINARROW', 'LPAREN', 'OPTIONAL-35', ')' ], 0 ],
  [ 'Expression_134' => 'Expression', [ 'WordScoped', 'OP02_METHOD_THINARROW_NEW', ')' ], 0 ],
  [ 'SubExpression_135' => 'SubExpression', [ 'Expression' ], 0 ],
  [ 'SubExpression_136' => 'SubExpression', [ 'undef' ], 0 ],
  [ 'SubExpression_137' => 'SubExpression', [ 'Literal' ], 0 ],
  [ 'SubExpression_138' => 'SubExpression', [ 'Variable' ], 0 ],
  [ 'SubExpression_139' => 'SubExpression', [ 'ArrayReference' ], 0 ],
  [ 'SubExpression_140' => 'SubExpression', [ 'ArrayDereference' ], 0 ],
  [ 'SubExpression_141' => 'SubExpression', [ 'HashReference' ], 0 ],
  [ 'SubExpression_142' => 'SubExpression', [ 'HashDereference' ], 0 ],
  [ 'SubExpression_143' => 'SubExpression', [ 'LPAREN', 'SubExpression', ')' ], 0 ],
  [ 'SubExpressionOrInput_144' => 'SubExpressionOrInput', [ 'SubExpression' ], 0 ],
  [ 'SubExpressionOrInput_145' => 'SubExpressionOrInput', [ 'FHREF_SYMBOL_IN' ], 0 ],
  [ 'SubExpressionOrInput_146' => 'SubExpressionOrInput', [ 'STDIN' ], 0 ],
  [ 'SubExpressionOrVarMod_147' => 'SubExpressionOrVarMod', [ 'SubExpression' ], 0 ],
  [ 'SubExpressionOrVarMod_148' => 'SubExpressionOrVarMod', [ 'VariableModification' ], 0 ],
  [ '_PAREN' => 'PAREN-36', [ 'LoopLabel', 'COLON' ], 0 ],
  [ '_OPTIONAL' => 'OPTIONAL-37', [ 'PAREN-36' ], 0 ],
  [ '_OPTIONAL' => 'OPTIONAL-37', [  ], 0 ],
  [ 'Statement_152' => 'Statement', [ 'Conditional' ], 0 ],
  [ 'Statement_153' => 'Statement', [ 'OPTIONAL-37', 'Loop' ], 0 ],
  [ 'Statement_154' => 'Statement', [ 'OperatorVoid' ], 0 ],
  [ 'Statement_155' => 'Statement', [ 'VariableDeclaration' ], 0 ],
  [ 'Statement_156' => 'Statement', [ 'VariableModification', ';' ], 0 ],
  [ '_PAREN' => 'PAREN-38', [ 'elsif', 'LPAREN', 'SubExpression', ')', 'CodeBlock' ], 0 ],
  [ '_STAR_LIST' => 'STAR-39', [ 'STAR-39', 'PAREN-38' ], 0 ],
  [ '_STAR_LIST' => 'STAR-39', [  ], 0 ],
  [ '_PAREN' => 'PAREN-40', [ 'else', 'CodeBlock' ], 0 ],
  [ '_OPTIONAL' => 'OPTIONAL-41', [ 'PAREN-40' ], 0 ],
  [ '_OPTIONAL' => 'OPTIONAL-41', [  ], 0 ],
  [ 'Conditional_163' => 'Conditional', [ 'if', 'LPAREN', 'SubExpression', ')', 'CodeBlock', 'STAR-39', 'OPTIONAL-41' ], 0 ],
  [ 'Loop_164' => 'Loop', [ 'LoopFor' ], 0 ],
  [ 'Loop_165' => 'Loop', [ 'LoopForEach' ], 0 ],
  [ 'Loop_166' => 'Loop', [ 'LoopWhile' ], 0 ],
  [ 'LoopFor_167' => 'LoopFor', [ 'for', 'MY', 'TYPE_INTEGER', 'VARIABLE_SYMBOL', 'LPAREN', 'SubExpression', 'OP17_LIST_RANGE', 'SubExpression', ')', 'CodeBlock' ], 0 ],
  [ 'LoopFor_168' => 'LoopFor', [ 'for', 'LPAREN_MY', 'TYPE_INTEGER', 'VARIABLE_SYMBOL', 'OP19_VARIABLE_ASSIGN', 'OpNamedScolonOrSubExp', 'VARIABLE_SYMBOL', 'OP11_COMPARE_LT_GT', 'OpNamedScolonOrSubExp', 'SubExpressionOrVarMod', ')', 'CodeBlock' ], 0 ],
  [ 'LoopForEach_169' => 'LoopForEach', [ 'foreach', 'MY', 'Type', 'VARIABLE_SYMBOL', 'LPAREN', 'ListElements', ')', 'CodeBlock' ], 0 ],
  [ 'LoopWhile_170' => 'LoopWhile', [ 'while', 'LPAREN', 'SubExpression', ')', 'CodeBlock' ], 0 ],
  [ 'LoopWhile_171' => 'LoopWhile', [ 'while', 'LPAREN_MY', 'Type', 'VARIABLE_SYMBOL', 'OP19_VARIABLE_ASSIGN', 'SubExpressionOrInput', ')', 'CodeBlock' ], 0 ],
  [ '_PLUS_LIST' => 'PLUS-42', [ 'PLUS-42', 'Operation' ], 0 ],
  [ '_PLUS_LIST' => 'PLUS-42', [ 'Operation' ], 0 ],
  [ 'CodeBlock_174' => 'CodeBlock', [ 'LBRACE', 'PLUS-42', '}' ], 0 ],
  [ '_STAR_LIST' => 'STAR-43', [ 'STAR-43', 'VariableRetrieval' ], 0 ],
  [ '_STAR_LIST' => 'STAR-43', [  ], 0 ],
  [ 'Variable_177' => 'Variable', [ 'VariableSymbolOrSelf', 'STAR-43' ], 0 ],
  [ 'VariableRetrieval_178' => 'VariableRetrieval', [ 'OP02_ARRAY_THINARROW', 'SubExpression', ']' ], 0 ],
  [ 'VariableRetrieval_179' => 'VariableRetrieval', [ 'OP02_HASH_THINARROW', 'SubExpression', '}' ], 0 ],
  [ 'VariableRetrieval_180' => 'VariableRetrieval', [ 'OP02_HASH_THINARROW', 'WORD', '}' ], 0 ],
  [ 'VariableDeclaration_181' => 'VariableDeclaration', [ 'MY', 'Type', 'VARIABLE_SYMBOL', ';' ], 0 ],
  [ 'VariableDeclaration_182' => 'VariableDeclaration', [ 'MY', 'Type', 'VARIABLE_SYMBOL', 'OP19_VARIABLE_ASSIGN', 'OpNamedScolonOrSubExpIn' ], 0 ],
  [ 'VariableDeclaration_183' => 'VariableDeclaration', [ 'MY', 'Type', 'VARIABLE_SYMBOL', 'OP02_ARRAY_THINARROW', 'SubExpression', ']', 'OP19_VARIABLE_ASSIGN', 'undef', ';' ], 0 ],
  [ 'VariableDeclaration_184' => 'VariableDeclaration', [ 'MY', 'TYPE_FHREF', 'FHREF_SYMBOL', ';' ], 0 ],
  [ 'VariableModification_185' => 'VariableModification', [ 'Variable', 'OP19_VARIABLE_ASSIGN', 'SubExpressionOrInput' ], 0 ],
  [ 'VariableModification_186' => 'VariableModification', [ 'Variable', 'OP19_VARIABLE_ASSIGN_BY', 'SubExpression' ], 0 ],
  [ '_PAREN' => 'PAREN-44', [ 'OP21_LIST_COMMA', 'ListElement' ], 0 ],
  [ '_STAR_LIST' => 'STAR-45', [ 'STAR-45', 'PAREN-44' ], 0 ],
  [ '_STAR_LIST' => 'STAR-45', [  ], 0 ],
  [ 'ListElements_190' => 'ListElements', [ 'ListElement', 'STAR-45' ], 0 ],
  [ 'ListElement_191' => 'ListElement', [ 'SubExpression' ], 0 ],
  [ 'ListElement_192' => 'ListElement', [ 'TypeInner', 'SubExpression' ], 0 ],
  [ 'ListElement_193' => 'ListElement', [ 'OP01_QW' ], 0 ],
  [ 'ListElement_194' => 'ListElement', [ 'ARGV' ], 0 ],
  [ '_OPTIONAL' => 'OPTIONAL-46', [ 'ListElements' ], 0 ],
  [ '_OPTIONAL' => 'OPTIONAL-46', [  ], 0 ],
  [ 'ArrayReference_197' => 'ArrayReference', [ 'LBRACKET', 'OPTIONAL-46', ']' ], 0 ],
  [ '_OPTIONAL' => 'OPTIONAL-47', [ 'TypeInner' ], 0 ],
  [ '_OPTIONAL' => 'OPTIONAL-47', [  ], 0 ],
  [ 'ArrayDereference_200' => 'ArrayDereference', [ '@{', 'Variable', '}' ], 0 ],
  [ 'ArrayDereference_201' => 'ArrayDereference', [ '@{', 'OPTIONAL-47', 'ArrayReference', '}' ], 0 ],
  [ '_OPTIONAL' => 'OPTIONAL-48', [ 'TypeInner' ], 0 ],
  [ '_OPTIONAL' => 'OPTIONAL-48', [  ], 0 ],
  [ 'HashEntry_204' => 'HashEntry', [ 'VarOrLitOrOpStrOrWord', 'OP20_HASH_FATARROW', 'OPTIONAL-48', 'SubExpression' ], 0 ],
  [ 'HashEntry_205' => 'HashEntry', [ 'HashDereference' ], 0 ],
  [ 'HashEntry_206' => 'HashEntry', [ 'ENV' ], 0 ],
  [ 'HashEntryProperties_207' => 'HashEntryProperties', [ 'OpStringOrWord', 'OP20_HASH_FATARROW', 'TypeInnerProperties' ], 0 ],
  [ '_PAREN' => 'PAREN-49', [ 'OP21_LIST_COMMA', 'HashEntry' ], 0 ],
  [ '_STAR_LIST' => 'STAR-50', [ 'STAR-50', 'PAREN-49' ], 0 ],
  [ '_STAR_LIST' => 'STAR-50', [  ], 0 ],
  [ 'HashReference_211' => 'HashReference', [ 'LBRACE', 'HashEntry', 'STAR-50', '}' ], 0 ],
  [ 'HashReference_212' => 'HashReference', [ 'LBRACE', '}' ], 0 ],
  [ '_OPTIONAL' => 'OPTIONAL-51', [ 'TypeInner' ], 0 ],
  [ '_OPTIONAL' => 'OPTIONAL-51', [  ], 0 ],
  [ 'HashDereference_215' => 'HashDereference', [ '%{', 'Variable', '}' ], 0 ],
  [ 'HashDereference_216' => 'HashDereference', [ '%{', 'OPTIONAL-51', 'HashReference', '}' ], 0 ],
  [ 'WordScoped_217' => 'WordScoped', [ 'WORD' ], 0 ],
  [ 'WordScoped_218' => 'WordScoped', [ 'WORD_SCOPED' ], 0 ],
  [ 'LoopLabel_219' => 'LoopLabel', [ 'WORD_UPPERCASE' ], 0 ],
  [ 'Type_220' => 'Type', [ 'WORD' ], 0 ],
  [ 'Type_221' => 'Type', [ 'WORD_SCOPED' ], 0 ],
  [ 'Type_222' => 'Type', [ 'TYPE_INTEGER' ], 0 ],
  [ 'TypeInner_223' => 'TypeInner', [ 'MY', 'Type', '$TYPED_', 'OpStringOrWord', 'OP19_VARIABLE_ASSIGN' ], 0 ],
  [ 'TypeInnerProperties_224' => 'TypeInnerProperties', [ 'MY', 'Type', '$TYPED_', 'OpStringOrWord', 'OP19_VARIABLE_ASSIGN', 'SubExpression' ], 0 ],
  [ 'TypeInnerProperties_225' => 'TypeInnerProperties', [ 'MY', 'Type', '$TYPED_', 'OpStringOrWord', 'OP02_ARRAY_THINARROW', 'SubExpression', ']', 'OP19_VARIABLE_ASSIGN', 'undef' ], 0 ],
  [ 'TypeInnerConstant_226' => 'TypeInnerConstant', [ 'MY', 'Type', '$TYPED_', 'WORD_UPPERCASE', 'OP19_VARIABLE_ASSIGN' ], 0 ],
  [ 'VariableOrLiteral_227' => 'VariableOrLiteral', [ 'Variable' ], 0 ],
  [ 'VariableOrLiteral_228' => 'VariableOrLiteral', [ 'Literal' ], 0 ],
  [ 'VarOrLitOrOpStrOrWord_229' => 'VarOrLitOrOpStrOrWord', [ 'Variable' ], 0 ],
  [ 'VarOrLitOrOpStrOrWord_230' => 'VarOrLitOrOpStrOrWord', [ 'Literal' ], 0 ],
  [ 'VarOrLitOrOpStrOrWord_231' => 'VarOrLitOrOpStrOrWord', [ 'OpStringOrWord' ], 0 ],
  [ 'VariableSymbolOrSelf_232' => 'VariableSymbolOrSelf', [ 'VARIABLE_SYMBOL' ], 0 ],
  [ 'VariableSymbolOrSelf_233' => 'VariableSymbolOrSelf', [ 'SELF' ], 0 ],
  [ 'Literal_234' => 'Literal', [ 'LITERAL_NUMBER' ], 0 ],
  [ 'Literal_235' => 'Literal', [ 'LITERAL_STRING' ], 0 ],
  [ 'OpNamedScolonOrSubExp_236' => 'OpNamedScolonOrSubExp', [ 'OP01_NAMED_SCOLON' ], 0 ],
  [ 'OpNamedScolonOrSubExp_237' => 'OpNamedScolonOrSubExp', [ 'OP10_NAMED_UNARY_SCOLON' ], 0 ],
  [ 'OpNamedScolonOrSubExp_238' => 'OpNamedScolonOrSubExp', [ 'SubExpression', ';' ], 0 ],
  [ 'OpNamedScolonOrSubExpIn_239' => 'OpNamedScolonOrSubExpIn', [ 'OP01_NAMED_SCOLON' ], 0 ],
  [ 'OpNamedScolonOrSubExpIn_240' => 'OpNamedScolonOrSubExpIn', [ 'OP10_NAMED_UNARY_SCOLON' ], 0 ],
  [ 'OpNamedScolonOrSubExpIn_241' => 'OpNamedScolonOrSubExpIn', [ 'SubExpressionOrInput', ';' ], 0 ],
  [ 'OpStringOrWord_242' => 'OpStringOrWord', [ 'OP24_LOGICAL_OR_XOR' ], 0 ],
  [ 'OpStringOrWord_243' => 'OpStringOrWord', [ 'OP23_LOGICAL_AND' ], 0 ],
  [ 'OpStringOrWord_244' => 'OpStringOrWord', [ 'OP22_LOGICAL_NEG' ], 0 ],
  [ 'OpStringOrWord_245' => 'OpStringOrWord', [ 'OP19_LOOP_CONTROL_SCOLON' ], 0 ],
  [ 'OpStringOrWord_246' => 'OpStringOrWord', [ 'OP19_LOOP_CONTROL' ], 0 ],
  [ 'OpStringOrWord_247' => 'OpStringOrWord', [ 'OP12_COMPARE_EQ_NE' ], 0 ],
  [ 'OpStringOrWord_248' => 'OpStringOrWord', [ 'OP11_COMPARE_LT_GT' ], 0 ],
  [ 'OpStringOrWord_249' => 'OpStringOrWord', [ 'OP10_NAMED_UNARY' ], 0 ],
  [ 'OpStringOrWord_250' => 'OpStringOrWord', [ 'OP08_MATH_ADD_SUB' ], 0 ],
  [ 'OpStringOrWord_251' => 'OpStringOrWord', [ 'OP07_MATH_MULT_DIV_MOD' ], 0 ],
  [ 'OpStringOrWord_252' => 'OpStringOrWord', [ 'OP07_STRING_REPEAT' ], 0 ],
  [ 'OpStringOrWord_253' => 'OpStringOrWord', [ 'OP01_NAMED' ], 0 ],
  [ 'OpStringOrWord_254' => 'OpStringOrWord', [ 'OP01_CLOSE' ], 0 ],
  [ 'OpStringOrWord_255' => 'OpStringOrWord', [ 'OP01_OPEN' ], 0 ],
  [ 'OpStringOrWord_256' => 'OpStringOrWord', [ 'OP01_NAMED_VOID' ], 0 ],
  [ 'OpStringOrWord_257' => 'OpStringOrWord', [ 'OP01_PRINT' ], 0 ],
  [ 'OpStringOrWord_258' => 'OpStringOrWord', [ 'WORD' ], 0 ],
],
    yyLABELS  =>
{
  '_SUPERSTART' => 0,
  '_PAREN' => 1,
  '_PLUS_LIST' => 2,
  '_PLUS_LIST' => 3,
  'CompileUnit_4' => 4,
  'CompileUnit_5' => 5,
  '_OPTIONAL' => 6,
  '_OPTIONAL' => 7,
  '_STAR_LIST' => 8,
  '_STAR_LIST' => 9,
  '_STAR_LIST' => 10,
  '_STAR_LIST' => 11,
  '_STAR_LIST' => 12,
  '_STAR_LIST' => 13,
  '_STAR_LIST' => 14,
  '_STAR_LIST' => 15,
  '_PLUS_LIST' => 16,
  '_PLUS_LIST' => 17,
  'Program_18' => 18,
  '_OPTIONAL' => 19,
  '_OPTIONAL' => 20,
  '_OPTIONAL' => 21,
  '_OPTIONAL' => 22,
  'ModuleHeader_23' => 23,
  'Module_24' => 24,
  'Module_25' => 25,
  '_STAR_LIST' => 26,
  '_STAR_LIST' => 27,
  '_STAR_LIST' => 28,
  '_STAR_LIST' => 29,
  '_STAR_LIST' => 30,
  '_STAR_LIST' => 31,
  '_PLUS_LIST' => 32,
  '_PLUS_LIST' => 33,
  'Package_34' => 34,
  '_OPTIONAL' => 35,
  '_OPTIONAL' => 36,
  'Header_37' => 37,
  '_PLUS_LIST' => 38,
  '_PLUS_LIST' => 39,
  'Critic_40' => 40,
  'Include_41' => 41,
  'Include_42' => 42,
  'Constant_43' => 43,
  '_OPTIONAL' => 44,
  '_OPTIONAL' => 45,
  '_STAR_LIST' => 46,
  '_STAR_LIST' => 47,
  'Subroutine_48' => 48,
  '_PAREN' => 49,
  '_STAR_LIST' => 50,
  '_STAR_LIST' => 51,
  'SubroutineArguments_52' => 52,
  '_STAR_LIST' => 53,
  '_STAR_LIST' => 54,
  '_STAR_LIST' => 55,
  '_STAR_LIST' => 56,
  '_STAR_LIST' => 57,
  '_STAR_LIST' => 58,
  '_STAR_LIST' => 59,
  '_STAR_LIST' => 60,
  'Class_61' => 61,
  '_PAREN' => 62,
  '_STAR_LIST' => 63,
  '_STAR_LIST' => 64,
  'Properties_65' => 65,
  'Properties_66' => 66,
  '_OPTIONAL' => 67,
  '_OPTIONAL' => 68,
  '_STAR_LIST' => 69,
  '_STAR_LIST' => 70,
  'Method_71' => 71,
  '_PAREN' => 72,
  '_STAR_LIST' => 73,
  '_STAR_LIST' => 74,
  'MethodArguments_75' => 75,
  'SubroutineOrMethod_76' => 76,
  'SubroutineOrMethod_77' => 77,
  'Operation_78' => 78,
  'Operation_79' => 79,
  'Operation_80' => 80,
  'Operation_81' => 81,
  'Operator_82' => 82,
  'Operator_83' => 83,
  'Operator_84' => 84,
  'Operator_85' => 85,
  'Operator_86' => 86,
  'Operator_87' => 87,
  'Operator_88' => 88,
  'Operator_89' => 89,
  'Operator_90' => 90,
  'Operator_91' => 91,
  'Operator_92' => 92,
  'Operator_93' => 93,
  'Operator_94' => 94,
  'Operator_95' => 95,
  'Operator_96' => 96,
  'Operator_97' => 97,
  'Operator_98' => 98,
  'Operator_99' => 99,
  'Operator_100' => 100,
  'Operator_101' => 101,
  'Operator_102' => 102,
  'Operator_103' => 103,
  'Operator_104' => 104,
  'Operator_105' => 105,
  'Operator_106' => 106,
  'Operator_107' => 107,
  'Operator_108' => 108,
  'Operator_109' => 109,
  'Operator_110' => 110,
  'Operator_111' => 111,
  '_PAREN' => 112,
  '_OPTIONAL' => 113,
  '_OPTIONAL' => 114,
  '_OPTIONAL' => 115,
  '_OPTIONAL' => 116,
  'OperatorVoid_117' => 117,
  'OperatorVoid_118' => 118,
  'OperatorVoid_119' => 119,
  'OperatorVoid_120' => 120,
  'OperatorVoid_121' => 121,
  'OperatorVoid_122' => 122,
  'OperatorVoid_123' => 123,
  'OperatorVoid_124' => 124,
  '_OPTIONAL' => 125,
  '_OPTIONAL' => 126,
  '_OPTIONAL' => 127,
  '_OPTIONAL' => 128,
  'Expression_129' => 129,
  'Expression_130' => 130,
  'Expression_131' => 131,
  'Expression_132' => 132,
  'Expression_133' => 133,
  'Expression_134' => 134,
  'SubExpression_135' => 135,
  'SubExpression_136' => 136,
  'SubExpression_137' => 137,
  'SubExpression_138' => 138,
  'SubExpression_139' => 139,
  'SubExpression_140' => 140,
  'SubExpression_141' => 141,
  'SubExpression_142' => 142,
  'SubExpression_143' => 143,
  'SubExpressionOrInput_144' => 144,
  'SubExpressionOrInput_145' => 145,
  'SubExpressionOrInput_146' => 146,
  'SubExpressionOrVarMod_147' => 147,
  'SubExpressionOrVarMod_148' => 148,
  '_PAREN' => 149,
  '_OPTIONAL' => 150,
  '_OPTIONAL' => 151,
  'Statement_152' => 152,
  'Statement_153' => 153,
  'Statement_154' => 154,
  'Statement_155' => 155,
  'Statement_156' => 156,
  '_PAREN' => 157,
  '_STAR_LIST' => 158,
  '_STAR_LIST' => 159,
  '_PAREN' => 160,
  '_OPTIONAL' => 161,
  '_OPTIONAL' => 162,
  'Conditional_163' => 163,
  'Loop_164' => 164,
  'Loop_165' => 165,
  'Loop_166' => 166,
  'LoopFor_167' => 167,
  'LoopFor_168' => 168,
  'LoopForEach_169' => 169,
  'LoopWhile_170' => 170,
  'LoopWhile_171' => 171,
  '_PLUS_LIST' => 172,
  '_PLUS_LIST' => 173,
  'CodeBlock_174' => 174,
  '_STAR_LIST' => 175,
  '_STAR_LIST' => 176,
  'Variable_177' => 177,
  'VariableRetrieval_178' => 178,
  'VariableRetrieval_179' => 179,
  'VariableRetrieval_180' => 180,
  'VariableDeclaration_181' => 181,
  'VariableDeclaration_182' => 182,
  'VariableDeclaration_183' => 183,
  'VariableDeclaration_184' => 184,
  'VariableModification_185' => 185,
  'VariableModification_186' => 186,
  '_PAREN' => 187,
  '_STAR_LIST' => 188,
  '_STAR_LIST' => 189,
  'ListElements_190' => 190,
  'ListElement_191' => 191,
  'ListElement_192' => 192,
  'ListElement_193' => 193,
  'ListElement_194' => 194,
  '_OPTIONAL' => 195,
  '_OPTIONAL' => 196,
  'ArrayReference_197' => 197,
  '_OPTIONAL' => 198,
  '_OPTIONAL' => 199,
  'ArrayDereference_200' => 200,
  'ArrayDereference_201' => 201,
  '_OPTIONAL' => 202,
  '_OPTIONAL' => 203,
  'HashEntry_204' => 204,
  'HashEntry_205' => 205,
  'HashEntry_206' => 206,
  'HashEntryProperties_207' => 207,
  '_PAREN' => 208,
  '_STAR_LIST' => 209,
  '_STAR_LIST' => 210,
  'HashReference_211' => 211,
  'HashReference_212' => 212,
  '_OPTIONAL' => 213,
  '_OPTIONAL' => 214,
  'HashDereference_215' => 215,
  'HashDereference_216' => 216,
  'WordScoped_217' => 217,
  'WordScoped_218' => 218,
  'LoopLabel_219' => 219,
  'Type_220' => 220,
  'Type_221' => 221,
  'Type_222' => 222,
  'TypeInner_223' => 223,
  'TypeInnerProperties_224' => 224,
  'TypeInnerProperties_225' => 225,
  'TypeInnerConstant_226' => 226,
  'VariableOrLiteral_227' => 227,
  'VariableOrLiteral_228' => 228,
  'VarOrLitOrOpStrOrWord_229' => 229,
  'VarOrLitOrOpStrOrWord_230' => 230,
  'VarOrLitOrOpStrOrWord_231' => 231,
  'VariableSymbolOrSelf_232' => 232,
  'VariableSymbolOrSelf_233' => 233,
  'Literal_234' => 234,
  'Literal_235' => 235,
  'OpNamedScolonOrSubExp_236' => 236,
  'OpNamedScolonOrSubExp_237' => 237,
  'OpNamedScolonOrSubExp_238' => 238,
  'OpNamedScolonOrSubExpIn_239' => 239,
  'OpNamedScolonOrSubExpIn_240' => 240,
  'OpNamedScolonOrSubExpIn_241' => 241,
  'OpStringOrWord_242' => 242,
  'OpStringOrWord_243' => 243,
  'OpStringOrWord_244' => 244,
  'OpStringOrWord_245' => 245,
  'OpStringOrWord_246' => 246,
  'OpStringOrWord_247' => 247,
  'OpStringOrWord_248' => 248,
  'OpStringOrWord_249' => 249,
  'OpStringOrWord_250' => 250,
  'OpStringOrWord_251' => 251,
  'OpStringOrWord_252' => 252,
  'OpStringOrWord_253' => 253,
  'OpStringOrWord_254' => 254,
  'OpStringOrWord_255' => 255,
  'OpStringOrWord_256' => 256,
  'OpStringOrWord_257' => 257,
  'OpStringOrWord_258' => 258,
},
    yyTERMS  =>
{ '' => { ISSEMANTIC => 0 },
	'## no critic qw(' => { ISSEMANTIC => 0 },
	'$TYPED_' => { ISSEMANTIC => 0 },
	'%{' => { ISSEMANTIC => 0 },
	')' => { ISSEMANTIC => 0 },
	';' => { ISSEMANTIC => 0 },
	'= sub {' => { ISSEMANTIC => 0 },
	'@ARG;' => { ISSEMANTIC => 0 },
	'@{' => { ISSEMANTIC => 0 },
	']' => { ISSEMANTIC => 0 },
	'else' => { ISSEMANTIC => 0 },
	'elsif' => { ISSEMANTIC => 0 },
	'for' => { ISSEMANTIC => 0 },
	'foreach' => { ISSEMANTIC => 0 },
	'if' => { ISSEMANTIC => 0 },
	'our hashref $properties' => { ISSEMANTIC => 0 },
	'our' => { ISSEMANTIC => 0 },
	'package' => { ISSEMANTIC => 0 },
	'undef' => { ISSEMANTIC => 0 },
	'use constant' => { ISSEMANTIC => 0 },
	'use parent qw(' => { ISSEMANTIC => 0 },
	'use strict;' => { ISSEMANTIC => 0 },
	'use warnings;' => { ISSEMANTIC => 0 },
	'while' => { ISSEMANTIC => 0 },
	'}' => { ISSEMANTIC => 0 },
	ARGV => { ISSEMANTIC => 1 },
	COLON => { ISSEMANTIC => 1 },
	CONSTANT_CALL_SCOPED => { ISSEMANTIC => 1 },
	ENV => { ISSEMANTIC => 1 },
	FHREF_SYMBOL => { ISSEMANTIC => 1 },
	FHREF_SYMBOL_BRACES => { ISSEMANTIC => 1 },
	FHREF_SYMBOL_IN => { ISSEMANTIC => 1 },
	LBRACE => { ISSEMANTIC => 1 },
	LBRACKET => { ISSEMANTIC => 1 },
	LITERAL_NUMBER => { ISSEMANTIC => 1 },
	LITERAL_STRING => { ISSEMANTIC => 1 },
	LPAREN => { ISSEMANTIC => 1 },
	LPAREN_MY => { ISSEMANTIC => 1 },
	MY => { ISSEMANTIC => 1 },
	OP01_CLOSE => { ISSEMANTIC => 1 },
	OP01_NAMED => { ISSEMANTIC => 1 },
	OP01_NAMED_SCOLON => { ISSEMANTIC => 1 },
	OP01_NAMED_VOID => { ISSEMANTIC => 1 },
	OP01_NAMED_VOID_LPAREN => { ISSEMANTIC => 1 },
	OP01_NAMED_VOID_SCOLON => { ISSEMANTIC => 1 },
	OP01_OPEN => { ISSEMANTIC => 1 },
	OP01_PRINT => { ISSEMANTIC => 1 },
	OP01_QW => { ISSEMANTIC => 1 },
	OP02_ARRAY_THINARROW => { ISSEMANTIC => 1 },
	OP02_HASH_THINARROW => { ISSEMANTIC => 1 },
	OP02_METHOD_THINARROW => { ISSEMANTIC => 1 },
	OP02_METHOD_THINARROW_NEW => { ISSEMANTIC => 1 },
	OP03_MATH_INC_DEC => { ISSEMANTIC => 1 },
	OP04_MATH_POW => { ISSEMANTIC => 1 },
	OP05_BITWISE_NEG_LPAREN => { ISSEMANTIC => 1 },
	OP05_LOGICAL_NEG => { ISSEMANTIC => 1 },
	OP05_MATH_NEG_LPAREN => { ISSEMANTIC => 1 },
	OP06_REGEX_MATCH => { ISSEMANTIC => 1 },
	OP06_REGEX_PATTERN => { ISSEMANTIC => 1 },
	OP07_MATH_MULT_DIV_MOD => { ISSEMANTIC => 1 },
	OP07_STRING_REPEAT => { ISSEMANTIC => 1 },
	OP08_MATH_ADD_SUB => { ISSEMANTIC => 1 },
	OP08_STRING_CAT => { ISSEMANTIC => 1 },
	OP09_BITWISE_SHIFT => { ISSEMANTIC => 1 },
	OP10_NAMED_UNARY => { ISSEMANTIC => 1 },
	OP10_NAMED_UNARY_SCOLON => { ISSEMANTIC => 1 },
	OP11_COMPARE_LT_GT => { ISSEMANTIC => 1 },
	OP12_COMPARE_EQ_NE => { ISSEMANTIC => 1 },
	OP13_BITWISE_AND => { ISSEMANTIC => 1 },
	OP14_BITWISE_OR_XOR => { ISSEMANTIC => 1 },
	OP15_LOGICAL_AND => { ISSEMANTIC => 1 },
	OP16_LOGICAL_OR => { ISSEMANTIC => 1 },
	OP17_LIST_RANGE => { ISSEMANTIC => 1 },
	OP18_TERNARY => { ISSEMANTIC => 1 },
	OP19_LOOP_CONTROL => { ISSEMANTIC => 1 },
	OP19_LOOP_CONTROL_SCOLON => { ISSEMANTIC => 1 },
	OP19_VARIABLE_ASSIGN => { ISSEMANTIC => 1 },
	OP19_VARIABLE_ASSIGN_BY => { ISSEMANTIC => 1 },
	OP20_HASH_FATARROW => { ISSEMANTIC => 1 },
	OP21_LIST_COMMA => { ISSEMANTIC => 1 },
	OP22_LOGICAL_NEG => { ISSEMANTIC => 1 },
	OP23_LOGICAL_AND => { ISSEMANTIC => 1 },
	OP24_LOGICAL_OR_XOR => { ISSEMANTIC => 1 },
	SELF => { ISSEMANTIC => 1 },
	SHEBANG => { ISSEMANTIC => 1 },
	STDIN => { ISSEMANTIC => 1 },
	STDOUT_STDERR => { ISSEMANTIC => 1 },
	TYPE_FHREF => { ISSEMANTIC => 1 },
	TYPE_INTEGER => { ISSEMANTIC => 1 },
	TYPE_METHOD => { ISSEMANTIC => 1 },
	USE => { ISSEMANTIC => 1 },
	USE_RPERL => { ISSEMANTIC => 1 },
	USE_RPERL_AFTER => { ISSEMANTIC => 1 },
	VARIABLE_SYMBOL => { ISSEMANTIC => 1 },
	VERSION_NUMBER_ASSIGN => { ISSEMANTIC => 1 },
	WORD => { ISSEMANTIC => 1 },
	WORD_SCOPED => { ISSEMANTIC => 1 },
	WORD_UPPERCASE => { ISSEMANTIC => 1 },
	error => { ISSEMANTIC => 0 },
},
    yyFILENAME  => 'lib/RPerl/GrammarMedium.eyp',
    yystates =>
[
	{#State 0
		ACTIONS => {
			"## no critic qw(" => 7,
			'SHEBANG' => 6,
			'USE_RPERL' => -20,
			"package" => -20
		},
		GOTOS => {
			'OPTIONAL-9' => 2,
			'Program' => 1,
			'Critic' => 5,
			'PLUS-2' => 3,
			'PAREN-1' => 8,
			'CompileUnit' => 9,
			'ModuleHeader' => 4
		}
	},
	{#State 1
		DEFAULT => -4
	},
	{#State 2
		ACTIONS => {
			"package" => -22,
			'USE_RPERL' => 10
		},
		GOTOS => {
			'OPTIONAL-10' => 11
		}
	},
	{#State 3
		ACTIONS => {
			'USE_RPERL' => -20,
			"package" => -20,
			'' => -5,
			"## no critic qw(" => 7
		},
		GOTOS => {
			'OPTIONAL-9' => 2,
			'Critic' => 5,
			'PAREN-1' => 12,
			'ModuleHeader' => 4
		}
	},
	{#State 4
		ACTIONS => {
			"## no critic qw(" => -27,
			"our" => -27,
			"use constant" => -27,
			"use parent qw(" => 16,
			'USE' => -27
		},
		GOTOS => {
			'Package' => 17,
			'Module' => 15,
			'Class' => 14,
			'STAR-11' => 13
		}
	},
	{#State 5
		DEFAULT => -19
	},
	{#State 6
		ACTIONS => {
			"## no critic qw(" => 7,
			'USE_RPERL' => -7
		},
		GOTOS => {
			'Critic' => 19,
			'OPTIONAL-3' => 18
		}
	},
	{#State 7
		ACTIONS => {
			'WORD' => 21
		},
		GOTOS => {
			'PLUS-16' => 20
		}
	},
	{#State 8
		DEFAULT => -3
	},
	{#State 9
		ACTIONS => {
			'' => 22
		}
	},
	{#State 10
		DEFAULT => -21
	},
	{#State 11
		ACTIONS => {
			"package" => 23
		}
	},
	{#State 12
		DEFAULT => -2
	},
	{#State 13
		ACTIONS => {
			'USE' => -29,
			"use constant" => -29,
			"our" => -29,
			"## no critic qw(" => 7
		},
		GOTOS => {
			'STAR-12' => 24,
			'Critic' => 25
		}
	},
	{#State 14
		DEFAULT => -25
	},
	{#State 15
		DEFAULT => -1
	},
	{#State 16
		ACTIONS => {
			'WORD_SCOPED' => 26,
			'WORD' => 28
		},
		GOTOS => {
			'WordScoped' => 27
		}
	},
	{#State 17
		DEFAULT => -24
	},
	{#State 18
		ACTIONS => {
			'USE_RPERL' => 29
		}
	},
	{#State 19
		DEFAULT => -6
	},
	{#State 20
		ACTIONS => {
			'WORD' => 31,
			")" => 30
		}
	},
	{#State 21
		DEFAULT => -39
	},
	{#State 22
		DEFAULT => 0
	},
	{#State 23
		ACTIONS => {
			'WORD_SCOPED' => 26,
			'WORD' => 28
		},
		GOTOS => {
			'WordScoped' => 32
		}
	},
	{#State 24
		ACTIONS => {
			"use constant" => -31,
			'USE' => 34,
			"our" => -31
		},
		GOTOS => {
			'Include' => 35,
			'STAR-13' => 33
		}
	},
	{#State 25
		DEFAULT => -26
	},
	{#State 26
		DEFAULT => -218
	},
	{#State 27
		ACTIONS => {
			")" => 36
		}
	},
	{#State 28
		DEFAULT => -217
	},
	{#State 29
		ACTIONS => {
			"use strict;" => 38
		},
		GOTOS => {
			'Header' => 37
		}
	},
	{#State 30
		DEFAULT => -40
	},
	{#State 31
		DEFAULT => -38
	},
	{#State 32
		ACTIONS => {
			";" => 39
		}
	},
	{#State 33
		ACTIONS => {
			"use constant" => 41,
			"our" => 43
		},
		GOTOS => {
			'Subroutine' => 44,
			'PLUS-14' => 42,
			'Constant' => 40
		}
	},
	{#State 34
		ACTIONS => {
			'WORD_SCOPED' => 26,
			'WORD' => 28
		},
		GOTOS => {
			'WordScoped' => 45
		}
	},
	{#State 35
		DEFAULT => -28
	},
	{#State 36
		ACTIONS => {
			";" => 46
		}
	},
	{#State 37
		DEFAULT => -9,
		GOTOS => {
			'STAR-4' => 47
		}
	},
	{#State 38
		ACTIONS => {
			"use warnings;" => 48
		}
	},
	{#State 39
		ACTIONS => {
			"use strict;" => 38
		},
		GOTOS => {
			'Header' => 49
		}
	},
	{#State 40
		DEFAULT => -30
	},
	{#State 41
		ACTIONS => {
			'WORD_UPPERCASE' => 50
		}
	},
	{#State 42
		ACTIONS => {
			'LITERAL_NUMBER' => 51,
			"our" => 43
		},
		GOTOS => {
			'Subroutine' => 52
		}
	},
	{#State 43
		ACTIONS => {
			'WORD' => 53,
			'TYPE_INTEGER' => 54,
			'WORD_SCOPED' => 56
		},
		GOTOS => {
			'Type' => 55
		}
	},
	{#State 44
		DEFAULT => -33
	},
	{#State 45
		ACTIONS => {
			";" => 57,
			'OP01_QW' => 58
		}
	},
	{#State 46
		ACTIONS => {
			'USE' => 34
		},
		GOTOS => {
			'Include' => 59
		}
	},
	{#State 47
		ACTIONS => {
			'VARIABLE_SYMBOL' => -11,
			'CONSTANT_CALL_SCOPED' => -11,
			'OP22_LOGICAL_NEG' => -11,
			'OP01_PRINT' => -11,
			"## no critic qw(" => 7,
			'USE' => -11,
			'OP05_LOGICAL_NEG' => -11,
			"\@{" => -11,
			"for" => -11,
			'OP01_CLOSE' => -11,
			'LBRACE' => -11,
			"foreach" => -11,
			'OP10_NAMED_UNARY' => -11,
			'OP01_NAMED' => -11,
			'OP05_MATH_NEG_LPAREN' => -11,
			'LITERAL_NUMBER' => -11,
			"our" => -11,
			'OP01_OPEN' => -11,
			'OP19_LOOP_CONTROL' => -11,
			'OP05_BITWISE_NEG_LPAREN' => -11,
			'LITERAL_STRING' => -11,
			"%{" => -11,
			'WORD_SCOPED' => -11,
			'LPAREN' => -11,
			'OP19_LOOP_CONTROL_SCOLON' => -11,
			'OP01_NAMED_SCOLON' => -11,
			'OP01_NAMED_VOID' => -11,
			"while" => -11,
			"undef" => -11,
			'OP01_NAMED_VOID_LPAREN' => -11,
			'OP10_NAMED_UNARY_SCOLON' => -11,
			"use constant" => -11,
			'OP01_NAMED_VOID_SCOLON' => -11,
			'LBRACKET' => -11,
			"if" => -11,
			'SELF' => -11,
			'OP03_MATH_INC_DEC' => -11,
			'MY' => -11,
			'WORD_UPPERCASE' => -11,
			'WORD' => -11
		},
		GOTOS => {
			'STAR-5' => 60,
			'Critic' => 61
		}
	},
	{#State 48
		ACTIONS => {
			"our" => -36,
			'USE_RPERL_AFTER' => 62
		},
		GOTOS => {
			'OPTIONAL-15' => 63
		}
	},
	{#State 49
		DEFAULT => -23
	},
	{#State 50
		ACTIONS => {
			'OP20_HASH_FATARROW' => 64
		}
	},
	{#State 51
		ACTIONS => {
			";" => 65
		}
	},
	{#State 52
		DEFAULT => -32
	},
	{#State 53
		DEFAULT => -220
	},
	{#State 54
		DEFAULT => -222
	},
	{#State 55
		ACTIONS => {
			'VARIABLE_SYMBOL' => 66
		}
	},
	{#State 56
		DEFAULT => -221
	},
	{#State 57
		DEFAULT => -41
	},
	{#State 58
		ACTIONS => {
			";" => 67
		}
	},
	{#State 59
		DEFAULT => -54,
		GOTOS => {
			'STAR-21' => 68
		}
	},
	{#State 60
		ACTIONS => {
			'LBRACKET' => -13,
			"if" => -13,
			'OP01_NAMED_VOID_SCOLON' => -13,
			'SELF' => -13,
			'OP10_NAMED_UNARY_SCOLON' => -13,
			"use constant" => -13,
			'WORD_UPPERCASE' => -13,
			'MY' => -13,
			'WORD' => -13,
			'OP03_MATH_INC_DEC' => -13,
			'OP01_NAMED_SCOLON' => -13,
			'WORD_SCOPED' => -13,
			'LPAREN' => -13,
			'OP19_LOOP_CONTROL_SCOLON' => -13,
			"undef" => -13,
			"while" => -13,
			'OP01_NAMED_VOID_LPAREN' => -13,
			'OP01_NAMED_VOID' => -13,
			'LBRACE' => -13,
			'OP10_NAMED_UNARY' => -13,
			"foreach" => -13,
			'OP01_NAMED' => -13,
			'LITERAL_NUMBER' => -13,
			'OP05_MATH_NEG_LPAREN' => -13,
			"our" => -13,
			'OP01_CLOSE' => -13,
			'LITERAL_STRING' => -13,
			"%{" => -13,
			'OP19_LOOP_CONTROL' => -13,
			'OP01_OPEN' => -13,
			'OP05_BITWISE_NEG_LPAREN' => -13,
			'VARIABLE_SYMBOL' => -13,
			'OP01_PRINT' => -13,
			'OP22_LOGICAL_NEG' => -13,
			'CONSTANT_CALL_SCOPED' => -13,
			"for" => -13,
			'USE' => 34,
			'OP05_LOGICAL_NEG' => -13,
			"\@{" => -13
		},
		GOTOS => {
			'Include' => 69,
			'STAR-6' => 70
		}
	},
	{#State 61
		DEFAULT => -8
	},
	{#State 62
		DEFAULT => -35
	},
	{#State 63
		ACTIONS => {
			"our" => 71
		}
	},
	{#State 64
		ACTIONS => {
			'MY' => 73
		},
		GOTOS => {
			'TypeInnerConstant' => 72
		}
	},
	{#State 65
		DEFAULT => -34
	},
	{#State 66
		ACTIONS => {
			"= sub {" => 74
		}
	},
	{#State 67
		DEFAULT => -42
	},
	{#State 68
		ACTIONS => {
			'USE' => -56,
			"use constant" => -56,
			"our hashref \$properties" => -56,
			"## no critic qw(" => 7
		},
		GOTOS => {
			'STAR-22' => 76,
			'Critic' => 75
		}
	},
	{#State 69
		DEFAULT => -10
	},
	{#State 70
		ACTIONS => {
			'VARIABLE_SYMBOL' => -15,
			'OP22_LOGICAL_NEG' => -15,
			'CONSTANT_CALL_SCOPED' => -15,
			'OP01_PRINT' => -15,
			"for" => -15,
			"\@{" => -15,
			'OP05_LOGICAL_NEG' => -15,
			'OP10_NAMED_UNARY' => -15,
			"foreach" => -15,
			'LBRACE' => -15,
			'LITERAL_NUMBER' => -15,
			'OP05_MATH_NEG_LPAREN' => -15,
			"our" => -15,
			'OP01_NAMED' => -15,
			'OP01_CLOSE' => -15,
			'LITERAL_STRING' => -15,
			"%{" => -15,
			'OP19_LOOP_CONTROL' => -15,
			'OP01_OPEN' => -15,
			'OP05_BITWISE_NEG_LPAREN' => -15,
			'OP01_NAMED_SCOLON' => -15,
			'LPAREN' => -15,
			'WORD_SCOPED' => -15,
			'OP19_LOOP_CONTROL_SCOLON' => -15,
			"undef" => -15,
			"while" => -15,
			'OP01_NAMED_VOID_LPAREN' => -15,
			'OP01_NAMED_VOID' => -15,
			'LBRACKET' => -15,
			"if" => -15,
			'OP01_NAMED_VOID_SCOLON' => -15,
			'SELF' => -15,
			"use constant" => 41,
			'OP10_NAMED_UNARY_SCOLON' => -15,
			'WORD_UPPERCASE' => -15,
			'MY' => -15,
			'WORD' => -15,
			'OP03_MATH_INC_DEC' => -15
		},
		GOTOS => {
			'STAR-7' => 78,
			'Constant' => 77
		}
	},
	{#State 71
		ACTIONS => {
			'VERSION_NUMBER_ASSIGN' => 79
		}
	},
	{#State 72
		ACTIONS => {
			'LITERAL_STRING' => 81,
			'LITERAL_NUMBER' => 80
		},
		GOTOS => {
			'Literal' => 82
		}
	},
	{#State 73
		ACTIONS => {
			'WORD' => 53,
			'TYPE_INTEGER' => 54,
			'WORD_SCOPED' => 56
		},
		GOTOS => {
			'Type' => 83
		}
	},
	{#State 74
		ACTIONS => {
			'SELF' => -45,
			'OP01_NAMED_VOID_SCOLON' => -45,
			"if" => -45,
			'LBRACKET' => -45,
			'OP10_NAMED_UNARY_SCOLON' => -45,
			'WORD' => -45,
			'MY' => -45,
			'WORD_UPPERCASE' => -45,
			'OP03_MATH_INC_DEC' => -45,
			'LPAREN_MY' => 85,
			'OP01_NAMED_SCOLON' => -45,
			'OP19_LOOP_CONTROL_SCOLON' => -45,
			'LPAREN' => -45,
			'WORD_SCOPED' => -45,
			'OP01_NAMED_VOID_LPAREN' => -45,
			"undef" => -45,
			"while" => -45,
			'OP01_NAMED_VOID' => -45,
			'LITERAL_NUMBER' => -45,
			'OP05_MATH_NEG_LPAREN' => -45,
			'OP01_NAMED' => -45,
			"foreach" => -45,
			'OP10_NAMED_UNARY' => -45,
			'LBRACE' => -45,
			'OP01_CLOSE' => -45,
			"%{" => -45,
			'LITERAL_STRING' => -45,
			'OP05_BITWISE_NEG_LPAREN' => -45,
			'OP01_OPEN' => -45,
			'OP19_LOOP_CONTROL' => -45,
			'OP22_LOGICAL_NEG' => -45,
			'CONSTANT_CALL_SCOPED' => -45,
			'OP01_PRINT' => -45,
			'VARIABLE_SYMBOL' => -45,
			"for" => -45,
			"}" => -45,
			"\@{" => -45,
			'OP05_LOGICAL_NEG' => -45
		},
		GOTOS => {
			'SubroutineArguments' => 86,
			'OPTIONAL-17' => 84
		}
	},
	{#State 75
		DEFAULT => -53
	},
	{#State 76
		ACTIONS => {
			"our hashref \$properties" => -58,
			"use constant" => -58,
			'USE' => 34
		},
		GOTOS => {
			'Include' => 88,
			'STAR-23' => 87
		}
	},
	{#State 77
		DEFAULT => -12
	},
	{#State 78
		ACTIONS => {
			'OP05_LOGICAL_NEG' => 96,
			"\@{" => 97,
			"for" => -151,
			'VARIABLE_SYMBOL' => 89,
			'OP22_LOGICAL_NEG' => 92,
			'OP01_PRINT' => 91,
			'CONSTANT_CALL_SCOPED' => 90,
			'OP01_OPEN' => 110,
			'OP19_LOOP_CONTROL' => 111,
			'OP05_BITWISE_NEG_LPAREN' => 112,
			'LITERAL_STRING' => 81,
			"%{" => 116,
			'OP01_CLOSE' => 101,
			'LBRACE' => 103,
			'OP10_NAMED_UNARY' => 105,
			"foreach" => -151,
			'OP01_NAMED' => 108,
			'OP05_MATH_NEG_LPAREN' => 109,
			'LITERAL_NUMBER' => 80,
			"our" => 43,
			'OP01_NAMED_VOID' => 124,
			"while" => -151,
			"undef" => 127,
			'OP01_NAMED_VOID_LPAREN' => 128,
			'WORD_SCOPED' => 26,
			'LPAREN' => 119,
			'OP19_LOOP_CONTROL_SCOLON' => 121,
			'OP01_NAMED_SCOLON' => 123,
			'OP03_MATH_INC_DEC' => 136,
			'WORD_UPPERCASE' => 137,
			'MY' => 138,
			'WORD' => 28,
			'OP10_NAMED_UNARY_SCOLON' => 129,
			'OP01_NAMED_VOID_SCOLON' => 132,
			'LBRACKET' => 131,
			"if" => 133,
			'SELF' => 135
		},
		GOTOS => {
			'Operation' => 100,
			'PLUS-8' => 126,
			'Conditional' => 99,
			'PAREN-36' => 98,
			'VariableModification' => 125,
			'OperatorVoid' => 95,
			'HashReference' => 94,
			'HashDereference' => 93,
			'Variable' => 122,
			'LoopLabel' => 120,
			'VariableDeclaration' => 118,
			'SubExpression' => 117,
			'ArrayReference' => 115,
			'Statement' => 139,
			'Literal' => 113,
			'Expression' => 114,
			'Subroutine' => 106,
			'ArrayDereference' => 107,
			'OPTIONAL-37' => 104,
			'Operator' => 134,
			'VariableSymbolOrSelf' => 102,
			'WordScoped' => 130
		}
	},
	{#State 79
		DEFAULT => -37
	},
	{#State 80
		DEFAULT => -234
	},
	{#State 81
		DEFAULT => -235
	},
	{#State 82
		ACTIONS => {
			";" => 140
		}
	},
	{#State 83
		ACTIONS => {
			"\$TYPED_" => 141
		}
	},
	{#State 84
		DEFAULT => -47,
		GOTOS => {
			'STAR-18' => 142
		}
	},
	{#State 85
		ACTIONS => {
			'WORD' => 53,
			'TYPE_INTEGER' => 54,
			'WORD_SCOPED' => 56
		},
		GOTOS => {
			'Type' => 143
		}
	},
	{#State 86
		DEFAULT => -44
	},
	{#State 87
		ACTIONS => {
			"use constant" => 41,
			"our hashref \$properties" => 146
		},
		GOTOS => {
			'Constant' => 144,
			'Properties' => 145
		}
	},
	{#State 88
		DEFAULT => -55
	},
	{#State 89
		DEFAULT => -232
	},
	{#State 90
		DEFAULT => -131
	},
	{#State 91
		ACTIONS => {
			'OP05_BITWISE_NEG_LPAREN' => -114,
			'OP01_QW' => -114,
			'OP03_MATH_INC_DEC' => -114,
			'OP01_OPEN' => -114,
			'WORD' => -114,
			"%{" => -114,
			'MY' => -114,
			'WORD_UPPERCASE' => -114,
			'LITERAL_STRING' => -114,
			'OP01_CLOSE' => -114,
			'STDOUT_STDERR' => 148,
			'OP01_NAMED' => -114,
			'OP05_MATH_NEG_LPAREN' => -114,
			'SELF' => -114,
			'LITERAL_NUMBER' => -114,
			'LBRACKET' => -114,
			'LBRACE' => -114,
			'OP10_NAMED_UNARY' => -114,
			'OP05_LOGICAL_NEG' => -114,
			'FHREF_SYMBOL_BRACES' => 147,
			"\@{" => -114,
			'ARGV' => -114,
			"undef" => -114,
			'OP22_LOGICAL_NEG' => -114,
			'CONSTANT_CALL_SCOPED' => -114,
			'WORD_SCOPED' => -114,
			'VARIABLE_SYMBOL' => -114,
			'LPAREN' => -114
		},
		GOTOS => {
			'OPTIONAL-32' => 149,
			'PAREN-31' => 150
		}
	},
	{#State 92
		ACTIONS => {
			"undef" => 127,
			'OP05_LOGICAL_NEG' => 96,
			"\@{" => 97,
			'OP22_LOGICAL_NEG' => 92,
			'CONSTANT_CALL_SCOPED' => 90,
			'WORD_SCOPED' => 26,
			'VARIABLE_SYMBOL' => 89,
			'LPAREN' => 119,
			'WORD' => 28,
			"%{" => 116,
			'WORD_UPPERCASE' => 153,
			'LITERAL_STRING' => 81,
			'OP05_BITWISE_NEG_LPAREN' => 112,
			'OP03_MATH_INC_DEC' => 136,
			'OP01_OPEN' => 110,
			'OP01_NAMED' => 152,
			'SELF' => 135,
			'OP05_MATH_NEG_LPAREN' => 109,
			'LITERAL_NUMBER' => 80,
			'LBRACE' => 103,
			'LBRACKET' => 131,
			'OP10_NAMED_UNARY' => 105,
			'OP01_CLOSE' => 101
		},
		GOTOS => {
			'HashDereference' => 93,
			'HashReference' => 94,
			'ArrayDereference' => 107,
			'Variable' => 155,
			'Operator' => 134,
			'VariableSymbolOrSelf' => 102,
			'WordScoped' => 130,
			'SubExpression' => 154,
			'ArrayReference' => 115,
			'Literal' => 113,
			'Expression' => 151
		}
	},
	{#State 93
		DEFAULT => -142
	},
	{#State 94
		DEFAULT => -141
	},
	{#State 95
		DEFAULT => -154
	},
	{#State 96
		ACTIONS => {
			'OP05_BITWISE_NEG_LPAREN' => 112,
			'OP03_MATH_INC_DEC' => 136,
			'OP01_OPEN' => 110,
			'WORD' => 28,
			"%{" => 116,
			'WORD_UPPERCASE' => 153,
			'LITERAL_STRING' => 81,
			'OP01_CLOSE' => 101,
			'OP01_NAMED' => 152,
			'LITERAL_NUMBER' => 80,
			'OP05_MATH_NEG_LPAREN' => 109,
			'SELF' => 135,
			'LBRACKET' => 131,
			'LBRACE' => 103,
			'OP10_NAMED_UNARY' => 105,
			'OP05_LOGICAL_NEG' => 96,
			"\@{" => 97,
			"undef" => 127,
			'CONSTANT_CALL_SCOPED' => 90,
			'OP22_LOGICAL_NEG' => 92,
			'WORD_SCOPED' => 26,
			'LPAREN' => 119,
			'VARIABLE_SYMBOL' => 89
		},
		GOTOS => {
			'SubExpression' => 156,
			'WordScoped' => 130,
			'VariableSymbolOrSelf' => 102,
			'Operator' => 134,
			'Variable' => 155,
			'ArrayDereference' => 107,
			'HashReference' => 94,
			'HashDereference' => 93,
			'Literal' => 113,
			'Expression' => 151,
			'ArrayReference' => 115
		}
	},
	{#State 97
		ACTIONS => {
			'VARIABLE_SYMBOL' => 89,
			'MY' => 159,
			'LBRACKET' => -199,
			'SELF' => 135
		},
		GOTOS => {
			'Variable' => 157,
			'OPTIONAL-47' => 160,
			'VariableSymbolOrSelf' => 102,
			'TypeInner' => 158
		}
	},
	{#State 98
		DEFAULT => -150
	},
	{#State 99
		DEFAULT => -152
	},
	{#State 100
		DEFAULT => -17
	},
	{#State 101
		ACTIONS => {
			'FHREF_SYMBOL' => 161
		}
	},
	{#State 102
		DEFAULT => -176,
		GOTOS => {
			'STAR-43' => 162
		}
	},
	{#State 103
		ACTIONS => {
			'OP12_COMPARE_EQ_NE' => 184,
			'OP11_COMPARE_LT_GT' => 185,
			'OP01_CLOSE' => 174,
			'OP08_MATH_ADD_SUB' => 172,
			'OP10_NAMED_UNARY' => 171,
			'OP01_NAMED' => 173,
			'SELF' => 135,
			'LITERAL_NUMBER' => 80,
			'OP19_LOOP_CONTROL' => 177,
			'OP24_LOGICAL_OR_XOR' => 178,
			'OP01_OPEN' => 176,
			'LITERAL_STRING' => 81,
			'WORD' => 187,
			"%{" => 116,
			'OP23_LOGICAL_AND' => 175,
			'OP07_STRING_REPEAT' => 186,
			'ENV' => 181,
			'OP07_MATH_MULT_DIV_MOD' => 165,
			'VARIABLE_SYMBOL' => 89,
			'OP19_LOOP_CONTROL_SCOLON' => 182,
			'OP22_LOGICAL_NEG' => 166,
			'OP01_PRINT' => 167,
			'OP01_NAMED_VOID' => 183,
			"}" => 168
		},
		GOTOS => {
			'HashDereference' => 164,
			'HashEntry' => 163,
			'Variable' => 180,
			'OpStringOrWord' => 170,
			'Literal' => 179,
			'VariableSymbolOrSelf' => 102,
			'VarOrLitOrOpStrOrWord' => 169
		}
	},
	{#State 104
		ACTIONS => {
			"for" => 194,
			"while" => 190,
			"foreach" => 192
		},
		GOTOS => {
			'LoopForEach' => 191,
			'LoopFor' => 193,
			'LoopWhile' => 189,
			'Loop' => 188
		}
	},
	{#State 105
		ACTIONS => {
			'OP14_BITWISE_OR_XOR' => -100,
			'OP22_LOGICAL_NEG' => 92,
			'CONSTANT_CALL_SCOPED' => 90,
			'OP09_BITWISE_SHIFT' => -100,
			'OP07_MATH_MULT_DIV_MOD' => -100,
			'VARIABLE_SYMBOL' => 89,
			"}" => -100,
			"\@{" => 97,
			'OP05_LOGICAL_NEG' => 96,
			";" => -100,
			'OP05_MATH_NEG_LPAREN' => 109,
			'LITERAL_NUMBER' => 80,
			'OP13_BITWISE_AND' => -100,
			")" => -100,
			'OP01_NAMED' => 152,
			'OP17_LIST_RANGE' => -100,
			'OP08_MATH_ADD_SUB' => -100,
			'OP10_NAMED_UNARY' => 105,
			'OP15_LOGICAL_AND' => -100,
			'LBRACE' => 103,
			'OP01_CLOSE' => 101,
			'OP23_LOGICAL_AND' => -100,
			"%{" => 116,
			'LITERAL_STRING' => 81,
			'OP05_BITWISE_NEG_LPAREN' => 112,
			'OP24_LOGICAL_OR_XOR' => -100,
			'OP01_OPEN' => 110,
			'OP04_MATH_POW' => -100,
			'LPAREN' => 119,
			'WORD_SCOPED' => 26,
			"undef" => 127,
			'OP06_REGEX_MATCH' => -100,
			'OP21_LIST_COMMA' => -100,
			'OP18_TERNARY' => -100,
			'SELF' => 135,
			'LBRACKET' => 131,
			'OP12_COMPARE_EQ_NE' => -100,
			'OP11_COMPARE_LT_GT' => -100,
			'OP07_STRING_REPEAT' => -100,
			'WORD' => 28,
			"]" => -100,
			'WORD_UPPERCASE' => 153,
			'OP03_MATH_INC_DEC' => 136,
			'OP16_LOGICAL_OR' => -100,
			'OP08_STRING_CAT' => -100
		},
		GOTOS => {
			'Literal' => 113,
			'Expression' => 151,
			'ArrayReference' => 115,
			'VariableSymbolOrSelf' => 102,
			'WordScoped' => 130,
			'SubExpression' => 195,
			'HashReference' => 94,
			'HashDereference' => 93,
			'ArrayDereference' => 107,
			'Operator' => 134,
			'Variable' => 155
		}
	},
	{#State 106
		DEFAULT => -14
	},
	{#State 107
		DEFAULT => -140
	},
	{#State 108
		ACTIONS => {
			'OP01_CLOSE' => 101,
			'LBRACE' => 103,
			'LBRACKET' => 131,
			'OP10_NAMED_UNARY' => 105,
			'OP01_NAMED' => 152,
			'OP05_MATH_NEG_LPAREN' => 109,
			'LITERAL_NUMBER' => 80,
			'SELF' => 135,
			'OP01_OPEN' => 110,
			'OP05_BITWISE_NEG_LPAREN' => 112,
			'OP01_QW' => 200,
			'OP03_MATH_INC_DEC' => 136,
			'WORD_UPPERCASE' => 153,
			'MY' => 159,
			'LITERAL_STRING' => 81,
			"%{" => 116,
			'WORD' => 28,
			'WORD_SCOPED' => 26,
			'VARIABLE_SYMBOL' => 89,
			'LPAREN' => 119,
			'OP22_LOGICAL_NEG' => 92,
			'CONSTANT_CALL_SCOPED' => 90,
			'OP05_LOGICAL_NEG' => 96,
			"\@{" => 97,
			"undef" => 127,
			'ARGV' => 197
		},
		GOTOS => {
			'Literal' => 113,
			'Expression' => 151,
			'TypeInner' => 198,
			'ListElement' => 199,
			'ArrayReference' => 115,
			'WordScoped' => 130,
			'VariableSymbolOrSelf' => 102,
			'SubExpression' => 196,
			'HashDereference' => 93,
			'HashReference' => 94,
			'ArrayDereference' => 107,
			'Operator' => 134,
			'Variable' => 155
		}
	},
	{#State 109
		ACTIONS => {
			'LBRACE' => 103,
			'LBRACKET' => 131,
			'OP10_NAMED_UNARY' => 105,
			'OP01_NAMED' => 152,
			'LITERAL_NUMBER' => 80,
			'SELF' => 135,
			'OP05_MATH_NEG_LPAREN' => 109,
			'OP01_CLOSE' => 101,
			'WORD_UPPERCASE' => 153,
			'LITERAL_STRING' => 81,
			'WORD' => 28,
			"%{" => 116,
			'OP01_OPEN' => 110,
			'OP05_BITWISE_NEG_LPAREN' => 112,
			'OP03_MATH_INC_DEC' => 136,
			'WORD_SCOPED' => 26,
			'LPAREN' => 119,
			'VARIABLE_SYMBOL' => 89,
			'CONSTANT_CALL_SCOPED' => 90,
			'OP22_LOGICAL_NEG' => 92,
			"undef" => 127,
			'OP05_LOGICAL_NEG' => 96,
			"\@{" => 97
		},
		GOTOS => {
			'ArrayDereference' => 107,
			'HashDereference' => 93,
			'HashReference' => 94,
			'Variable' => 155,
			'Operator' => 134,
			'VariableSymbolOrSelf' => 102,
			'WordScoped' => 130,
			'SubExpression' => 201,
			'ArrayReference' => 115,
			'Literal' => 113,
			'Expression' => 151
		}
	},
	{#State 110
		ACTIONS => {
			'MY' => 202
		}
	},
	{#State 111
		ACTIONS => {
			'WORD_UPPERCASE' => 203
		},
		GOTOS => {
			'LoopLabel' => 204
		}
	},
	{#State 112
		ACTIONS => {
			'OP05_LOGICAL_NEG' => 96,
			"\@{" => 97,
			"undef" => 127,
			'OP22_LOGICAL_NEG' => 92,
			'CONSTANT_CALL_SCOPED' => 90,
			'WORD_SCOPED' => 26,
			'LPAREN' => 119,
			'VARIABLE_SYMBOL' => 89,
			'OP05_BITWISE_NEG_LPAREN' => 112,
			'OP03_MATH_INC_DEC' => 136,
			'OP01_OPEN' => 110,
			'WORD' => 28,
			"%{" => 116,
			'WORD_UPPERCASE' => 153,
			'LITERAL_STRING' => 81,
			'OP01_CLOSE' => 101,
			'OP01_NAMED' => 152,
			'OP05_MATH_NEG_LPAREN' => 109,
			'LITERAL_NUMBER' => 80,
			'SELF' => 135,
			'LBRACKET' => 131,
			'LBRACE' => 103,
			'OP10_NAMED_UNARY' => 105
		},
		GOTOS => {
			'ArrayReference' => 115,
			'Expression' => 151,
			'Literal' => 113,
			'Variable' => 155,
			'Operator' => 134,
			'HashReference' => 94,
			'HashDereference' => 93,
			'ArrayDereference' => 107,
			'SubExpression' => 205,
			'VariableSymbolOrSelf' => 102,
			'WordScoped' => 130
		}
	},
	{#State 113
		DEFAULT => -137
	},
	{#State 114
		ACTIONS => {
			'OP14_BITWISE_OR_XOR' => -135,
			'OP07_MATH_MULT_DIV_MOD' => -135,
			'OP09_BITWISE_SHIFT' => -135,
			'OP06_REGEX_MATCH' => -135,
			'OP18_TERNARY' => -135,
			";" => 206,
			'OP13_BITWISE_AND' => -135,
			'OP17_LIST_RANGE' => -135,
			'OP08_MATH_ADD_SUB' => -135,
			'OP15_LOGICAL_AND' => -135,
			'OP11_COMPARE_LT_GT' => -135,
			'OP12_COMPARE_EQ_NE' => -135,
			'OP07_STRING_REPEAT' => -135,
			'OP23_LOGICAL_AND' => -135,
			'OP24_LOGICAL_OR_XOR' => -135,
			'OP16_LOGICAL_OR' => -135,
			'OP04_MATH_POW' => -135,
			'OP08_STRING_CAT' => -135
		}
	},
	{#State 115
		DEFAULT => -139
	},
	{#State 116
		ACTIONS => {
			'MY' => 159,
			'LBRACE' => -214,
			'SELF' => 135,
			'VARIABLE_SYMBOL' => 89
		},
		GOTOS => {
			'TypeInner' => 207,
			'VariableSymbolOrSelf' => 102,
			'Variable' => 208,
			'OPTIONAL-51' => 209
		}
	},
	{#State 117
		ACTIONS => {
			'OP14_BITWISE_OR_XOR' => 212,
			'OP07_MATH_MULT_DIV_MOD' => 210,
			'OP09_BITWISE_SHIFT' => 211,
			'OP18_TERNARY' => 220,
			'OP06_REGEX_MATCH' => 221,
			'OP15_LOGICAL_AND' => 218,
			'OP08_MATH_ADD_SUB' => 219,
			'OP17_LIST_RANGE' => 216,
			'OP13_BITWISE_AND' => 217,
			'OP11_COMPARE_LT_GT' => 226,
			'OP12_COMPARE_EQ_NE' => 225,
			'OP23_LOGICAL_AND' => 215,
			'OP07_STRING_REPEAT' => 224,
			'OP08_STRING_CAT' => 222,
			'OP16_LOGICAL_OR' => 223,
			'OP04_MATH_POW' => 213,
			'OP24_LOGICAL_OR_XOR' => 214
		}
	},
	{#State 118
		DEFAULT => -155
	},
	{#State 119
		ACTIONS => {
			'LITERAL_STRING' => 81,
			'WORD_UPPERCASE' => 153,
			"%{" => 116,
			'WORD' => 28,
			'OP01_OPEN' => 110,
			'OP03_MATH_INC_DEC' => 136,
			'OP05_BITWISE_NEG_LPAREN' => 112,
			'OP10_NAMED_UNARY' => 105,
			'LBRACE' => 103,
			'LBRACKET' => 131,
			'OP05_MATH_NEG_LPAREN' => 109,
			'LITERAL_NUMBER' => 80,
			'SELF' => 135,
			'OP01_NAMED' => 229,
			'OP01_CLOSE' => 101,
			"undef" => 127,
			"\@{" => 97,
			'OP05_LOGICAL_NEG' => 96,
			'VARIABLE_SYMBOL' => 89,
			'LPAREN' => 119,
			'WORD_SCOPED' => 26,
			'OP01_PRINT' => 228,
			'OP22_LOGICAL_NEG' => 92,
			'CONSTANT_CALL_SCOPED' => 90
		},
		GOTOS => {
			'Expression' => 151,
			'Literal' => 113,
			'ArrayReference' => 115,
			'SubExpression' => 227,
			'VariableSymbolOrSelf' => 102,
			'WordScoped' => 130,
			'Operator' => 134,
			'Variable' => 155,
			'HashReference' => 94,
			'HashDereference' => 93,
			'ArrayDereference' => 107
		}
	},
	{#State 120
		ACTIONS => {
			'COLON' => 230
		}
	},
	{#State 121
		DEFAULT => -123
	},
	{#State 122
		ACTIONS => {
			'OP23_LOGICAL_AND' => -138,
			'OP07_STRING_REPEAT' => -138,
			'OP03_MATH_INC_DEC' => 233,
			'OP16_LOGICAL_OR' => -138,
			'OP08_STRING_CAT' => -138,
			'OP04_MATH_POW' => -138,
			'OP24_LOGICAL_OR_XOR' => -138,
			'OP13_BITWISE_AND' => -138,
			")" => -138,
			'OP17_LIST_RANGE' => -138,
			'OP19_VARIABLE_ASSIGN_BY' => 232,
			'OP15_LOGICAL_AND' => -138,
			'OP19_VARIABLE_ASSIGN' => 231,
			'OP08_MATH_ADD_SUB' => -138,
			'OP12_COMPARE_EQ_NE' => -138,
			'OP11_COMPARE_LT_GT' => -138,
			'OP02_METHOD_THINARROW' => 234,
			'OP18_TERNARY' => -138,
			'OP06_REGEX_MATCH' => -138,
			'OP14_BITWISE_OR_XOR' => -138,
			'OP07_MATH_MULT_DIV_MOD' => -138,
			'OP09_BITWISE_SHIFT' => -138
		}
	},
	{#State 123
		DEFAULT => -79
	},
	{#State 124
		ACTIONS => {
			'VARIABLE_SYMBOL' => 89,
			'LPAREN' => 119,
			'WORD_SCOPED' => 26,
			'CONSTANT_CALL_SCOPED' => 90,
			'OP22_LOGICAL_NEG' => 92,
			"undef" => 127,
			'ARGV' => 197,
			"\@{" => 97,
			'OP05_LOGICAL_NEG' => 96,
			'OP10_NAMED_UNARY' => 105,
			'LBRACE' => 103,
			'LBRACKET' => 131,
			'OP05_MATH_NEG_LPAREN' => 109,
			'LITERAL_NUMBER' => 80,
			'SELF' => 135,
			'OP01_NAMED' => 152,
			'OP01_CLOSE' => 101,
			'LITERAL_STRING' => 81,
			'MY' => 159,
			'WORD_UPPERCASE' => 153,
			"%{" => 116,
			'WORD' => 28,
			'OP01_OPEN' => 110,
			'OP03_MATH_INC_DEC' => 136,
			'OP01_QW' => 200,
			'OP05_BITWISE_NEG_LPAREN' => 112
		},
		GOTOS => {
			'ArrayReference' => 115,
			'ListElements' => 235,
			'ListElement' => 237,
			'TypeInner' => 198,
			'Expression' => 151,
			'Literal' => 113,
			'Variable' => 155,
			'Operator' => 134,
			'ArrayDereference' => 107,
			'HashReference' => 94,
			'HashDereference' => 93,
			'SubExpression' => 236,
			'VariableSymbolOrSelf' => 102,
			'WordScoped' => 130
		}
	},
	{#State 125
		ACTIONS => {
			";" => 238
		}
	},
	{#State 126
		ACTIONS => {
			"for" => -151,
			"\@{" => 97,
			'OP05_LOGICAL_NEG' => 96,
			'OP01_PRINT' => 91,
			'CONSTANT_CALL_SCOPED' => 90,
			'OP22_LOGICAL_NEG' => 92,
			'VARIABLE_SYMBOL' => 89,
			"%{" => 116,
			'LITERAL_STRING' => 81,
			'OP05_BITWISE_NEG_LPAREN' => 112,
			'OP19_LOOP_CONTROL' => 111,
			'OP01_OPEN' => 110,
			'LITERAL_NUMBER' => 80,
			'OP05_MATH_NEG_LPAREN' => 109,
			'OP01_NAMED' => 108,
			"foreach" => -151,
			'OP10_NAMED_UNARY' => 105,
			'LBRACE' => 103,
			'OP01_CLOSE' => 101,
			'OP01_NAMED_VOID_LPAREN' => 128,
			"while" => -151,
			"undef" => 127,
			'OP01_NAMED_VOID' => 124,
			'OP01_NAMED_SCOLON' => 123,
			'OP19_LOOP_CONTROL_SCOLON' => 121,
			'LPAREN' => 119,
			'WORD_SCOPED' => 26,
			'' => -18,
			'WORD' => 28,
			'WORD_UPPERCASE' => 137,
			'MY' => 138,
			'OP03_MATH_INC_DEC' => 136,
			'SELF' => 135,
			"if" => 133,
			'LBRACKET' => 131,
			'OP01_NAMED_VOID_SCOLON' => 132,
			'OP10_NAMED_UNARY_SCOLON' => 129
		},
		GOTOS => {
			'Variable' => 122,
			'HashReference' => 94,
			'HashDereference' => 93,
			'VariableDeclaration' => 118,
			'SubExpression' => 117,
			'LoopLabel' => 120,
			'Conditional' => 99,
			'PAREN-36' => 98,
			'Operation' => 239,
			'OperatorVoid' => 95,
			'VariableModification' => 125,
			'Operator' => 134,
			'OPTIONAL-37' => 104,
			'ArrayDereference' => 107,
			'WordScoped' => 130,
			'VariableSymbolOrSelf' => 102,
			'Statement' => 139,
			'ArrayReference' => 115,
			'Expression' => 114,
			'Literal' => 113
		}
	},
	{#State 127
		DEFAULT => -136
	},
	{#State 128
		ACTIONS => {
			'CONSTANT_CALL_SCOPED' => 90,
			'OP22_LOGICAL_NEG' => 92,
			'WORD_SCOPED' => 26,
			'LPAREN' => 119,
			'VARIABLE_SYMBOL' => 89,
			'OP05_LOGICAL_NEG' => 96,
			"\@{" => 97,
			'ARGV' => 197,
			"undef" => 127,
			'OP01_CLOSE' => 101,
			")" => -116,
			'OP01_NAMED' => 152,
			'SELF' => 135,
			'LITERAL_NUMBER' => 80,
			'OP05_MATH_NEG_LPAREN' => 109,
			'LBRACKET' => 131,
			'LBRACE' => 103,
			'OP10_NAMED_UNARY' => 105,
			'OP05_BITWISE_NEG_LPAREN' => 112,
			'OP01_QW' => 200,
			'OP03_MATH_INC_DEC' => 136,
			'OP01_OPEN' => 110,
			"%{" => 116,
			'WORD' => 28,
			'WORD_UPPERCASE' => 153,
			'MY' => 159,
			'LITERAL_STRING' => 81
		},
		GOTOS => {
			'ArrayReference' => 115,
			'OPTIONAL-33' => 241,
			'ListElement' => 237,
			'ListElements' => 240,
			'Expression' => 151,
			'Literal' => 113,
			'TypeInner' => 198,
			'Operator' => 134,
			'Variable' => 155,
			'HashReference' => 94,
			'HashDereference' => 93,
			'ArrayDereference' => 107,
			'SubExpression' => 236,
			'VariableSymbolOrSelf' => 102,
			'WordScoped' => 130
		}
	},
	{#State 129
		DEFAULT => -80
	},
	{#State 130
		ACTIONS => {
			'LPAREN' => 243,
			'OP02_METHOD_THINARROW_NEW' => 242
		}
	},
	{#State 131
		ACTIONS => {
			'OP01_OPEN' => 110,
			'OP03_MATH_INC_DEC' => 136,
			'OP05_BITWISE_NEG_LPAREN' => 112,
			'OP01_QW' => 200,
			'LITERAL_STRING' => 81,
			"]" => -196,
			'MY' => 159,
			'WORD_UPPERCASE' => 153,
			'WORD' => 28,
			"%{" => 116,
			'OP01_CLOSE' => 101,
			'OP10_NAMED_UNARY' => 105,
			'LBRACKET' => 131,
			'LBRACE' => 103,
			'OP05_MATH_NEG_LPAREN' => 109,
			'LITERAL_NUMBER' => 80,
			'SELF' => 135,
			'OP01_NAMED' => 152,
			"\@{" => 97,
			'OP05_LOGICAL_NEG' => 96,
			"undef" => 127,
			'ARGV' => 197,
			'VARIABLE_SYMBOL' => 89,
			'LPAREN' => 119,
			'WORD_SCOPED' => 26,
			'OP22_LOGICAL_NEG' => 92,
			'CONSTANT_CALL_SCOPED' => 90
		},
		GOTOS => {
			'Variable' => 155,
			'Operator' => 134,
			'ArrayDereference' => 107,
			'HashReference' => 94,
			'HashDereference' => 93,
			'OPTIONAL-46' => 245,
			'SubExpression' => 236,
			'WordScoped' => 130,
			'VariableSymbolOrSelf' => 102,
			'ArrayReference' => 115,
			'ListElements' => 244,
			'ListElement' => 237,
			'TypeInner' => 198,
			'Expression' => 151,
			'Literal' => 113
		}
	},
	{#State 132
		DEFAULT => -119
	},
	{#State 133
		ACTIONS => {
			'LPAREN' => 246
		}
	},
	{#State 134
		DEFAULT => -129
	},
	{#State 135
		DEFAULT => -233
	},
	{#State 136
		ACTIONS => {
			'VARIABLE_SYMBOL' => 89,
			'SELF' => 135
		},
		GOTOS => {
			'Variable' => 247,
			'VariableSymbolOrSelf' => 102
		}
	},
	{#State 137
		ACTIONS => {
			'LPAREN' => 248,
			'COLON' => -219
		}
	},
	{#State 138
		ACTIONS => {
			'TYPE_INTEGER' => 54,
			'WORD_SCOPED' => 56,
			'WORD' => 53,
			'TYPE_FHREF' => 250
		},
		GOTOS => {
			'Type' => 249
		}
	},
	{#State 139
		DEFAULT => -81
	},
	{#State 140
		DEFAULT => -43
	},
	{#State 141
		ACTIONS => {
			'WORD_UPPERCASE' => 251
		}
	},
	{#State 142
		ACTIONS => {
			"\@{" => 97,
			'OP05_LOGICAL_NEG' => 96,
			"for" => -151,
			"}" => 253,
			'VARIABLE_SYMBOL' => 89,
			'CONSTANT_CALL_SCOPED' => 90,
			'OP01_PRINT' => 91,
			'OP22_LOGICAL_NEG' => 92,
			'OP19_LOOP_CONTROL' => 111,
			'OP01_OPEN' => 110,
			'OP05_BITWISE_NEG_LPAREN' => 112,
			'LITERAL_STRING' => 81,
			"%{" => 116,
			'OP01_CLOSE' => 101,
			'OP10_NAMED_UNARY' => 105,
			"foreach" => -151,
			'LBRACE' => 103,
			'OP05_MATH_NEG_LPAREN' => 109,
			'LITERAL_NUMBER' => 80,
			'OP01_NAMED' => 108,
			'OP01_NAMED_VOID' => 124,
			"while" => -151,
			"undef" => 127,
			'OP01_NAMED_VOID_LPAREN' => 128,
			'LPAREN' => 119,
			'WORD_SCOPED' => 26,
			'OP19_LOOP_CONTROL_SCOLON' => 121,
			'OP01_NAMED_SCOLON' => 123,
			'OP03_MATH_INC_DEC' => 136,
			'WORD_UPPERCASE' => 137,
			'MY' => 138,
			'WORD' => 28,
			'OP10_NAMED_UNARY_SCOLON' => 129,
			'LBRACKET' => 131,
			"if" => 133,
			'OP01_NAMED_VOID_SCOLON' => 132,
			'SELF' => 135
		},
		GOTOS => {
			'OperatorVoid' => 95,
			'VariableModification' => 125,
			'Conditional' => 99,
			'PAREN-36' => 98,
			'Operation' => 252,
			'VariableDeclaration' => 118,
			'SubExpression' => 117,
			'LoopLabel' => 120,
			'Variable' => 122,
			'HashDereference' => 93,
			'HashReference' => 94,
			'Literal' => 113,
			'Expression' => 114,
			'Statement' => 139,
			'ArrayReference' => 115,
			'WordScoped' => 130,
			'VariableSymbolOrSelf' => 102,
			'Operator' => 134,
			'OPTIONAL-37' => 104,
			'ArrayDereference' => 107
		}
	},
	{#State 143
		ACTIONS => {
			'VARIABLE_SYMBOL' => 254
		}
	},
	{#State 144
		DEFAULT => -57
	},
	{#State 145
		DEFAULT => -60,
		GOTOS => {
			'STAR-24' => 255
		}
	},
	{#State 146
		ACTIONS => {
			'OP19_VARIABLE_ASSIGN' => 256
		}
	},
	{#State 147
		ACTIONS => {
			'LITERAL_STRING' => 81,
			'MY' => 159,
			'WORD_UPPERCASE' => 153,
			"%{" => 116,
			'WORD' => 28,
			'OP01_OPEN' => 110,
			'OP03_MATH_INC_DEC' => 136,
			'OP05_BITWISE_NEG_LPAREN' => 112,
			'OP01_QW' => 200,
			'OP10_NAMED_UNARY' => 105,
			'LBRACE' => 103,
			'LBRACKET' => 131,
			'OP05_MATH_NEG_LPAREN' => 109,
			'LITERAL_NUMBER' => 80,
			'SELF' => 135,
			'OP01_NAMED' => 152,
			'OP01_CLOSE' => 101,
			"undef" => 127,
			'ARGV' => 197,
			"\@{" => 97,
			'OP05_LOGICAL_NEG' => 96,
			'VARIABLE_SYMBOL' => 89,
			'LPAREN' => 119,
			'WORD_SCOPED' => 26,
			'CONSTANT_CALL_SCOPED' => 90,
			'OP22_LOGICAL_NEG' => 92
		},
		GOTOS => {
			'VariableSymbolOrSelf' => 102,
			'WordScoped' => 130,
			'SubExpression' => 236,
			'ArrayDereference' => 107,
			'HashDereference' => 93,
			'HashReference' => 94,
			'Operator' => 134,
			'Variable' => 155,
			'TypeInner' => 198,
			'Expression' => 151,
			'Literal' => 113,
			'ListElements' => 257,
			'ListElement' => 237,
			'ArrayReference' => 115
		}
	},
	{#State 148
		DEFAULT => -112
	},
	{#State 149
		ACTIONS => {
			'OP05_LOGICAL_NEG' => 96,
			"\@{" => 97,
			'ARGV' => 197,
			"undef" => 127,
			'OP22_LOGICAL_NEG' => 92,
			'CONSTANT_CALL_SCOPED' => 90,
			'WORD_SCOPED' => 26,
			'LPAREN' => 119,
			'VARIABLE_SYMBOL' => 89,
			'OP05_BITWISE_NEG_LPAREN' => 112,
			'OP01_QW' => 200,
			'OP03_MATH_INC_DEC' => 136,
			'OP01_OPEN' => 110,
			'WORD' => 28,
			"%{" => 116,
			'WORD_UPPERCASE' => 153,
			'MY' => 159,
			'LITERAL_STRING' => 81,
			'OP01_CLOSE' => 101,
			'OP01_NAMED' => 152,
			'LITERAL_NUMBER' => 80,
			'SELF' => 135,
			'OP05_MATH_NEG_LPAREN' => 109,
			'LBRACKET' => 131,
			'LBRACE' => 103,
			'OP10_NAMED_UNARY' => 105
		},
		GOTOS => {
			'ArrayReference' => 115,
			'TypeInner' => 198,
			'Literal' => 113,
			'Expression' => 151,
			'ListElements' => 258,
			'ListElement' => 237,
			'ArrayDereference' => 107,
			'HashDereference' => 93,
			'HashReference' => 94,
			'Operator' => 134,
			'Variable' => 155,
			'VariableSymbolOrSelf' => 102,
			'WordScoped' => 130,
			'SubExpression' => 236
		}
	},
	{#State 150
		DEFAULT => -113
	},
	{#State 151
		DEFAULT => -135
	},
	{#State 152
		ACTIONS => {
			'OP01_NAMED' => 152,
			'LITERAL_NUMBER' => 80,
			'SELF' => 135,
			'OP05_MATH_NEG_LPAREN' => 109,
			'LBRACE' => 103,
			'LBRACKET' => 131,
			'OP10_NAMED_UNARY' => 105,
			'OP01_CLOSE' => 101,
			"%{" => 116,
			'WORD' => 28,
			'WORD_UPPERCASE' => 153,
			'LITERAL_STRING' => 81,
			'OP05_BITWISE_NEG_LPAREN' => 112,
			'OP03_MATH_INC_DEC' => 136,
			'OP01_OPEN' => 110,
			'OP22_LOGICAL_NEG' => 92,
			'CONSTANT_CALL_SCOPED' => 90,
			'WORD_SCOPED' => 26,
			'LPAREN' => 119,
			'VARIABLE_SYMBOL' => 89,
			"undef" => 127,
			'OP05_LOGICAL_NEG' => 96,
			"\@{" => 97
		},
		GOTOS => {
			'Operator' => 134,
			'Variable' => 155,
			'ArrayDereference' => 107,
			'HashReference' => 94,
			'HashDereference' => 93,
			'SubExpression' => 259,
			'WordScoped' => 130,
			'VariableSymbolOrSelf' => 102,
			'ArrayReference' => 115,
			'Literal' => 113,
			'Expression' => 151
		}
	},
	{#State 153
		ACTIONS => {
			'LPAREN' => 248
		}
	},
	{#State 154
		ACTIONS => {
			'OP14_BITWISE_OR_XOR' => 212,
			'OP07_MATH_MULT_DIV_MOD' => 210,
			'OP09_BITWISE_SHIFT' => 211,
			"}" => -109,
			'OP18_TERNARY' => 220,
			'OP21_LIST_COMMA' => -109,
			'OP06_REGEX_MATCH' => 221,
			'OP15_LOGICAL_AND' => 218,
			'OP08_MATH_ADD_SUB' => 219,
			'OP13_BITWISE_AND' => 217,
			")" => -109,
			'OP17_LIST_RANGE' => 216,
			";" => -109,
			'OP12_COMPARE_EQ_NE' => 225,
			'OP11_COMPARE_LT_GT' => 226,
			"]" => -109,
			'OP23_LOGICAL_AND' => -109,
			'OP07_STRING_REPEAT' => 224,
			'OP08_STRING_CAT' => 222,
			'OP04_MATH_POW' => 213,
			'OP16_LOGICAL_OR' => 223,
			'OP24_LOGICAL_OR_XOR' => -109
		}
	},
	{#State 155
		ACTIONS => {
			";" => -138,
			'OP17_LIST_RANGE' => -138,
			'OP13_BITWISE_AND' => -138,
			")" => -138,
			'OP08_MATH_ADD_SUB' => -138,
			'OP15_LOGICAL_AND' => -138,
			'OP11_COMPARE_LT_GT' => -138,
			'OP12_COMPARE_EQ_NE' => -138,
			'OP07_STRING_REPEAT' => -138,
			'OP23_LOGICAL_AND' => -138,
			"]" => -138,
			'OP03_MATH_INC_DEC' => 233,
			'OP24_LOGICAL_OR_XOR' => -138,
			'OP16_LOGICAL_OR' => -138,
			'OP08_STRING_CAT' => -138,
			'OP04_MATH_POW' => -138,
			'OP14_BITWISE_OR_XOR' => -138,
			'OP07_MATH_MULT_DIV_MOD' => -138,
			'OP09_BITWISE_SHIFT' => -138,
			"}" => -138,
			'OP02_METHOD_THINARROW' => 234,
			'OP06_REGEX_MATCH' => -138,
			'OP21_LIST_COMMA' => -138,
			'OP18_TERNARY' => -138
		}
	},
	{#State 156
		ACTIONS => {
			";" => -91,
			'OP13_BITWISE_AND' => -91,
			")" => -91,
			'OP17_LIST_RANGE' => -91,
			'OP08_MATH_ADD_SUB' => -91,
			'OP15_LOGICAL_AND' => -91,
			'OP11_COMPARE_LT_GT' => -91,
			'OP12_COMPARE_EQ_NE' => -91,
			'OP07_STRING_REPEAT' => -91,
			'OP23_LOGICAL_AND' => -91,
			"]" => -91,
			'OP24_LOGICAL_OR_XOR' => -91,
			'OP04_MATH_POW' => 213,
			'OP08_STRING_CAT' => -91,
			'OP16_LOGICAL_OR' => -91,
			'OP14_BITWISE_OR_XOR' => -91,
			'OP07_MATH_MULT_DIV_MOD' => -91,
			'OP09_BITWISE_SHIFT' => -91,
			"}" => -91,
			'OP06_REGEX_MATCH' => -91,
			'OP21_LIST_COMMA' => -91,
			'OP18_TERNARY' => -91
		}
	},
	{#State 157
		ACTIONS => {
			"}" => 260
		}
	},
	{#State 158
		DEFAULT => -198
	},
	{#State 159
		ACTIONS => {
			'WORD' => 53,
			'TYPE_INTEGER' => 54,
			'WORD_SCOPED' => 56
		},
		GOTOS => {
			'Type' => 261
		}
	},
	{#State 160
		ACTIONS => {
			'LBRACKET' => 131
		},
		GOTOS => {
			'ArrayReference' => 262
		}
	},
	{#State 161
		DEFAULT => -86
	},
	{#State 162
		ACTIONS => {
			'OP09_BITWISE_SHIFT' => -177,
			'OP07_MATH_MULT_DIV_MOD' => -177,
			'OP14_BITWISE_OR_XOR' => -177,
			'OP20_HASH_FATARROW' => -177,
			'OP02_METHOD_THINARROW' => -177,
			'OP21_LIST_COMMA' => -177,
			'OP18_TERNARY' => -177,
			'OP06_REGEX_MATCH' => -177,
			"}" => -177,
			'OP02_HASH_THINARROW' => 265,
			'OP12_COMPARE_EQ_NE' => -177,
			'OP11_COMPARE_LT_GT' => -177,
			'OP13_BITWISE_AND' => -177,
			'OP17_LIST_RANGE' => -177,
			")" => -177,
			";" => -177,
			'COLON' => -177,
			'OP19_VARIABLE_ASSIGN_BY' => -177,
			'OP15_LOGICAL_AND' => -177,
			'OP19_VARIABLE_ASSIGN' => -177,
			'OP08_MATH_ADD_SUB' => -177,
			'OP03_MATH_INC_DEC' => -177,
			'OP16_LOGICAL_OR' => -177,
			'OP04_MATH_POW' => -177,
			'OP08_STRING_CAT' => -177,
			'OP02_ARRAY_THINARROW' => 264,
			'OP24_LOGICAL_OR_XOR' => -177,
			'OP23_LOGICAL_AND' => -177,
			'OP07_STRING_REPEAT' => -177,
			"]" => -177
		},
		GOTOS => {
			'VariableRetrieval' => 263
		}
	},
	{#State 163
		DEFAULT => -210,
		GOTOS => {
			'STAR-50' => 266
		}
	},
	{#State 164
		DEFAULT => -205
	},
	{#State 165
		DEFAULT => -251
	},
	{#State 166
		DEFAULT => -244
	},
	{#State 167
		DEFAULT => -257
	},
	{#State 168
		DEFAULT => -212
	},
	{#State 169
		ACTIONS => {
			'OP20_HASH_FATARROW' => 267
		}
	},
	{#State 170
		DEFAULT => -231
	},
	{#State 171
		DEFAULT => -249
	},
	{#State 172
		DEFAULT => -250
	},
	{#State 173
		DEFAULT => -253
	},
	{#State 174
		DEFAULT => -254
	},
	{#State 175
		DEFAULT => -243
	},
	{#State 176
		DEFAULT => -255
	},
	{#State 177
		DEFAULT => -246
	},
	{#State 178
		DEFAULT => -242
	},
	{#State 179
		DEFAULT => -230
	},
	{#State 180
		DEFAULT => -229
	},
	{#State 181
		DEFAULT => -206
	},
	{#State 182
		DEFAULT => -245
	},
	{#State 183
		DEFAULT => -256
	},
	{#State 184
		DEFAULT => -247
	},
	{#State 185
		DEFAULT => -248
	},
	{#State 186
		DEFAULT => -252
	},
	{#State 187
		DEFAULT => -258
	},
	{#State 188
		DEFAULT => -153
	},
	{#State 189
		DEFAULT => -166
	},
	{#State 190
		ACTIONS => {
			'LPAREN_MY' => 269,
			'LPAREN' => 268
		}
	},
	{#State 191
		DEFAULT => -165
	},
	{#State 192
		ACTIONS => {
			'MY' => 270
		}
	},
	{#State 193
		DEFAULT => -164
	},
	{#State 194
		ACTIONS => {
			'LPAREN_MY' => 271,
			'MY' => 272
		}
	},
	{#State 195
		ACTIONS => {
			'OP11_COMPARE_LT_GT' => -99,
			'OP12_COMPARE_EQ_NE' => -99,
			'OP15_LOGICAL_AND' => -99,
			'OP08_MATH_ADD_SUB' => 219,
			")" => -99,
			'OP13_BITWISE_AND' => -99,
			'OP17_LIST_RANGE' => -99,
			";" => -99,
			'OP04_MATH_POW' => 213,
			'OP08_STRING_CAT' => 222,
			'OP16_LOGICAL_OR' => -99,
			'OP24_LOGICAL_OR_XOR' => -99,
			"]" => -99,
			'OP23_LOGICAL_AND' => -99,
			'OP07_STRING_REPEAT' => 224,
			'OP09_BITWISE_SHIFT' => 211,
			'OP07_MATH_MULT_DIV_MOD' => 210,
			'OP14_BITWISE_OR_XOR' => -99,
			'OP21_LIST_COMMA' => -99,
			'OP18_TERNARY' => -99,
			'OP06_REGEX_MATCH' => 221,
			"}" => -99
		}
	},
	{#State 196
		ACTIONS => {
			'OP12_COMPARE_EQ_NE' => -83,
			'OP11_COMPARE_LT_GT' => -83,
			";" => -83,
			'OP17_LIST_RANGE' => -83,
			")" => -83,
			'OP13_BITWISE_AND' => -83,
			'OP08_MATH_ADD_SUB' => -83,
			'OP15_LOGICAL_AND' => -83,
			'OP24_LOGICAL_OR_XOR' => -83,
			'OP16_LOGICAL_OR' => -83,
			'OP08_STRING_CAT' => -83,
			'OP04_MATH_POW' => -83,
			'OP07_STRING_REPEAT' => -83,
			'OP23_LOGICAL_AND' => -83,
			'OP09_BITWISE_SHIFT' => -83,
			'OP07_MATH_MULT_DIV_MOD' => -83,
			'OP14_BITWISE_OR_XOR' => -83,
			'OP06_REGEX_MATCH' => -83,
			'OP18_TERNARY' => -83,
			'OP21_LIST_COMMA' => -191
		}
	},
	{#State 197
		DEFAULT => -194
	},
	{#State 198
		ACTIONS => {
			'VARIABLE_SYMBOL' => 89,
			'LPAREN' => 119,
			'WORD_SCOPED' => 26,
			'CONSTANT_CALL_SCOPED' => 90,
			'OP22_LOGICAL_NEG' => 92,
			"undef" => 127,
			"\@{" => 97,
			'OP05_LOGICAL_NEG' => 96,
			'OP10_NAMED_UNARY' => 105,
			'LBRACKET' => 131,
			'LBRACE' => 103,
			'SELF' => 135,
			'OP05_MATH_NEG_LPAREN' => 109,
			'LITERAL_NUMBER' => 80,
			'OP01_NAMED' => 152,
			'OP01_CLOSE' => 101,
			'LITERAL_STRING' => 81,
			'WORD_UPPERCASE' => 153,
			'WORD' => 28,
			"%{" => 116,
			'OP01_OPEN' => 110,
			'OP03_MATH_INC_DEC' => 136,
			'OP05_BITWISE_NEG_LPAREN' => 112
		},
		GOTOS => {
			'Literal' => 113,
			'Expression' => 151,
			'ArrayReference' => 115,
			'SubExpression' => 273,
			'VariableSymbolOrSelf' => 102,
			'WordScoped' => 130,
			'Operator' => 134,
			'Variable' => 155,
			'HashDereference' => 93,
			'HashReference' => 94,
			'ArrayDereference' => 107
		}
	},
	{#State 199
		ACTIONS => {
			'OP21_LIST_COMMA' => 274
		}
	},
	{#State 200
		DEFAULT => -193
	},
	{#State 201
		ACTIONS => {
			'OP14_BITWISE_OR_XOR' => 212,
			'OP07_MATH_MULT_DIV_MOD' => 210,
			'OP09_BITWISE_SHIFT' => 211,
			'OP18_TERNARY' => 220,
			'OP06_REGEX_MATCH' => 221,
			'OP13_BITWISE_AND' => 217,
			")" => 275,
			'OP17_LIST_RANGE' => 216,
			'OP15_LOGICAL_AND' => 218,
			'OP08_MATH_ADD_SUB' => 219,
			'OP12_COMPARE_EQ_NE' => 225,
			'OP11_COMPARE_LT_GT' => 226,
			'OP23_LOGICAL_AND' => 215,
			'OP07_STRING_REPEAT' => 224,
			'OP04_MATH_POW' => 213,
			'OP16_LOGICAL_OR' => 223,
			'OP08_STRING_CAT' => 222,
			'OP24_LOGICAL_OR_XOR' => 214
		}
	},
	{#State 202
		ACTIONS => {
			'TYPE_FHREF' => 276
		}
	},
	{#State 203
		DEFAULT => -219
	},
	{#State 204
		ACTIONS => {
			";" => 277
		}
	},
	{#State 205
		ACTIONS => {
			'OP18_TERNARY' => 220,
			'OP06_REGEX_MATCH' => 221,
			'OP14_BITWISE_OR_XOR' => 212,
			'OP07_MATH_MULT_DIV_MOD' => 210,
			'OP09_BITWISE_SHIFT' => 211,
			'OP23_LOGICAL_AND' => 215,
			'OP07_STRING_REPEAT' => 224,
			'OP04_MATH_POW' => 213,
			'OP16_LOGICAL_OR' => 223,
			'OP08_STRING_CAT' => 222,
			'OP24_LOGICAL_OR_XOR' => 214,
			")" => 278,
			'OP13_BITWISE_AND' => 217,
			'OP17_LIST_RANGE' => 216,
			'OP15_LOGICAL_AND' => 218,
			'OP08_MATH_ADD_SUB' => 219,
			'OP11_COMPARE_LT_GT' => 226,
			'OP12_COMPARE_EQ_NE' => 225
		}
	},
	{#State 206
		DEFAULT => -78
	},
	{#State 207
		DEFAULT => -213
	},
	{#State 208
		ACTIONS => {
			"}" => 279
		}
	},
	{#State 209
		ACTIONS => {
			'LBRACE' => 103
		},
		GOTOS => {
			'HashReference' => 280
		}
	},
	{#State 210
		ACTIONS => {
			"undef" => 127,
			'OP05_LOGICAL_NEG' => 96,
			"\@{" => 97,
			'WORD_SCOPED' => 26,
			'LPAREN' => 119,
			'VARIABLE_SYMBOL' => 89,
			'OP22_LOGICAL_NEG' => 92,
			'CONSTANT_CALL_SCOPED' => 90,
			'WORD_UPPERCASE' => 153,
			'LITERAL_STRING' => 81,
			'WORD' => 28,
			"%{" => 116,
			'OP01_OPEN' => 110,
			'OP05_BITWISE_NEG_LPAREN' => 112,
			'OP03_MATH_INC_DEC' => 136,
			'LBRACKET' => 131,
			'LBRACE' => 103,
			'OP10_NAMED_UNARY' => 105,
			'OP01_NAMED' => 152,
			'LITERAL_NUMBER' => 80,
			'OP05_MATH_NEG_LPAREN' => 109,
			'SELF' => 135,
			'OP01_CLOSE' => 101
		},
		GOTOS => {
			'VariableSymbolOrSelf' => 102,
			'WordScoped' => 130,
			'SubExpression' => 281,
			'ArrayDereference' => 107,
			'HashDereference' => 93,
			'HashReference' => 94,
			'Operator' => 134,
			'Variable' => 155,
			'Literal' => 113,
			'Expression' => 151,
			'ArrayReference' => 115
		}
	},
	{#State 211
		ACTIONS => {
			"\@{" => 97,
			'OP05_LOGICAL_NEG' => 96,
			"undef" => 127,
			'LPAREN' => 119,
			'VARIABLE_SYMBOL' => 89,
			'WORD_SCOPED' => 26,
			'OP22_LOGICAL_NEG' => 92,
			'CONSTANT_CALL_SCOPED' => 90,
			'OP01_OPEN' => 110,
			'OP03_MATH_INC_DEC' => 136,
			'OP05_BITWISE_NEG_LPAREN' => 112,
			'LITERAL_STRING' => 81,
			'WORD_UPPERCASE' => 153,
			"%{" => 116,
			'WORD' => 28,
			'OP01_CLOSE' => 101,
			'OP10_NAMED_UNARY' => 105,
			'LBRACKET' => 131,
			'LBRACE' => 103,
			'LITERAL_NUMBER' => 80,
			'OP05_MATH_NEG_LPAREN' => 109,
			'SELF' => 135,
			'OP01_NAMED' => 152
		},
		GOTOS => {
			'HashDereference' => 93,
			'HashReference' => 94,
			'ArrayDereference' => 107,
			'Operator' => 134,
			'Variable' => 155,
			'WordScoped' => 130,
			'VariableSymbolOrSelf' => 102,
			'SubExpression' => 282,
			'ArrayReference' => 115,
			'Literal' => 113,
			'Expression' => 151
		}
	},
	{#State 212
		ACTIONS => {
			'OP01_CLOSE' => 101,
			'LBRACE' => 103,
			'LBRACKET' => 131,
			'OP10_NAMED_UNARY' => 105,
			'OP01_NAMED' => 152,
			'OP05_MATH_NEG_LPAREN' => 109,
			'LITERAL_NUMBER' => 80,
			'SELF' => 135,
			'OP01_OPEN' => 110,
			'OP05_BITWISE_NEG_LPAREN' => 112,
			'OP03_MATH_INC_DEC' => 136,
			'WORD_UPPERCASE' => 153,
			'LITERAL_STRING' => 81,
			"%{" => 116,
			'WORD' => 28,
			'WORD_SCOPED' => 26,
			'LPAREN' => 119,
			'VARIABLE_SYMBOL' => 89,
			'CONSTANT_CALL_SCOPED' => 90,
			'OP22_LOGICAL_NEG' => 92,
			'OP05_LOGICAL_NEG' => 96,
			"\@{" => 97,
			"undef" => 127
		},
		GOTOS => {
			'Expression' => 151,
			'Literal' => 113,
			'ArrayReference' => 115,
			'SubExpression' => 283,
			'VariableSymbolOrSelf' => 102,
			'WordScoped' => 130,
			'Variable' => 155,
			'Operator' => 134,
			'ArrayDereference' => 107,
			'HashDereference' => 93,
			'HashReference' => 94
		}
	},
	{#State 213
		ACTIONS => {
			'LITERAL_NUMBER' => 80,
			'SELF' => 135,
			'OP05_MATH_NEG_LPAREN' => 109,
			'OP01_NAMED' => 152,
			'OP10_NAMED_UNARY' => 105,
			'LBRACKET' => 131,
			'LBRACE' => 103,
			'OP01_CLOSE' => 101,
			'WORD' => 28,
			"%{" => 116,
			'LITERAL_STRING' => 81,
			'WORD_UPPERCASE' => 153,
			'OP03_MATH_INC_DEC' => 136,
			'OP05_BITWISE_NEG_LPAREN' => 112,
			'OP01_OPEN' => 110,
			'CONSTANT_CALL_SCOPED' => 90,
			'OP22_LOGICAL_NEG' => 92,
			'VARIABLE_SYMBOL' => 89,
			'LPAREN' => 119,
			'WORD_SCOPED' => 26,
			"undef" => 127,
			"\@{" => 97,
			'OP05_LOGICAL_NEG' => 96
		},
		GOTOS => {
			'Literal' => 113,
			'Expression' => 151,
			'ArrayReference' => 115,
			'SubExpression' => 284,
			'WordScoped' => 130,
			'VariableSymbolOrSelf' => 102,
			'Operator' => 134,
			'Variable' => 155,
			'HashReference' => 94,
			'HashDereference' => 93,
			'ArrayDereference' => 107
		}
	},
	{#State 214
		ACTIONS => {
			'OP01_CLOSE' => 101,
			'OP10_NAMED_UNARY' => 105,
			'LBRACE' => 103,
			'LBRACKET' => 131,
			'SELF' => 135,
			'LITERAL_NUMBER' => 80,
			'OP05_MATH_NEG_LPAREN' => 109,
			'OP01_NAMED' => 152,
			'OP01_OPEN' => 110,
			'OP03_MATH_INC_DEC' => 136,
			'OP05_BITWISE_NEG_LPAREN' => 112,
			'LITERAL_STRING' => 81,
			'WORD_UPPERCASE' => 153,
			"%{" => 116,
			'WORD' => 28,
			'LPAREN' => 119,
			'VARIABLE_SYMBOL' => 89,
			'WORD_SCOPED' => 26,
			'CONSTANT_CALL_SCOPED' => 90,
			'OP22_LOGICAL_NEG' => 92,
			"\@{" => 97,
			'OP05_LOGICAL_NEG' => 96,
			"undef" => 127
		},
		GOTOS => {
			'ArrayReference' => 115,
			'Expression' => 151,
			'Literal' => 113,
			'HashDereference' => 93,
			'HashReference' => 94,
			'ArrayDereference' => 107,
			'Operator' => 134,
			'Variable' => 155,
			'VariableSymbolOrSelf' => 102,
			'WordScoped' => 130,
			'SubExpression' => 285
		}
	},
	{#State 215
		ACTIONS => {
			'OP22_LOGICAL_NEG' => 92,
			'CONSTANT_CALL_SCOPED' => 90,
			'LPAREN' => 119,
			'VARIABLE_SYMBOL' => 89,
			'WORD_SCOPED' => 26,
			"undef" => 127,
			"\@{" => 97,
			'OP05_LOGICAL_NEG' => 96,
			'OP05_MATH_NEG_LPAREN' => 109,
			'SELF' => 135,
			'LITERAL_NUMBER' => 80,
			'OP01_NAMED' => 152,
			'OP10_NAMED_UNARY' => 105,
			'LBRACKET' => 131,
			'LBRACE' => 103,
			'OP01_CLOSE' => 101,
			'WORD' => 28,
			"%{" => 116,
			'LITERAL_STRING' => 81,
			'WORD_UPPERCASE' => 153,
			'OP03_MATH_INC_DEC' => 136,
			'OP05_BITWISE_NEG_LPAREN' => 112,
			'OP01_OPEN' => 110
		},
		GOTOS => {
			'SubExpression' => 286,
			'WordScoped' => 130,
			'VariableSymbolOrSelf' => 102,
			'Variable' => 155,
			'Operator' => 134,
			'HashReference' => 94,
			'HashDereference' => 93,
			'ArrayDereference' => 107,
			'Expression' => 151,
			'Literal' => 113,
			'ArrayReference' => 115
		}
	},
	{#State 216
		ACTIONS => {
			'WORD_UPPERCASE' => 153,
			'LITERAL_STRING' => 81,
			'WORD' => 28,
			"%{" => 116,
			'OP01_OPEN' => 110,
			'OP05_BITWISE_NEG_LPAREN' => 112,
			'OP03_MATH_INC_DEC' => 136,
			'LBRACE' => 103,
			'LBRACKET' => 131,
			'OP10_NAMED_UNARY' => 105,
			'OP01_NAMED' => 152,
			'SELF' => 135,
			'LITERAL_NUMBER' => 80,
			'OP05_MATH_NEG_LPAREN' => 109,
			'OP01_CLOSE' => 101,
			"undef" => 127,
			'OP05_LOGICAL_NEG' => 96,
			"\@{" => 97,
			'WORD_SCOPED' => 26,
			'LPAREN' => 119,
			'VARIABLE_SYMBOL' => 89,
			'OP22_LOGICAL_NEG' => 92,
			'CONSTANT_CALL_SCOPED' => 90
		},
		GOTOS => {
			'HashReference' => 94,
			'HashDereference' => 93,
			'ArrayDereference' => 107,
			'Variable' => 155,
			'Operator' => 134,
			'WordScoped' => 130,
			'VariableSymbolOrSelf' => 102,
			'SubExpression' => 287,
			'ArrayReference' => 115,
			'Literal' => 113,
			'Expression' => 151
		}
	},
	{#State 217
		ACTIONS => {
			"undef" => 127,
			"\@{" => 97,
			'OP05_LOGICAL_NEG' => 96,
			'VARIABLE_SYMBOL' => 89,
			'LPAREN' => 119,
			'WORD_SCOPED' => 26,
			'OP22_LOGICAL_NEG' => 92,
			'CONSTANT_CALL_SCOPED' => 90,
			'LITERAL_STRING' => 81,
			'WORD_UPPERCASE' => 153,
			"%{" => 116,
			'WORD' => 28,
			'OP01_OPEN' => 110,
			'OP03_MATH_INC_DEC' => 136,
			'OP05_BITWISE_NEG_LPAREN' => 112,
			'OP10_NAMED_UNARY' => 105,
			'LBRACKET' => 131,
			'LBRACE' => 103,
			'OP05_MATH_NEG_LPAREN' => 109,
			'LITERAL_NUMBER' => 80,
			'SELF' => 135,
			'OP01_NAMED' => 152,
			'OP01_CLOSE' => 101
		},
		GOTOS => {
			'ArrayReference' => 115,
			'Literal' => 113,
			'Expression' => 151,
			'ArrayDereference' => 107,
			'HashDereference' => 93,
			'HashReference' => 94,
			'Operator' => 134,
			'Variable' => 155,
			'WordScoped' => 130,
			'VariableSymbolOrSelf' => 102,
			'SubExpression' => 288
		}
	},
	{#State 218
		ACTIONS => {
			'LITERAL_STRING' => 81,
			'WORD_UPPERCASE' => 153,
			'WORD' => 28,
			"%{" => 116,
			'OP01_OPEN' => 110,
			'OP03_MATH_INC_DEC' => 136,
			'OP05_BITWISE_NEG_LPAREN' => 112,
			'OP10_NAMED_UNARY' => 105,
			'LBRACKET' => 131,
			'LBRACE' => 103,
			'LITERAL_NUMBER' => 80,
			'OP05_MATH_NEG_LPAREN' => 109,
			'SELF' => 135,
			'OP01_NAMED' => 152,
			'OP01_CLOSE' => 101,
			"undef" => 127,
			"\@{" => 97,
			'OP05_LOGICAL_NEG' => 96,
			'LPAREN' => 119,
			'VARIABLE_SYMBOL' => 89,
			'WORD_SCOPED' => 26,
			'OP22_LOGICAL_NEG' => 92,
			'CONSTANT_CALL_SCOPED' => 90
		},
		GOTOS => {
			'Operator' => 134,
			'Variable' => 155,
			'ArrayDereference' => 107,
			'HashDereference' => 93,
			'HashReference' => 94,
			'SubExpression' => 289,
			'VariableSymbolOrSelf' => 102,
			'WordScoped' => 130,
			'ArrayReference' => 115,
			'Literal' => 113,
			'Expression' => 151
		}
	},
	{#State 219
		ACTIONS => {
			'OP01_CLOSE' => 101,
			'LBRACE' => 103,
			'LBRACKET' => 131,
			'OP10_NAMED_UNARY' => 105,
			'OP01_NAMED' => 152,
			'OP05_MATH_NEG_LPAREN' => 109,
			'LITERAL_NUMBER' => 80,
			'SELF' => 135,
			'OP01_OPEN' => 110,
			'OP05_BITWISE_NEG_LPAREN' => 112,
			'OP03_MATH_INC_DEC' => 136,
			'WORD_UPPERCASE' => 153,
			'LITERAL_STRING' => 81,
			'WORD' => 28,
			"%{" => 116,
			'WORD_SCOPED' => 26,
			'VARIABLE_SYMBOL' => 89,
			'LPAREN' => 119,
			'CONSTANT_CALL_SCOPED' => 90,
			'OP22_LOGICAL_NEG' => 92,
			'OP05_LOGICAL_NEG' => 96,
			"\@{" => 97,
			"undef" => 127
		},
		GOTOS => {
			'HashReference' => 94,
			'HashDereference' => 93,
			'ArrayDereference' => 107,
			'Variable' => 155,
			'Operator' => 134,
			'VariableSymbolOrSelf' => 102,
			'WordScoped' => 130,
			'SubExpression' => 290,
			'ArrayReference' => 115,
			'Literal' => 113,
			'Expression' => 151
		}
	},
	{#State 220
		ACTIONS => {
			'VARIABLE_SYMBOL' => 89,
			'LITERAL_STRING' => 81,
			'SELF' => 135,
			'LITERAL_NUMBER' => 80
		},
		GOTOS => {
			'Variable' => 293,
			'VariableOrLiteral' => 292,
			'VariableSymbolOrSelf' => 102,
			'Literal' => 291
		}
	},
	{#State 221
		ACTIONS => {
			'OP06_REGEX_PATTERN' => 294
		}
	},
	{#State 222
		ACTIONS => {
			'WORD_SCOPED' => 26,
			'VARIABLE_SYMBOL' => 89,
			'LPAREN' => 119,
			'CONSTANT_CALL_SCOPED' => 90,
			'OP22_LOGICAL_NEG' => 92,
			'OP05_LOGICAL_NEG' => 96,
			"\@{" => 97,
			"undef" => 127,
			'OP01_CLOSE' => 101,
			'LBRACE' => 103,
			'LBRACKET' => 131,
			'OP10_NAMED_UNARY' => 105,
			'OP01_NAMED' => 152,
			'OP05_MATH_NEG_LPAREN' => 109,
			'LITERAL_NUMBER' => 80,
			'SELF' => 135,
			'OP01_OPEN' => 110,
			'OP05_BITWISE_NEG_LPAREN' => 112,
			'OP03_MATH_INC_DEC' => 136,
			'WORD_UPPERCASE' => 153,
			'LITERAL_STRING' => 81,
			"%{" => 116,
			'WORD' => 28
		},
		GOTOS => {
			'WordScoped' => 130,
			'VariableSymbolOrSelf' => 102,
			'SubExpression' => 295,
			'ArrayDereference' => 107,
			'HashReference' => 94,
			'HashDereference' => 93,
			'Operator' => 134,
			'Variable' => 155,
			'Literal' => 113,
			'Expression' => 151,
			'ArrayReference' => 115
		}
	},
	{#State 223
		ACTIONS => {
			'OP01_CLOSE' => 101,
			'LBRACE' => 103,
			'LBRACKET' => 131,
			'OP10_NAMED_UNARY' => 105,
			'OP01_NAMED' => 152,
			'LITERAL_NUMBER' => 80,
			'SELF' => 135,
			'OP05_MATH_NEG_LPAREN' => 109,
			'OP01_OPEN' => 110,
			'OP05_BITWISE_NEG_LPAREN' => 112,
			'OP03_MATH_INC_DEC' => 136,
			'WORD_UPPERCASE' => 153,
			'LITERAL_STRING' => 81,
			"%{" => 116,
			'WORD' => 28,
			'WORD_SCOPED' => 26,
			'VARIABLE_SYMBOL' => 89,
			'LPAREN' => 119,
			'CONSTANT_CALL_SCOPED' => 90,
			'OP22_LOGICAL_NEG' => 92,
			'OP05_LOGICAL_NEG' => 96,
			"\@{" => 97,
			"undef" => 127
		},
		GOTOS => {
			'Operator' => 134,
			'Variable' => 155,
			'ArrayDereference' => 107,
			'HashReference' => 94,
			'HashDereference' => 93,
			'SubExpression' => 296,
			'VariableSymbolOrSelf' => 102,
			'WordScoped' => 130,
			'ArrayReference' => 115,
			'Literal' => 113,
			'Expression' => 151
		}
	},
	{#State 224
		ACTIONS => {
			'SELF' => 135,
			'OP05_MATH_NEG_LPAREN' => 109,
			'LITERAL_NUMBER' => 80,
			'OP01_NAMED' => 152,
			'OP10_NAMED_UNARY' => 105,
			'LBRACKET' => 131,
			'LBRACE' => 103,
			'OP01_CLOSE' => 101,
			'WORD' => 28,
			"%{" => 116,
			'LITERAL_STRING' => 81,
			'WORD_UPPERCASE' => 153,
			'OP03_MATH_INC_DEC' => 136,
			'OP05_BITWISE_NEG_LPAREN' => 112,
			'OP01_OPEN' => 110,
			'CONSTANT_CALL_SCOPED' => 90,
			'OP22_LOGICAL_NEG' => 92,
			'LPAREN' => 119,
			'VARIABLE_SYMBOL' => 89,
			'WORD_SCOPED' => 26,
			"undef" => 127,
			"\@{" => 97,
			'OP05_LOGICAL_NEG' => 96
		},
		GOTOS => {
			'Literal' => 113,
			'Expression' => 151,
			'ArrayReference' => 115,
			'VariableSymbolOrSelf' => 102,
			'WordScoped' => 130,
			'SubExpression' => 297,
			'HashDereference' => 93,
			'HashReference' => 94,
			'ArrayDereference' => 107,
			'Variable' => 155,
			'Operator' => 134
		}
	},
	{#State 225
		ACTIONS => {
			'OP01_CLOSE' => 101,
			'OP10_NAMED_UNARY' => 105,
			'LBRACKET' => 131,
			'LBRACE' => 103,
			'LITERAL_NUMBER' => 80,
			'OP05_MATH_NEG_LPAREN' => 109,
			'SELF' => 135,
			'OP01_NAMED' => 152,
			'OP01_OPEN' => 110,
			'OP03_MATH_INC_DEC' => 136,
			'OP05_BITWISE_NEG_LPAREN' => 112,
			'LITERAL_STRING' => 81,
			'WORD_UPPERCASE' => 153,
			"%{" => 116,
			'WORD' => 28,
			'LPAREN' => 119,
			'VARIABLE_SYMBOL' => 89,
			'WORD_SCOPED' => 26,
			'CONSTANT_CALL_SCOPED' => 90,
			'OP22_LOGICAL_NEG' => 92,
			"\@{" => 97,
			'OP05_LOGICAL_NEG' => 96,
			"undef" => 127
		},
		GOTOS => {
			'VariableSymbolOrSelf' => 102,
			'WordScoped' => 130,
			'SubExpression' => 298,
			'HashReference' => 94,
			'HashDereference' => 93,
			'ArrayDereference' => 107,
			'Variable' => 155,
			'Operator' => 134,
			'Expression' => 151,
			'Literal' => 113,
			'ArrayReference' => 115
		}
	},
	{#State 226
		ACTIONS => {
			"undef" => 127,
			"\@{" => 97,
			'OP05_LOGICAL_NEG' => 96,
			'LPAREN' => 119,
			'VARIABLE_SYMBOL' => 89,
			'WORD_SCOPED' => 26,
			'OP22_LOGICAL_NEG' => 92,
			'CONSTANT_CALL_SCOPED' => 90,
			'LITERAL_STRING' => 81,
			'WORD_UPPERCASE' => 153,
			"%{" => 116,
			'WORD' => 28,
			'OP01_OPEN' => 110,
			'OP03_MATH_INC_DEC' => 136,
			'OP05_BITWISE_NEG_LPAREN' => 112,
			'OP10_NAMED_UNARY' => 105,
			'LBRACE' => 103,
			'LBRACKET' => 131,
			'OP05_MATH_NEG_LPAREN' => 109,
			'LITERAL_NUMBER' => 80,
			'SELF' => 135,
			'OP01_NAMED' => 152,
			'OP01_CLOSE' => 101
		},
		GOTOS => {
			'SubExpression' => 299,
			'WordScoped' => 130,
			'VariableSymbolOrSelf' => 102,
			'Operator' => 134,
			'Variable' => 155,
			'ArrayDereference' => 107,
			'HashDereference' => 93,
			'HashReference' => 94,
			'Expression' => 151,
			'Literal' => 113,
			'ArrayReference' => 115
		}
	},
	{#State 227
		ACTIONS => {
			'OP08_MATH_ADD_SUB' => 219,
			'OP15_LOGICAL_AND' => 218,
			'OP17_LIST_RANGE' => 216,
			'OP13_BITWISE_AND' => 217,
			")" => 300,
			'OP12_COMPARE_EQ_NE' => 225,
			'OP11_COMPARE_LT_GT' => 226,
			'OP07_STRING_REPEAT' => 224,
			'OP23_LOGICAL_AND' => 215,
			'OP24_LOGICAL_OR_XOR' => 214,
			'OP16_LOGICAL_OR' => 223,
			'OP04_MATH_POW' => 213,
			'OP08_STRING_CAT' => 222,
			'OP14_BITWISE_OR_XOR' => 212,
			'OP07_MATH_MULT_DIV_MOD' => 210,
			'OP09_BITWISE_SHIFT' => 211,
			'OP06_REGEX_MATCH' => 221,
			'OP18_TERNARY' => 220
		}
	},
	{#State 228
		ACTIONS => {
			'FHREF_SYMBOL_BRACES' => 301
		}
	},
	{#State 229
		ACTIONS => {
			'LBRACE' => 103,
			'LBRACKET' => 131,
			'OP10_NAMED_UNARY' => 105,
			'OP01_NAMED' => 152,
			'OP05_MATH_NEG_LPAREN' => 109,
			'LITERAL_NUMBER' => 80,
			'SELF' => 135,
			'OP01_CLOSE' => 101,
			'MY' => 159,
			'WORD_UPPERCASE' => 153,
			'LITERAL_STRING' => 81,
			"%{" => 116,
			'WORD' => 28,
			'OP01_OPEN' => 110,
			'OP05_BITWISE_NEG_LPAREN' => 112,
			'OP01_QW' => 200,
			'OP03_MATH_INC_DEC' => 136,
			'WORD_SCOPED' => 26,
			'LPAREN' => 119,
			'VARIABLE_SYMBOL' => 89,
			'OP22_LOGICAL_NEG' => 92,
			'CONSTANT_CALL_SCOPED' => 90,
			"undef" => 127,
			'ARGV' => 197,
			'OP05_LOGICAL_NEG' => 96,
			"\@{" => 97
		},
		GOTOS => {
			'SubExpression' => 196,
			'WordScoped' => 130,
			'VariableSymbolOrSelf' => 102,
			'Variable' => 155,
			'Operator' => 134,
			'HashDereference' => 93,
			'HashReference' => 94,
			'ArrayDereference' => 107,
			'ListElement' => 302,
			'Expression' => 151,
			'Literal' => 113,
			'TypeInner' => 198,
			'ArrayReference' => 115
		}
	},
	{#State 230
		DEFAULT => -149
	},
	{#State 231
		ACTIONS => {
			'OP22_LOGICAL_NEG' => 92,
			'CONSTANT_CALL_SCOPED' => 90,
			'WORD_SCOPED' => 26,
			'VARIABLE_SYMBOL' => 89,
			'LPAREN' => 119,
			'STDIN' => 304,
			'OP05_LOGICAL_NEG' => 96,
			"\@{" => 97,
			"undef" => 127,
			'OP01_CLOSE' => 101,
			'OP01_NAMED' => 152,
			'SELF' => 135,
			'OP05_MATH_NEG_LPAREN' => 109,
			'LITERAL_NUMBER' => 80,
			'LBRACE' => 103,
			'LBRACKET' => 131,
			'FHREF_SYMBOL_IN' => 305,
			'OP10_NAMED_UNARY' => 105,
			'OP05_BITWISE_NEG_LPAREN' => 112,
			'OP03_MATH_INC_DEC' => 136,
			'OP01_OPEN' => 110,
			"%{" => 116,
			'WORD' => 28,
			'WORD_UPPERCASE' => 153,
			'LITERAL_STRING' => 81
		},
		GOTOS => {
			'ArrayReference' => 115,
			'Expression' => 151,
			'Literal' => 113,
			'Operator' => 134,
			'Variable' => 155,
			'ArrayDereference' => 107,
			'HashReference' => 94,
			'HashDereference' => 93,
			'SubExpression' => 306,
			'SubExpressionOrInput' => 303,
			'WordScoped' => 130,
			'VariableSymbolOrSelf' => 102
		}
	},
	{#State 232
		ACTIONS => {
			'SELF' => 135,
			'LITERAL_NUMBER' => 80,
			'OP05_MATH_NEG_LPAREN' => 109,
			'OP01_NAMED' => 152,
			'OP10_NAMED_UNARY' => 105,
			'LBRACKET' => 131,
			'LBRACE' => 103,
			'OP01_CLOSE' => 101,
			'WORD' => 28,
			"%{" => 116,
			'LITERAL_STRING' => 81,
			'WORD_UPPERCASE' => 153,
			'OP03_MATH_INC_DEC' => 136,
			'OP05_BITWISE_NEG_LPAREN' => 112,
			'OP01_OPEN' => 110,
			'CONSTANT_CALL_SCOPED' => 90,
			'OP22_LOGICAL_NEG' => 92,
			'LPAREN' => 119,
			'VARIABLE_SYMBOL' => 89,
			'WORD_SCOPED' => 26,
			"undef" => 127,
			"\@{" => 97,
			'OP05_LOGICAL_NEG' => 96
		},
		GOTOS => {
			'Literal' => 113,
			'Expression' => 151,
			'ArrayReference' => 115,
			'WordScoped' => 130,
			'VariableSymbolOrSelf' => 102,
			'SubExpression' => 307,
			'HashReference' => 94,
			'HashDereference' => 93,
			'ArrayDereference' => 107,
			'Operator' => 134,
			'Variable' => 155
		}
	},
	{#State 233
		DEFAULT => -88
	},
	{#State 234
		ACTIONS => {
			'LPAREN' => 308
		}
	},
	{#State 235
		ACTIONS => {
			";" => 309
		}
	},
	{#State 236
		ACTIONS => {
			'OP09_BITWISE_SHIFT' => 211,
			'OP07_MATH_MULT_DIV_MOD' => 210,
			'OP14_BITWISE_OR_XOR' => 212,
			'OP18_TERNARY' => 220,
			'OP21_LIST_COMMA' => -191,
			'OP06_REGEX_MATCH' => 221,
			'OP11_COMPARE_LT_GT' => 226,
			'OP12_COMPARE_EQ_NE' => 225,
			'OP15_LOGICAL_AND' => 218,
			'OP08_MATH_ADD_SUB' => 219,
			'OP17_LIST_RANGE' => 216,
			")" => -191,
			'OP13_BITWISE_AND' => 217,
			";" => -191,
			'OP16_LOGICAL_OR' => 223,
			'OP08_STRING_CAT' => 222,
			'OP04_MATH_POW' => 213,
			'OP24_LOGICAL_OR_XOR' => 214,
			"]" => -191,
			'OP23_LOGICAL_AND' => 215,
			'OP07_STRING_REPEAT' => 224
		}
	},
	{#State 237
		DEFAULT => -189,
		GOTOS => {
			'STAR-45' => 310
		}
	},
	{#State 238
		DEFAULT => -156
	},
	{#State 239
		DEFAULT => -16
	},
	{#State 240
		DEFAULT => -115
	},
	{#State 241
		ACTIONS => {
			")" => 311
		}
	},
	{#State 242
		ACTIONS => {
			")" => 312
		}
	},
	{#State 243
		ACTIONS => {
			"\@{" => 97,
			'OP05_LOGICAL_NEG' => 96,
			"undef" => 127,
			'ARGV' => 197,
			'LPAREN' => 119,
			'VARIABLE_SYMBOL' => 89,
			'WORD_SCOPED' => 26,
			'OP22_LOGICAL_NEG' => 92,
			'CONSTANT_CALL_SCOPED' => 90,
			'OP01_OPEN' => 110,
			'OP03_MATH_INC_DEC' => 136,
			'OP05_BITWISE_NEG_LPAREN' => 112,
			'OP01_QW' => 200,
			'LITERAL_STRING' => 81,
			'MY' => 159,
			'WORD_UPPERCASE' => 153,
			"%{" => 116,
			'WORD' => 28,
			'OP01_CLOSE' => 101,
			'OP10_NAMED_UNARY' => 105,
			'LBRACKET' => 131,
			'LBRACE' => 103,
			'LITERAL_NUMBER' => 80,
			'SELF' => 135,
			'OP05_MATH_NEG_LPAREN' => 109,
			'OP01_NAMED' => 152,
			")" => -126
		},
		GOTOS => {
			'HashDereference' => 93,
			'HashReference' => 94,
			'ArrayDereference' => 107,
			'Operator' => 134,
			'Variable' => 155,
			'VariableSymbolOrSelf' => 102,
			'WordScoped' => 130,
			'SubExpression' => 236,
			'OPTIONAL-34' => 314,
			'ArrayReference' => 115,
			'Literal' => 113,
			'Expression' => 151,
			'TypeInner' => 198,
			'ListElement' => 237,
			'ListElements' => 313
		}
	},
	{#State 244
		DEFAULT => -195
	},
	{#State 245
		ACTIONS => {
			"]" => 315
		}
	},
	{#State 246
		ACTIONS => {
			'VARIABLE_SYMBOL' => 89,
			'LPAREN' => 119,
			'WORD_SCOPED' => 26,
			'OP22_LOGICAL_NEG' => 92,
			'CONSTANT_CALL_SCOPED' => 90,
			"undef" => 127,
			"\@{" => 97,
			'OP05_LOGICAL_NEG' => 96,
			'OP10_NAMED_UNARY' => 105,
			'LBRACKET' => 131,
			'LBRACE' => 103,
			'OP05_MATH_NEG_LPAREN' => 109,
			'LITERAL_NUMBER' => 80,
			'SELF' => 135,
			'OP01_NAMED' => 152,
			'OP01_CLOSE' => 101,
			'LITERAL_STRING' => 81,
			'WORD_UPPERCASE' => 153,
			'WORD' => 28,
			"%{" => 116,
			'OP01_OPEN' => 110,
			'OP03_MATH_INC_DEC' => 136,
			'OP05_BITWISE_NEG_LPAREN' => 112
		},
		GOTOS => {
			'SubExpression' => 316,
			'VariableSymbolOrSelf' => 102,
			'WordScoped' => 130,
			'Variable' => 155,
			'Operator' => 134,
			'ArrayDereference' => 107,
			'HashDereference' => 93,
			'HashReference' => 94,
			'Expression' => 151,
			'Literal' => 113,
			'ArrayReference' => 115
		}
	},
	{#State 247
		DEFAULT => -87
	},
	{#State 248
		ACTIONS => {
			")" => 317
		}
	},
	{#State 249
		ACTIONS => {
			'VARIABLE_SYMBOL' => 318
		}
	},
	{#State 250
		ACTIONS => {
			'FHREF_SYMBOL' => 319
		}
	},
	{#State 251
		ACTIONS => {
			'OP19_VARIABLE_ASSIGN' => 320
		}
	},
	{#State 252
		DEFAULT => -46
	},
	{#State 253
		ACTIONS => {
			";" => 321
		}
	},
	{#State 254
		DEFAULT => -51,
		GOTOS => {
			'STAR-20' => 322
		}
	},
	{#State 255
		ACTIONS => {
			"our" => 324,
			'LITERAL_NUMBER' => 323
		},
		GOTOS => {
			'SubroutineOrMethod' => 327,
			'Subroutine' => 325,
			'Method' => 326
		}
	},
	{#State 256
		ACTIONS => {
			'LBRACE' => 328
		}
	},
	{#State 257
		ACTIONS => {
			";" => 329
		}
	},
	{#State 258
		ACTIONS => {
			";" => 330
		}
	},
	{#State 259
		ACTIONS => {
			'OP15_LOGICAL_AND' => -83,
			'OP08_MATH_ADD_SUB' => -83,
			'OP13_BITWISE_AND' => -83,
			")" => -83,
			'OP17_LIST_RANGE' => -83,
			";" => -83,
			'OP12_COMPARE_EQ_NE' => -83,
			'OP11_COMPARE_LT_GT' => -83,
			"]" => -83,
			'OP23_LOGICAL_AND' => -83,
			'OP07_STRING_REPEAT' => -83,
			'OP04_MATH_POW' => -83,
			'OP08_STRING_CAT' => -83,
			'OP16_LOGICAL_OR' => -83,
			'OP24_LOGICAL_OR_XOR' => -83,
			'OP14_BITWISE_OR_XOR' => -83,
			'OP07_MATH_MULT_DIV_MOD' => -83,
			'OP09_BITWISE_SHIFT' => -83,
			"}" => -83,
			'OP21_LIST_COMMA' => -83,
			'OP18_TERNARY' => -83,
			'OP06_REGEX_MATCH' => -83
		}
	},
	{#State 260
		DEFAULT => -200
	},
	{#State 261
		ACTIONS => {
			"\$TYPED_" => 331
		}
	},
	{#State 262
		ACTIONS => {
			"}" => 332
		}
	},
	{#State 263
		DEFAULT => -175
	},
	{#State 264
		ACTIONS => {
			'CONSTANT_CALL_SCOPED' => 90,
			'OP22_LOGICAL_NEG' => 92,
			'WORD_SCOPED' => 26,
			'LPAREN' => 119,
			'VARIABLE_SYMBOL' => 89,
			"undef" => 127,
			'OP05_LOGICAL_NEG' => 96,
			"\@{" => 97,
			'OP01_NAMED' => 152,
			'LITERAL_NUMBER' => 80,
			'OP05_MATH_NEG_LPAREN' => 109,
			'SELF' => 135,
			'LBRACKET' => 131,
			'LBRACE' => 103,
			'OP10_NAMED_UNARY' => 105,
			'OP01_CLOSE' => 101,
			'WORD' => 28,
			"%{" => 116,
			'WORD_UPPERCASE' => 153,
			'LITERAL_STRING' => 81,
			'OP05_BITWISE_NEG_LPAREN' => 112,
			'OP03_MATH_INC_DEC' => 136,
			'OP01_OPEN' => 110
		},
		GOTOS => {
			'SubExpression' => 333,
			'WordScoped' => 130,
			'VariableSymbolOrSelf' => 102,
			'Variable' => 155,
			'Operator' => 134,
			'HashDereference' => 93,
			'HashReference' => 94,
			'ArrayDereference' => 107,
			'Literal' => 113,
			'Expression' => 151,
			'ArrayReference' => 115
		}
	},
	{#State 265
		ACTIONS => {
			'VARIABLE_SYMBOL' => 89,
			'LPAREN' => 119,
			'WORD_SCOPED' => 26,
			'CONSTANT_CALL_SCOPED' => 90,
			'OP22_LOGICAL_NEG' => 92,
			"undef" => 127,
			"\@{" => 97,
			'OP05_LOGICAL_NEG' => 96,
			'OP10_NAMED_UNARY' => 105,
			'LBRACKET' => 131,
			'LBRACE' => 103,
			'OP05_MATH_NEG_LPAREN' => 109,
			'LITERAL_NUMBER' => 80,
			'SELF' => 135,
			'OP01_NAMED' => 152,
			'OP01_CLOSE' => 101,
			'LITERAL_STRING' => 81,
			'WORD_UPPERCASE' => 153,
			'WORD' => 335,
			"%{" => 116,
			'OP01_OPEN' => 110,
			'OP03_MATH_INC_DEC' => 136,
			'OP05_BITWISE_NEG_LPAREN' => 112
		},
		GOTOS => {
			'ArrayReference' => 115,
			'Expression' => 151,
			'Literal' => 113,
			'HashReference' => 94,
			'HashDereference' => 93,
			'ArrayDereference' => 107,
			'Operator' => 134,
			'Variable' => 155,
			'WordScoped' => 130,
			'VariableSymbolOrSelf' => 102,
			'SubExpression' => 334
		}
	},
	{#State 266
		ACTIONS => {
			"}" => 338,
			'OP21_LIST_COMMA' => 336
		},
		GOTOS => {
			'PAREN-49' => 337
		}
	},
	{#State 267
		ACTIONS => {
			'OP01_OPEN' => -203,
			'OP05_BITWISE_NEG_LPAREN' => -203,
			'OP03_MATH_INC_DEC' => -203,
			'WORD_UPPERCASE' => -203,
			'MY' => 159,
			'LITERAL_STRING' => -203,
			'WORD' => -203,
			"%{" => -203,
			'OP01_CLOSE' => -203,
			'LBRACE' => -203,
			'LBRACKET' => -203,
			'OP10_NAMED_UNARY' => -203,
			'OP01_NAMED' => -203,
			'OP05_MATH_NEG_LPAREN' => -203,
			'SELF' => -203,
			'LITERAL_NUMBER' => -203,
			'OP05_LOGICAL_NEG' => -203,
			"\@{" => -203,
			"undef" => -203,
			'WORD_SCOPED' => -203,
			'LPAREN' => -203,
			'VARIABLE_SYMBOL' => -203,
			'CONSTANT_CALL_SCOPED' => -203,
			'OP22_LOGICAL_NEG' => -203
		},
		GOTOS => {
			'OPTIONAL-48' => 339,
			'TypeInner' => 340
		}
	},
	{#State 268
		ACTIONS => {
			'LPAREN' => 119,
			'VARIABLE_SYMBOL' => 89,
			'WORD_SCOPED' => 26,
			'OP22_LOGICAL_NEG' => 92,
			'CONSTANT_CALL_SCOPED' => 90,
			"\@{" => 97,
			'OP05_LOGICAL_NEG' => 96,
			"undef" => 127,
			'OP01_CLOSE' => 101,
			'OP10_NAMED_UNARY' => 105,
			'LBRACE' => 103,
			'LBRACKET' => 131,
			'LITERAL_NUMBER' => 80,
			'OP05_MATH_NEG_LPAREN' => 109,
			'SELF' => 135,
			'OP01_NAMED' => 152,
			'OP01_OPEN' => 110,
			'OP03_MATH_INC_DEC' => 136,
			'OP05_BITWISE_NEG_LPAREN' => 112,
			'LITERAL_STRING' => 81,
			'WORD_UPPERCASE' => 153,
			"%{" => 116,
			'WORD' => 28
		},
		GOTOS => {
			'ArrayReference' => 115,
			'Expression' => 151,
			'Literal' => 113,
			'Variable' => 155,
			'Operator' => 134,
			'HashDereference' => 93,
			'HashReference' => 94,
			'ArrayDereference' => 107,
			'SubExpression' => 341,
			'VariableSymbolOrSelf' => 102,
			'WordScoped' => 130
		}
	},
	{#State 269
		ACTIONS => {
			'WORD_SCOPED' => 56,
			'TYPE_INTEGER' => 54,
			'WORD' => 53
		},
		GOTOS => {
			'Type' => 342
		}
	},
	{#State 270
		ACTIONS => {
			'WORD_SCOPED' => 56,
			'TYPE_INTEGER' => 54,
			'WORD' => 53
		},
		GOTOS => {
			'Type' => 343
		}
	},
	{#State 271
		ACTIONS => {
			'TYPE_INTEGER' => 344
		}
	},
	{#State 272
		ACTIONS => {
			'TYPE_INTEGER' => 345
		}
	},
	{#State 273
		ACTIONS => {
			'OP07_MATH_MULT_DIV_MOD' => 210,
			'OP09_BITWISE_SHIFT' => 211,
			'OP14_BITWISE_OR_XOR' => 212,
			'OP18_TERNARY' => 220,
			'OP21_LIST_COMMA' => -192,
			'OP06_REGEX_MATCH' => 221,
			'OP11_COMPARE_LT_GT' => 226,
			'OP12_COMPARE_EQ_NE' => 225,
			")" => -192,
			'OP13_BITWISE_AND' => 217,
			'OP17_LIST_RANGE' => 216,
			";" => -192,
			'OP15_LOGICAL_AND' => 218,
			'OP08_MATH_ADD_SUB' => 219,
			'OP04_MATH_POW' => 213,
			'OP08_STRING_CAT' => 222,
			'OP16_LOGICAL_OR' => 223,
			'OP24_LOGICAL_OR_XOR' => 214,
			'OP23_LOGICAL_AND' => 215,
			'OP07_STRING_REPEAT' => 224,
			"]" => -192
		}
	},
	{#State 274
		ACTIONS => {
			'OP22_LOGICAL_NEG' => 92,
			'CONSTANT_CALL_SCOPED' => 90,
			'WORD_SCOPED' => 26,
			'LPAREN' => 119,
			'VARIABLE_SYMBOL' => 89,
			'ARGV' => 197,
			"undef" => 127,
			'OP05_LOGICAL_NEG' => 96,
			"\@{" => 97,
			'OP01_NAMED' => 152,
			'LITERAL_NUMBER' => 80,
			'OP05_MATH_NEG_LPAREN' => 109,
			'SELF' => 135,
			'LBRACKET' => 131,
			'LBRACE' => 103,
			'OP10_NAMED_UNARY' => 105,
			'OP01_CLOSE' => 101,
			"%{" => 116,
			'WORD' => 28,
			'WORD_UPPERCASE' => 153,
			'MY' => 159,
			'LITERAL_STRING' => 81,
			'OP01_QW' => 200,
			'OP05_BITWISE_NEG_LPAREN' => 112,
			'OP03_MATH_INC_DEC' => 136,
			'OP01_OPEN' => 110
		},
		GOTOS => {
			'Expression' => 151,
			'Literal' => 113,
			'TypeInner' => 198,
			'ListElement' => 237,
			'ListElements' => 346,
			'ArrayReference' => 115,
			'WordScoped' => 130,
			'VariableSymbolOrSelf' => 102,
			'SubExpression' => 236,
			'HashDereference' => 93,
			'HashReference' => 94,
			'ArrayDereference' => 107,
			'Operator' => 134,
			'Variable' => 155
		}
	},
	{#State 275
		DEFAULT => -92
	},
	{#State 276
		ACTIONS => {
			'FHREF_SYMBOL' => 347
		}
	},
	{#State 277
		DEFAULT => -124
	},
	{#State 278
		DEFAULT => -90
	},
	{#State 279
		DEFAULT => -215
	},
	{#State 280
		ACTIONS => {
			"}" => 348
		}
	},
	{#State 281
		ACTIONS => {
			'OP12_COMPARE_EQ_NE' => -95,
			'OP11_COMPARE_LT_GT' => -95,
			'OP08_MATH_ADD_SUB' => -95,
			'OP15_LOGICAL_AND' => -95,
			";" => -95,
			'OP17_LIST_RANGE' => -95,
			")" => -95,
			'OP13_BITWISE_AND' => -95,
			'OP24_LOGICAL_OR_XOR' => -95,
			'OP16_LOGICAL_OR' => -95,
			'OP08_STRING_CAT' => -95,
			'OP04_MATH_POW' => 213,
			"]" => -95,
			'OP07_STRING_REPEAT' => 224,
			'OP23_LOGICAL_AND' => -95,
			'OP09_BITWISE_SHIFT' => -95,
			'OP07_MATH_MULT_DIV_MOD' => -95,
			'OP14_BITWISE_OR_XOR' => -95,
			'OP06_REGEX_MATCH' => 221,
			'OP21_LIST_COMMA' => -95,
			'OP18_TERNARY' => -95,
			"}" => -95
		}
	},
	{#State 282
		ACTIONS => {
			'OP18_TERNARY' => -98,
			'OP21_LIST_COMMA' => -98,
			'OP06_REGEX_MATCH' => 221,
			"}" => -98,
			'OP09_BITWISE_SHIFT' => -98,
			'OP07_MATH_MULT_DIV_MOD' => 210,
			'OP14_BITWISE_OR_XOR' => -98,
			'OP04_MATH_POW' => 213,
			'OP08_STRING_CAT' => 222,
			'OP16_LOGICAL_OR' => -98,
			'OP24_LOGICAL_OR_XOR' => -98,
			"]" => -98,
			'OP23_LOGICAL_AND' => -98,
			'OP07_STRING_REPEAT' => 224,
			'OP11_COMPARE_LT_GT' => -98,
			'OP12_COMPARE_EQ_NE' => -98,
			'OP15_LOGICAL_AND' => -98,
			'OP08_MATH_ADD_SUB' => 219,
			")" => -98,
			'OP13_BITWISE_AND' => -98,
			'OP17_LIST_RANGE' => -98,
			";" => -98
		}
	},
	{#State 283
		ACTIONS => {
			'OP21_LIST_COMMA' => -104,
			'OP18_TERNARY' => -104,
			'OP06_REGEX_MATCH' => 221,
			"}" => -104,
			'OP07_MATH_MULT_DIV_MOD' => 210,
			'OP09_BITWISE_SHIFT' => 211,
			'OP14_BITWISE_OR_XOR' => -104,
			'OP04_MATH_POW' => 213,
			'OP16_LOGICAL_OR' => -104,
			'OP08_STRING_CAT' => 222,
			'OP24_LOGICAL_OR_XOR' => -104,
			'OP23_LOGICAL_AND' => -104,
			'OP07_STRING_REPEAT' => 224,
			"]" => -104,
			'OP12_COMPARE_EQ_NE' => 225,
			'OP11_COMPARE_LT_GT' => 226,
			'OP17_LIST_RANGE' => -104,
			")" => -104,
			'OP13_BITWISE_AND' => 217,
			";" => -104,
			'OP15_LOGICAL_AND' => -104,
			'OP08_MATH_ADD_SUB' => 219
		}
	},
	{#State 284
		ACTIONS => {
			'OP12_COMPARE_EQ_NE' => -89,
			'OP11_COMPARE_LT_GT' => -89,
			'OP15_LOGICAL_AND' => -89,
			'OP08_MATH_ADD_SUB' => -89,
			'OP13_BITWISE_AND' => -89,
			")" => -89,
			'OP17_LIST_RANGE' => -89,
			";" => -89,
			'OP08_STRING_CAT' => -89,
			'OP04_MATH_POW' => 213,
			'OP16_LOGICAL_OR' => -89,
			'OP24_LOGICAL_OR_XOR' => -89,
			"]" => -89,
			'OP23_LOGICAL_AND' => -89,
			'OP07_STRING_REPEAT' => -89,
			'OP07_MATH_MULT_DIV_MOD' => -89,
			'OP09_BITWISE_SHIFT' => -89,
			'OP14_BITWISE_OR_XOR' => -89,
			'OP18_TERNARY' => -89,
			'OP21_LIST_COMMA' => -89,
			'OP06_REGEX_MATCH' => -89,
			"}" => -89
		}
	},
	{#State 285
		ACTIONS => {
			'OP14_BITWISE_OR_XOR' => 212,
			'OP09_BITWISE_SHIFT' => 211,
			'OP07_MATH_MULT_DIV_MOD' => 210,
			"}" => -111,
			'OP06_REGEX_MATCH' => 221,
			'OP21_LIST_COMMA' => -111,
			'OP18_TERNARY' => 220,
			";" => -111,
			'OP13_BITWISE_AND' => 217,
			")" => -111,
			'OP17_LIST_RANGE' => 216,
			'OP08_MATH_ADD_SUB' => 219,
			'OP15_LOGICAL_AND' => 218,
			'OP12_COMPARE_EQ_NE' => 225,
			'OP11_COMPARE_LT_GT' => 226,
			'OP07_STRING_REPEAT' => 224,
			'OP23_LOGICAL_AND' => 215,
			"]" => -111,
			'OP24_LOGICAL_OR_XOR' => -111,
			'OP04_MATH_POW' => 213,
			'OP08_STRING_CAT' => 222,
			'OP16_LOGICAL_OR' => 223
		}
	},
	{#State 286
		ACTIONS => {
			'OP11_COMPARE_LT_GT' => 226,
			'OP12_COMPARE_EQ_NE' => 225,
			'OP15_LOGICAL_AND' => 218,
			'OP08_MATH_ADD_SUB' => 219,
			'OP13_BITWISE_AND' => 217,
			")" => -110,
			'OP17_LIST_RANGE' => 216,
			";" => -110,
			'OP04_MATH_POW' => 213,
			'OP08_STRING_CAT' => 222,
			'OP16_LOGICAL_OR' => 223,
			'OP24_LOGICAL_OR_XOR' => -110,
			"]" => -110,
			'OP23_LOGICAL_AND' => -110,
			'OP07_STRING_REPEAT' => 224,
			'OP09_BITWISE_SHIFT' => 211,
			'OP07_MATH_MULT_DIV_MOD' => 210,
			'OP14_BITWISE_OR_XOR' => 212,
			'OP21_LIST_COMMA' => -110,
			'OP18_TERNARY' => 220,
			'OP06_REGEX_MATCH' => 221,
			"}" => -110
		}
	},
	{#State 287
		ACTIONS => {
			'OP23_LOGICAL_AND' => -107,
			'OP07_STRING_REPEAT' => 224,
			"]" => -107,
			'OP08_STRING_CAT' => 222,
			'OP04_MATH_POW' => 213,
			'OP16_LOGICAL_OR' => 223,
			'OP24_LOGICAL_OR_XOR' => -107,
			")" => -107,
			'OP13_BITWISE_AND' => 217,
			'OP17_LIST_RANGE' => undef,
			";" => -107,
			'OP15_LOGICAL_AND' => 218,
			'OP08_MATH_ADD_SUB' => 219,
			'OP12_COMPARE_EQ_NE' => 225,
			'OP11_COMPARE_LT_GT' => 226,
			"}" => -107,
			'OP21_LIST_COMMA' => -107,
			'OP18_TERNARY' => -107,
			'OP06_REGEX_MATCH' => 221,
			'OP14_BITWISE_OR_XOR' => 212,
			'OP09_BITWISE_SHIFT' => 211,
			'OP07_MATH_MULT_DIV_MOD' => 210
		}
	},
	{#State 288
		ACTIONS => {
			'OP07_MATH_MULT_DIV_MOD' => 210,
			'OP09_BITWISE_SHIFT' => 211,
			'OP14_BITWISE_OR_XOR' => -103,
			'OP06_REGEX_MATCH' => 221,
			'OP18_TERNARY' => -103,
			'OP21_LIST_COMMA' => -103,
			"}" => -103,
			'OP11_COMPARE_LT_GT' => 226,
			'OP12_COMPARE_EQ_NE' => 225,
			'OP08_MATH_ADD_SUB' => 219,
			'OP15_LOGICAL_AND' => -103,
			";" => -103,
			")" => -103,
			'OP13_BITWISE_AND' => -103,
			'OP17_LIST_RANGE' => -103,
			'OP24_LOGICAL_OR_XOR' => -103,
			'OP04_MATH_POW' => 213,
			'OP08_STRING_CAT' => 222,
			'OP16_LOGICAL_OR' => -103,
			"]" => -103,
			'OP07_STRING_REPEAT' => 224,
			'OP23_LOGICAL_AND' => -103
		}
	},
	{#State 289
		ACTIONS => {
			'OP06_REGEX_MATCH' => 221,
			'OP18_TERNARY' => -105,
			'OP21_LIST_COMMA' => -105,
			"}" => -105,
			'OP07_MATH_MULT_DIV_MOD' => 210,
			'OP09_BITWISE_SHIFT' => 211,
			'OP14_BITWISE_OR_XOR' => 212,
			'OP24_LOGICAL_OR_XOR' => -105,
			'OP04_MATH_POW' => 213,
			'OP16_LOGICAL_OR' => -105,
			'OP08_STRING_CAT' => 222,
			'OP07_STRING_REPEAT' => 224,
			'OP23_LOGICAL_AND' => -105,
			"]" => -105,
			'OP12_COMPARE_EQ_NE' => 225,
			'OP11_COMPARE_LT_GT' => 226,
			";" => -105,
			'OP13_BITWISE_AND' => 217,
			")" => -105,
			'OP17_LIST_RANGE' => -105,
			'OP08_MATH_ADD_SUB' => 219,
			'OP15_LOGICAL_AND' => -105
		}
	},
	{#State 290
		ACTIONS => {
			'OP07_MATH_MULT_DIV_MOD' => 210,
			'OP09_BITWISE_SHIFT' => -96,
			'OP14_BITWISE_OR_XOR' => -96,
			'OP21_LIST_COMMA' => -96,
			'OP18_TERNARY' => -96,
			'OP06_REGEX_MATCH' => 221,
			"}" => -96,
			'OP12_COMPARE_EQ_NE' => -96,
			'OP11_COMPARE_LT_GT' => -96,
			'OP17_LIST_RANGE' => -96,
			")" => -96,
			'OP13_BITWISE_AND' => -96,
			";" => -96,
			'OP15_LOGICAL_AND' => -96,
			'OP08_MATH_ADD_SUB' => -96,
			'OP16_LOGICAL_OR' => -96,
			'OP04_MATH_POW' => 213,
			'OP08_STRING_CAT' => -96,
			'OP24_LOGICAL_OR_XOR' => -96,
			'OP23_LOGICAL_AND' => -96,
			'OP07_STRING_REPEAT' => 224,
			"]" => -96
		}
	},
	{#State 291
		DEFAULT => -228
	},
	{#State 292
		ACTIONS => {
			'COLON' => 349
		}
	},
	{#State 293
		DEFAULT => -227
	},
	{#State 294
		DEFAULT => -93
	},
	{#State 295
		ACTIONS => {
			'OP15_LOGICAL_AND' => -97,
			'OP08_MATH_ADD_SUB' => 219,
			")" => -97,
			'OP13_BITWISE_AND' => -97,
			'OP17_LIST_RANGE' => -97,
			";" => -97,
			'OP12_COMPARE_EQ_NE' => -97,
			'OP11_COMPARE_LT_GT' => -97,
			"]" => -97,
			'OP23_LOGICAL_AND' => -97,
			'OP07_STRING_REPEAT' => 224,
			'OP08_STRING_CAT' => -97,
			'OP16_LOGICAL_OR' => -97,
			'OP04_MATH_POW' => 213,
			'OP24_LOGICAL_OR_XOR' => -97,
			'OP14_BITWISE_OR_XOR' => -97,
			'OP07_MATH_MULT_DIV_MOD' => 210,
			'OP09_BITWISE_SHIFT' => -97,
			"}" => -97,
			'OP18_TERNARY' => -97,
			'OP21_LIST_COMMA' => -97,
			'OP06_REGEX_MATCH' => 221
		}
	},
	{#State 296
		ACTIONS => {
			"}" => -106,
			'OP21_LIST_COMMA' => -106,
			'OP18_TERNARY' => -106,
			'OP06_REGEX_MATCH' => 221,
			'OP14_BITWISE_OR_XOR' => 212,
			'OP09_BITWISE_SHIFT' => 211,
			'OP07_MATH_MULT_DIV_MOD' => 210,
			'OP23_LOGICAL_AND' => -106,
			'OP07_STRING_REPEAT' => 224,
			"]" => -106,
			'OP16_LOGICAL_OR' => -106,
			'OP04_MATH_POW' => 213,
			'OP08_STRING_CAT' => 222,
			'OP24_LOGICAL_OR_XOR' => -106,
			'OP17_LIST_RANGE' => -106,
			")" => -106,
			'OP13_BITWISE_AND' => 217,
			";" => -106,
			'OP15_LOGICAL_AND' => 218,
			'OP08_MATH_ADD_SUB' => 219,
			'OP11_COMPARE_LT_GT' => 226,
			'OP12_COMPARE_EQ_NE' => 225
		}
	},
	{#State 297
		ACTIONS => {
			'OP07_STRING_REPEAT' => -94,
			'OP23_LOGICAL_AND' => -94,
			"]" => -94,
			'OP24_LOGICAL_OR_XOR' => -94,
			'OP08_STRING_CAT' => -94,
			'OP16_LOGICAL_OR' => -94,
			'OP04_MATH_POW' => 213,
			";" => -94,
			'OP17_LIST_RANGE' => -94,
			")" => -94,
			'OP13_BITWISE_AND' => -94,
			'OP08_MATH_ADD_SUB' => -94,
			'OP15_LOGICAL_AND' => -94,
			'OP11_COMPARE_LT_GT' => -94,
			'OP12_COMPARE_EQ_NE' => -94,
			"}" => -94,
			'OP06_REGEX_MATCH' => 221,
			'OP18_TERNARY' => -94,
			'OP21_LIST_COMMA' => -94,
			'OP14_BITWISE_OR_XOR' => -94,
			'OP09_BITWISE_SHIFT' => -94,
			'OP07_MATH_MULT_DIV_MOD' => -94
		}
	},
	{#State 298
		ACTIONS => {
			"}" => -102,
			'OP21_LIST_COMMA' => -102,
			'OP18_TERNARY' => -102,
			'OP06_REGEX_MATCH' => 221,
			'OP14_BITWISE_OR_XOR' => -102,
			'OP09_BITWISE_SHIFT' => 211,
			'OP07_MATH_MULT_DIV_MOD' => 210,
			"]" => -102,
			'OP23_LOGICAL_AND' => -102,
			'OP07_STRING_REPEAT' => 224,
			'OP04_MATH_POW' => 213,
			'OP08_STRING_CAT' => 222,
			'OP16_LOGICAL_OR' => -102,
			'OP24_LOGICAL_OR_XOR' => -102,
			'OP15_LOGICAL_AND' => -102,
			'OP08_MATH_ADD_SUB' => 219,
			'OP17_LIST_RANGE' => -102,
			")" => -102,
			'OP13_BITWISE_AND' => -102,
			";" => -102,
			'OP11_COMPARE_LT_GT' => 226,
			'OP12_COMPARE_EQ_NE' => undef
		}
	},
	{#State 299
		ACTIONS => {
			"}" => -101,
			'OP21_LIST_COMMA' => -101,
			'OP18_TERNARY' => -101,
			'OP06_REGEX_MATCH' => 221,
			'OP14_BITWISE_OR_XOR' => -101,
			'OP07_MATH_MULT_DIV_MOD' => 210,
			'OP09_BITWISE_SHIFT' => 211,
			"]" => -101,
			'OP23_LOGICAL_AND' => -101,
			'OP07_STRING_REPEAT' => 224,
			'OP04_MATH_POW' => 213,
			'OP08_STRING_CAT' => 222,
			'OP16_LOGICAL_OR' => -101,
			'OP24_LOGICAL_OR_XOR' => -101,
			'OP15_LOGICAL_AND' => -101,
			'OP08_MATH_ADD_SUB' => 219,
			")" => -101,
			'OP17_LIST_RANGE' => -101,
			'OP13_BITWISE_AND' => -101,
			";" => -101,
			'OP12_COMPARE_EQ_NE' => -101,
			'OP11_COMPARE_LT_GT' => undef
		}
	},
	{#State 300
		DEFAULT => -143
	},
	{#State 301
		ACTIONS => {
			"undef" => 127,
			'ARGV' => 197,
			'OP05_LOGICAL_NEG' => 96,
			"\@{" => 97,
			'WORD_SCOPED' => 26,
			'LPAREN' => 119,
			'VARIABLE_SYMBOL' => 89,
			'CONSTANT_CALL_SCOPED' => 90,
			'OP22_LOGICAL_NEG' => 92,
			'WORD_UPPERCASE' => 153,
			'MY' => 159,
			'LITERAL_STRING' => 81,
			"%{" => 116,
			'WORD' => 28,
			'OP01_OPEN' => 110,
			'OP05_BITWISE_NEG_LPAREN' => 112,
			'OP01_QW' => 200,
			'OP03_MATH_INC_DEC' => 136,
			'LBRACE' => 103,
			'LBRACKET' => 131,
			'OP10_NAMED_UNARY' => 105,
			'OP01_NAMED' => 152,
			'SELF' => 135,
			'OP05_MATH_NEG_LPAREN' => 109,
			'LITERAL_NUMBER' => 80,
			'OP01_CLOSE' => 101
		},
		GOTOS => {
			'ListElements' => 350,
			'ListElement' => 237,
			'TypeInner' => 198,
			'Expression' => 151,
			'Literal' => 113,
			'ArrayReference' => 115,
			'SubExpression' => 236,
			'WordScoped' => 130,
			'VariableSymbolOrSelf' => 102,
			'Operator' => 134,
			'Variable' => 155,
			'ArrayDereference' => 107,
			'HashDereference' => 93,
			'HashReference' => 94
		}
	},
	{#State 302
		ACTIONS => {
			'OP21_LIST_COMMA' => 351
		}
	},
	{#State 303
		DEFAULT => -185
	},
	{#State 304
		DEFAULT => -146
	},
	{#State 305
		DEFAULT => -145
	},
	{#State 306
		ACTIONS => {
			'OP06_REGEX_MATCH' => 221,
			'OP18_TERNARY' => 220,
			'OP14_BITWISE_OR_XOR' => 212,
			'OP09_BITWISE_SHIFT' => 211,
			'OP07_MATH_MULT_DIV_MOD' => 210,
			'OP07_STRING_REPEAT' => 224,
			'OP23_LOGICAL_AND' => 215,
			'OP24_LOGICAL_OR_XOR' => 214,
			'OP16_LOGICAL_OR' => 223,
			'OP04_MATH_POW' => 213,
			'OP08_STRING_CAT' => 222,
			'OP08_MATH_ADD_SUB' => 219,
			'OP15_LOGICAL_AND' => 218,
			";" => -144,
			")" => -144,
			'OP17_LIST_RANGE' => 216,
			'OP13_BITWISE_AND' => 217,
			'OP12_COMPARE_EQ_NE' => 225,
			'OP11_COMPARE_LT_GT' => 226
		}
	},
	{#State 307
		ACTIONS => {
			'OP09_BITWISE_SHIFT' => 211,
			'OP07_MATH_MULT_DIV_MOD' => 210,
			'OP14_BITWISE_OR_XOR' => 212,
			'OP18_TERNARY' => 220,
			'OP06_REGEX_MATCH' => 221,
			'OP12_COMPARE_EQ_NE' => 225,
			'OP11_COMPARE_LT_GT' => 226,
			'OP13_BITWISE_AND' => 217,
			")" => -186,
			'OP17_LIST_RANGE' => 216,
			";" => -186,
			'OP15_LOGICAL_AND' => 218,
			'OP08_MATH_ADD_SUB' => 219,
			'OP08_STRING_CAT' => 222,
			'OP16_LOGICAL_OR' => 223,
			'OP04_MATH_POW' => 213,
			'OP24_LOGICAL_OR_XOR' => 214,
			'OP23_LOGICAL_AND' => 215,
			'OP07_STRING_REPEAT' => 224
		}
	},
	{#State 308
		ACTIONS => {
			'OP01_CLOSE' => 101,
			'OP10_NAMED_UNARY' => 105,
			'LBRACE' => 103,
			'LBRACKET' => 131,
			'SELF' => 135,
			'OP05_MATH_NEG_LPAREN' => 109,
			'LITERAL_NUMBER' => 80,
			'OP01_NAMED' => 152,
			")" => -128,
			'OP01_OPEN' => 110,
			'OP03_MATH_INC_DEC' => 136,
			'OP01_QW' => 200,
			'OP05_BITWISE_NEG_LPAREN' => 112,
			'LITERAL_STRING' => 81,
			'WORD_UPPERCASE' => 153,
			'MY' => 159,
			'WORD' => 28,
			"%{" => 116,
			'LPAREN' => 119,
			'VARIABLE_SYMBOL' => 89,
			'WORD_SCOPED' => 26,
			'OP22_LOGICAL_NEG' => 92,
			'CONSTANT_CALL_SCOPED' => 90,
			"\@{" => 97,
			'OP05_LOGICAL_NEG' => 96,
			"undef" => 127,
			'ARGV' => 197
		},
		GOTOS => {
			'HashReference' => 94,
			'HashDereference' => 93,
			'ArrayDereference' => 107,
			'Operator' => 134,
			'Variable' => 155,
			'WordScoped' => 130,
			'VariableSymbolOrSelf' => 102,
			'SubExpression' => 236,
			'OPTIONAL-35' => 352,
			'ArrayReference' => 115,
			'Expression' => 151,
			'Literal' => 113,
			'TypeInner' => 198,
			'ListElement' => 237,
			'ListElements' => 353
		}
	},
	{#State 309
		DEFAULT => -121
	},
	{#State 310
		ACTIONS => {
			'OP21_LIST_COMMA' => 354,
			"]" => -190,
			")" => -190,
			";" => -190
		},
		GOTOS => {
			'PAREN-44' => 355
		}
	},
	{#State 311
		ACTIONS => {
			";" => 356
		}
	},
	{#State 312
		DEFAULT => -134
	},
	{#State 313
		DEFAULT => -125
	},
	{#State 314
		ACTIONS => {
			")" => 357
		}
	},
	{#State 315
		DEFAULT => -197
	},
	{#State 316
		ACTIONS => {
			'OP07_STRING_REPEAT' => 224,
			'OP23_LOGICAL_AND' => 215,
			'OP24_LOGICAL_OR_XOR' => 214,
			'OP04_MATH_POW' => 213,
			'OP16_LOGICAL_OR' => 223,
			'OP08_STRING_CAT' => 222,
			'OP17_LIST_RANGE' => 216,
			")" => 358,
			'OP13_BITWISE_AND' => 217,
			'OP08_MATH_ADD_SUB' => 219,
			'OP15_LOGICAL_AND' => 218,
			'OP12_COMPARE_EQ_NE' => 225,
			'OP11_COMPARE_LT_GT' => 226,
			'OP06_REGEX_MATCH' => 221,
			'OP18_TERNARY' => 220,
			'OP14_BITWISE_OR_XOR' => 212,
			'OP07_MATH_MULT_DIV_MOD' => 210,
			'OP09_BITWISE_SHIFT' => 211
		}
	},
	{#State 317
		DEFAULT => -130
	},
	{#State 318
		ACTIONS => {
			'OP02_ARRAY_THINARROW' => 359,
			'OP19_VARIABLE_ASSIGN' => 360,
			";" => 361
		}
	},
	{#State 319
		ACTIONS => {
			";" => 362
		}
	},
	{#State 320
		DEFAULT => -226
	},
	{#State 321
		DEFAULT => -48
	},
	{#State 322
		ACTIONS => {
			")" => 363,
			'OP21_LIST_COMMA' => 365
		},
		GOTOS => {
			'PAREN-19' => 364
		}
	},
	{#State 323
		ACTIONS => {
			";" => 366
		}
	},
	{#State 324
		ACTIONS => {
			'WORD_SCOPED' => 56,
			'TYPE_INTEGER' => 54,
			'TYPE_METHOD' => 367,
			'WORD' => 53
		},
		GOTOS => {
			'Type' => 55
		}
	},
	{#State 325
		DEFAULT => -76
	},
	{#State 326
		DEFAULT => -77
	},
	{#State 327
		DEFAULT => -59
	},
	{#State 328
		ACTIONS => {
			'OP01_NAMED' => 173,
			'OP08_MATH_ADD_SUB' => 172,
			'OP10_NAMED_UNARY' => 171,
			'OP01_CLOSE' => 174,
			'OP12_COMPARE_EQ_NE' => 184,
			'OP11_COMPARE_LT_GT' => 185,
			'OP07_STRING_REPEAT' => 186,
			'OP23_LOGICAL_AND' => 175,
			'WORD' => 187,
			'OP19_LOOP_CONTROL' => 177,
			'OP24_LOGICAL_OR_XOR' => 178,
			'OP01_OPEN' => 176,
			'OP01_PRINT' => 167,
			'OP19_LOOP_CONTROL_SCOLON' => 182,
			'OP22_LOGICAL_NEG' => 166,
			'OP07_MATH_MULT_DIV_MOD' => 165,
			"}" => 368,
			'OP01_NAMED_VOID' => 183
		},
		GOTOS => {
			'HashEntryProperties' => 370,
			'OpStringOrWord' => 369
		}
	},
	{#State 329
		DEFAULT => -118
	},
	{#State 330
		DEFAULT => -117
	},
	{#State 331
		ACTIONS => {
			'OP01_NAMED' => 173,
			'OP08_MATH_ADD_SUB' => 172,
			'OP10_NAMED_UNARY' => 171,
			'OP01_CLOSE' => 174,
			'OP12_COMPARE_EQ_NE' => 184,
			'OP11_COMPARE_LT_GT' => 185,
			'OP23_LOGICAL_AND' => 175,
			'WORD' => 187,
			'OP07_STRING_REPEAT' => 186,
			'OP19_LOOP_CONTROL' => 177,
			'OP24_LOGICAL_OR_XOR' => 178,
			'OP01_OPEN' => 176,
			'OP01_PRINT' => 167,
			'OP22_LOGICAL_NEG' => 166,
			'OP19_LOOP_CONTROL_SCOLON' => 182,
			'OP07_MATH_MULT_DIV_MOD' => 165,
			'OP01_NAMED_VOID' => 183
		},
		GOTOS => {
			'OpStringOrWord' => 371
		}
	},
	{#State 332
		DEFAULT => -201
	},
	{#State 333
		ACTIONS => {
			'OP14_BITWISE_OR_XOR' => 212,
			'OP07_MATH_MULT_DIV_MOD' => 210,
			'OP09_BITWISE_SHIFT' => 211,
			'OP18_TERNARY' => 220,
			'OP06_REGEX_MATCH' => 221,
			'OP15_LOGICAL_AND' => 218,
			'OP08_MATH_ADD_SUB' => 219,
			'OP17_LIST_RANGE' => 216,
			'OP13_BITWISE_AND' => 217,
			'OP11_COMPARE_LT_GT' => 226,
			'OP12_COMPARE_EQ_NE' => 225,
			"]" => 372,
			'OP23_LOGICAL_AND' => 215,
			'OP07_STRING_REPEAT' => 224,
			'OP04_MATH_POW' => 213,
			'OP08_STRING_CAT' => 222,
			'OP16_LOGICAL_OR' => 223,
			'OP24_LOGICAL_OR_XOR' => 214
		}
	},
	{#State 334
		ACTIONS => {
			'OP14_BITWISE_OR_XOR' => 212,
			'OP07_MATH_MULT_DIV_MOD' => 210,
			'OP09_BITWISE_SHIFT' => 211,
			"}" => 373,
			'OP06_REGEX_MATCH' => 221,
			'OP18_TERNARY' => 220,
			'OP13_BITWISE_AND' => 217,
			'OP17_LIST_RANGE' => 216,
			'OP08_MATH_ADD_SUB' => 219,
			'OP15_LOGICAL_AND' => 218,
			'OP12_COMPARE_EQ_NE' => 225,
			'OP11_COMPARE_LT_GT' => 226,
			'OP07_STRING_REPEAT' => 224,
			'OP23_LOGICAL_AND' => 215,
			'OP24_LOGICAL_OR_XOR' => 214,
			'OP04_MATH_POW' => 213,
			'OP16_LOGICAL_OR' => 223,
			'OP08_STRING_CAT' => 222
		}
	},
	{#State 335
		ACTIONS => {
			'OP02_METHOD_THINARROW_NEW' => -217,
			'LPAREN' => -217,
			"}" => 374
		}
	},
	{#State 336
		ACTIONS => {
			'OP08_MATH_ADD_SUB' => 172,
			'OP10_NAMED_UNARY' => 171,
			'SELF' => 135,
			'LITERAL_NUMBER' => 80,
			'OP01_NAMED' => 173,
			'OP12_COMPARE_EQ_NE' => 184,
			'OP11_COMPARE_LT_GT' => 185,
			'OP01_CLOSE' => 174,
			'LITERAL_STRING' => 81,
			'OP07_STRING_REPEAT' => 186,
			'OP23_LOGICAL_AND' => 175,
			'WORD' => 187,
			"%{" => 116,
			'OP19_LOOP_CONTROL' => 177,
			'OP01_OPEN' => 176,
			'OP24_LOGICAL_OR_XOR' => 178,
			'OP07_MATH_MULT_DIV_MOD' => 165,
			'VARIABLE_SYMBOL' => 89,
			'ENV' => 181,
			'OP01_PRINT' => 167,
			'OP19_LOOP_CONTROL_SCOLON' => 182,
			'OP22_LOGICAL_NEG' => 166,
			'OP01_NAMED_VOID' => 183
		},
		GOTOS => {
			'HashDereference' => 164,
			'Variable' => 180,
			'HashEntry' => 375,
			'OpStringOrWord' => 170,
			'VarOrLitOrOpStrOrWord' => 169,
			'Literal' => 179,
			'VariableSymbolOrSelf' => 102
		}
	},
	{#State 337
		DEFAULT => -209
	},
	{#State 338
		DEFAULT => -211
	},
	{#State 339
		ACTIONS => {
			'LITERAL_STRING' => 81,
			'WORD_UPPERCASE' => 153,
			'WORD' => 28,
			"%{" => 116,
			'OP01_OPEN' => 110,
			'OP03_MATH_INC_DEC' => 136,
			'OP05_BITWISE_NEG_LPAREN' => 112,
			'OP10_NAMED_UNARY' => 105,
			'LBRACKET' => 131,
			'LBRACE' => 103,
			'LITERAL_NUMBER' => 80,
			'OP05_MATH_NEG_LPAREN' => 109,
			'SELF' => 135,
			'OP01_NAMED' => 152,
			'OP01_CLOSE' => 101,
			"undef" => 127,
			"\@{" => 97,
			'OP05_LOGICAL_NEG' => 96,
			'VARIABLE_SYMBOL' => 89,
			'LPAREN' => 119,
			'WORD_SCOPED' => 26,
			'OP22_LOGICAL_NEG' => 92,
			'CONSTANT_CALL_SCOPED' => 90
		},
		GOTOS => {
			'SubExpression' => 376,
			'WordScoped' => 130,
			'VariableSymbolOrSelf' => 102,
			'Variable' => 155,
			'Operator' => 134,
			'HashDereference' => 93,
			'HashReference' => 94,
			'ArrayDereference' => 107,
			'Expression' => 151,
			'Literal' => 113,
			'ArrayReference' => 115
		}
	},
	{#State 340
		DEFAULT => -202
	},
	{#State 341
		ACTIONS => {
			'OP11_COMPARE_LT_GT' => 226,
			'OP12_COMPARE_EQ_NE' => 225,
			'OP08_MATH_ADD_SUB' => 219,
			'OP15_LOGICAL_AND' => 218,
			'OP17_LIST_RANGE' => 216,
			'OP13_BITWISE_AND' => 217,
			")" => 377,
			'OP24_LOGICAL_OR_XOR' => 214,
			'OP04_MATH_POW' => 213,
			'OP08_STRING_CAT' => 222,
			'OP16_LOGICAL_OR' => 223,
			'OP07_STRING_REPEAT' => 224,
			'OP23_LOGICAL_AND' => 215,
			'OP09_BITWISE_SHIFT' => 211,
			'OP07_MATH_MULT_DIV_MOD' => 210,
			'OP14_BITWISE_OR_XOR' => 212,
			'OP06_REGEX_MATCH' => 221,
			'OP18_TERNARY' => 220
		}
	},
	{#State 342
		ACTIONS => {
			'VARIABLE_SYMBOL' => 378
		}
	},
	{#State 343
		ACTIONS => {
			'VARIABLE_SYMBOL' => 379
		}
	},
	{#State 344
		ACTIONS => {
			'VARIABLE_SYMBOL' => 380
		}
	},
	{#State 345
		ACTIONS => {
			'VARIABLE_SYMBOL' => 381
		}
	},
	{#State 346
		ACTIONS => {
			";" => 382
		}
	},
	{#State 347
		ACTIONS => {
			'OP21_LIST_COMMA' => 383
		}
	},
	{#State 348
		DEFAULT => -216
	},
	{#State 349
		ACTIONS => {
			'VARIABLE_SYMBOL' => 89,
			'LITERAL_NUMBER' => 80,
			'SELF' => 135,
			'LITERAL_STRING' => 81
		},
		GOTOS => {
			'Variable' => 293,
			'VariableOrLiteral' => 384,
			'VariableSymbolOrSelf' => 102,
			'Literal' => 291
		}
	},
	{#State 350
		ACTIONS => {
			")" => 385
		}
	},
	{#State 351
		ACTIONS => {
			'OP01_CLOSE' => 101,
			'LBRACE' => 103,
			'LBRACKET' => 131,
			'OP10_NAMED_UNARY' => 105,
			'OP01_NAMED' => 152,
			'OP05_MATH_NEG_LPAREN' => 109,
			'SELF' => 135,
			'LITERAL_NUMBER' => 80,
			'OP01_OPEN' => 110,
			'OP05_BITWISE_NEG_LPAREN' => 112,
			'OP01_QW' => 200,
			'OP03_MATH_INC_DEC' => 136,
			'MY' => 159,
			'WORD_UPPERCASE' => 153,
			'LITERAL_STRING' => 81,
			"%{" => 116,
			'WORD' => 28,
			'WORD_SCOPED' => 26,
			'VARIABLE_SYMBOL' => 89,
			'LPAREN' => 119,
			'OP22_LOGICAL_NEG' => 92,
			'CONSTANT_CALL_SCOPED' => 90,
			'OP05_LOGICAL_NEG' => 96,
			"\@{" => 97,
			"undef" => 127,
			'ARGV' => 197
		},
		GOTOS => {
			'ArrayReference' => 115,
			'ListElements' => 386,
			'ListElement' => 237,
			'TypeInner' => 198,
			'Literal' => 113,
			'Expression' => 151,
			'Variable' => 155,
			'Operator' => 134,
			'ArrayDereference' => 107,
			'HashDereference' => 93,
			'HashReference' => 94,
			'SubExpression' => 236,
			'VariableSymbolOrSelf' => 102,
			'WordScoped' => 130
		}
	},
	{#State 352
		ACTIONS => {
			")" => 387
		}
	},
	{#State 353
		DEFAULT => -127
	},
	{#State 354
		ACTIONS => {
			'CONSTANT_CALL_SCOPED' => 90,
			'OP22_LOGICAL_NEG' => 92,
			'LPAREN' => 119,
			'VARIABLE_SYMBOL' => 89,
			'WORD_SCOPED' => 26,
			"\@{" => 97,
			'OP05_LOGICAL_NEG' => 96,
			'ARGV' => 197,
			"undef" => 127,
			'OP01_CLOSE' => 101,
			'OP05_MATH_NEG_LPAREN' => 109,
			'LITERAL_NUMBER' => 80,
			'SELF' => 135,
			'OP01_NAMED' => 152,
			'OP10_NAMED_UNARY' => 105,
			'LBRACE' => 103,
			'LBRACKET' => 131,
			'OP03_MATH_INC_DEC' => 136,
			'OP05_BITWISE_NEG_LPAREN' => 112,
			'OP01_QW' => 200,
			'OP01_OPEN' => 110,
			"%{" => 116,
			'WORD' => 28,
			'LITERAL_STRING' => 81,
			'WORD_UPPERCASE' => 153,
			'MY' => 159
		},
		GOTOS => {
			'ListElement' => 388,
			'Expression' => 151,
			'Literal' => 113,
			'TypeInner' => 198,
			'ArrayReference' => 115,
			'SubExpression' => 236,
			'VariableSymbolOrSelf' => 102,
			'WordScoped' => 130,
			'Variable' => 155,
			'Operator' => 134,
			'HashReference' => 94,
			'HashDereference' => 93,
			'ArrayDereference' => 107
		}
	},
	{#State 355
		DEFAULT => -188
	},
	{#State 356
		DEFAULT => -120
	},
	{#State 357
		DEFAULT => -132
	},
	{#State 358
		ACTIONS => {
			'LBRACE' => 390
		},
		GOTOS => {
			'CodeBlock' => 389
		}
	},
	{#State 359
		ACTIONS => {
			'OP01_OPEN' => 110,
			'OP05_BITWISE_NEG_LPAREN' => 112,
			'OP03_MATH_INC_DEC' => 136,
			'WORD_UPPERCASE' => 153,
			'LITERAL_STRING' => 81,
			"%{" => 116,
			'WORD' => 28,
			'OP01_CLOSE' => 101,
			'LBRACKET' => 131,
			'LBRACE' => 103,
			'OP10_NAMED_UNARY' => 105,
			'OP01_NAMED' => 152,
			'OP05_MATH_NEG_LPAREN' => 109,
			'LITERAL_NUMBER' => 80,
			'SELF' => 135,
			'OP05_LOGICAL_NEG' => 96,
			"\@{" => 97,
			"undef" => 127,
			'WORD_SCOPED' => 26,
			'LPAREN' => 119,
			'VARIABLE_SYMBOL' => 89,
			'CONSTANT_CALL_SCOPED' => 90,
			'OP22_LOGICAL_NEG' => 92
		},
		GOTOS => {
			'WordScoped' => 130,
			'VariableSymbolOrSelf' => 102,
			'SubExpression' => 391,
			'ArrayDereference' => 107,
			'HashReference' => 94,
			'HashDereference' => 93,
			'Operator' => 134,
			'Variable' => 155,
			'Literal' => 113,
			'Expression' => 151,
			'ArrayReference' => 115
		}
	},
	{#State 360
		ACTIONS => {
			"%{" => 116,
			'WORD' => 28,
			'WORD_UPPERCASE' => 153,
			'LITERAL_STRING' => 81,
			'OP05_BITWISE_NEG_LPAREN' => 112,
			'OP03_MATH_INC_DEC' => 136,
			'OP01_OPEN' => 110,
			'OP01_NAMED' => 152,
			'LITERAL_NUMBER' => 80,
			'OP05_MATH_NEG_LPAREN' => 109,
			'SELF' => 135,
			'LBRACE' => 103,
			'FHREF_SYMBOL_IN' => 305,
			'LBRACKET' => 131,
			'OP10_NAMED_UNARY' => 105,
			'OP01_CLOSE' => 101,
			'OP10_NAMED_UNARY_SCOLON' => 392,
			"undef" => 127,
			'OP05_LOGICAL_NEG' => 96,
			"\@{" => 97,
			'OP01_NAMED_SCOLON' => 393,
			'STDIN' => 304,
			'OP22_LOGICAL_NEG' => 92,
			'CONSTANT_CALL_SCOPED' => 90,
			'WORD_SCOPED' => 26,
			'VARIABLE_SYMBOL' => 89,
			'LPAREN' => 119
		},
		GOTOS => {
			'Operator' => 134,
			'Variable' => 155,
			'ArrayDereference' => 107,
			'HashDereference' => 93,
			'HashReference' => 94,
			'SubExpression' => 306,
			'SubExpressionOrInput' => 395,
			'VariableSymbolOrSelf' => 102,
			'WordScoped' => 130,
			'ArrayReference' => 115,
			'OpNamedScolonOrSubExpIn' => 394,
			'Literal' => 113,
			'Expression' => 151
		}
	},
	{#State 361
		DEFAULT => -181
	},
	{#State 362
		DEFAULT => -184
	},
	{#State 363
		ACTIONS => {
			'OP19_VARIABLE_ASSIGN' => 396
		}
	},
	{#State 364
		DEFAULT => -50
	},
	{#State 365
		ACTIONS => {
			'MY' => 397
		}
	},
	{#State 366
		DEFAULT => -61
	},
	{#State 367
		ACTIONS => {
			'VARIABLE_SYMBOL' => 398
		}
	},
	{#State 368
		ACTIONS => {
			";" => 399
		}
	},
	{#State 369
		ACTIONS => {
			'OP20_HASH_FATARROW' => 400
		}
	},
	{#State 370
		DEFAULT => -64,
		GOTOS => {
			'STAR-26' => 401
		}
	},
	{#State 371
		ACTIONS => {
			'OP19_VARIABLE_ASSIGN' => 402
		}
	},
	{#State 372
		DEFAULT => -178
	},
	{#State 373
		DEFAULT => -179
	},
	{#State 374
		DEFAULT => -180
	},
	{#State 375
		DEFAULT => -208
	},
	{#State 376
		ACTIONS => {
			'OP14_BITWISE_OR_XOR' => 212,
			'OP09_BITWISE_SHIFT' => 211,
			'OP07_MATH_MULT_DIV_MOD' => 210,
			"}" => -204,
			'OP18_TERNARY' => 220,
			'OP21_LIST_COMMA' => -204,
			'OP06_REGEX_MATCH' => 221,
			'OP15_LOGICAL_AND' => 218,
			'OP08_MATH_ADD_SUB' => 219,
			'OP17_LIST_RANGE' => 216,
			'OP13_BITWISE_AND' => 217,
			'OP12_COMPARE_EQ_NE' => 225,
			'OP11_COMPARE_LT_GT' => 226,
			'OP23_LOGICAL_AND' => 215,
			'OP07_STRING_REPEAT' => 224,
			'OP08_STRING_CAT' => 222,
			'OP04_MATH_POW' => 213,
			'OP16_LOGICAL_OR' => 223,
			'OP24_LOGICAL_OR_XOR' => 214
		}
	},
	{#State 377
		ACTIONS => {
			'LBRACE' => 390
		},
		GOTOS => {
			'CodeBlock' => 403
		}
	},
	{#State 378
		ACTIONS => {
			'OP19_VARIABLE_ASSIGN' => 404
		}
	},
	{#State 379
		ACTIONS => {
			'LPAREN' => 405
		}
	},
	{#State 380
		ACTIONS => {
			'OP19_VARIABLE_ASSIGN' => 406
		}
	},
	{#State 381
		ACTIONS => {
			'LPAREN' => 407
		}
	},
	{#State 382
		DEFAULT => -122
	},
	{#State 383
		ACTIONS => {
			'LITERAL_STRING' => 408
		}
	},
	{#State 384
		DEFAULT => -108
	},
	{#State 385
		DEFAULT => -82
	},
	{#State 386
		ACTIONS => {
			")" => 409
		}
	},
	{#State 387
		DEFAULT => -133
	},
	{#State 388
		DEFAULT => -187
	},
	{#State 389
		DEFAULT => -159,
		GOTOS => {
			'STAR-39' => 410
		}
	},
	{#State 390
		ACTIONS => {
			"%{" => 116,
			'LITERAL_STRING' => 81,
			'OP05_BITWISE_NEG_LPAREN' => 112,
			'OP01_OPEN' => 110,
			'OP19_LOOP_CONTROL' => 111,
			'OP01_NAMED' => 108,
			'OP05_MATH_NEG_LPAREN' => 109,
			'LITERAL_NUMBER' => 80,
			'LBRACE' => 103,
			"foreach" => -151,
			'OP10_NAMED_UNARY' => 105,
			'OP01_CLOSE' => 101,
			"for" => -151,
			'OP05_LOGICAL_NEG' => 96,
			"\@{" => 97,
			'CONSTANT_CALL_SCOPED' => 90,
			'OP22_LOGICAL_NEG' => 92,
			'OP01_PRINT' => 91,
			'VARIABLE_SYMBOL' => 89,
			'WORD' => 28,
			'MY' => 138,
			'WORD_UPPERCASE' => 137,
			'OP03_MATH_INC_DEC' => 136,
			'SELF' => 135,
			"if" => 133,
			'OP01_NAMED_VOID_SCOLON' => 132,
			'LBRACKET' => 131,
			'OP10_NAMED_UNARY_SCOLON' => 129,
			'OP01_NAMED_VOID_LPAREN' => 128,
			"while" => -151,
			"undef" => 127,
			'OP01_NAMED_VOID' => 124,
			'OP01_NAMED_SCOLON' => 123,
			'OP19_LOOP_CONTROL_SCOLON' => 121,
			'WORD_SCOPED' => 26,
			'LPAREN' => 119
		},
		GOTOS => {
			'WordScoped' => 130,
			'VariableSymbolOrSelf' => 102,
			'Operator' => 134,
			'OPTIONAL-37' => 104,
			'ArrayDereference' => 107,
			'PLUS-42' => 411,
			'Literal' => 113,
			'Expression' => 114,
			'Statement' => 139,
			'ArrayReference' => 115,
			'VariableDeclaration' => 118,
			'SubExpression' => 117,
			'LoopLabel' => 120,
			'Variable' => 122,
			'HashReference' => 94,
			'HashDereference' => 93,
			'OperatorVoid' => 95,
			'VariableModification' => 125,
			'Conditional' => 99,
			'PAREN-36' => 98,
			'Operation' => 412
		}
	},
	{#State 391
		ACTIONS => {
			'OP18_TERNARY' => 220,
			'OP06_REGEX_MATCH' => 221,
			'OP14_BITWISE_OR_XOR' => 212,
			'OP09_BITWISE_SHIFT' => 211,
			'OP07_MATH_MULT_DIV_MOD' => 210,
			'OP23_LOGICAL_AND' => 215,
			'OP07_STRING_REPEAT' => 224,
			"]" => 413,
			'OP04_MATH_POW' => 213,
			'OP08_STRING_CAT' => 222,
			'OP16_LOGICAL_OR' => 223,
			'OP24_LOGICAL_OR_XOR' => 214,
			'OP17_LIST_RANGE' => 216,
			'OP13_BITWISE_AND' => 217,
			'OP15_LOGICAL_AND' => 218,
			'OP08_MATH_ADD_SUB' => 219,
			'OP11_COMPARE_LT_GT' => 226,
			'OP12_COMPARE_EQ_NE' => 225
		}
	},
	{#State 392
		DEFAULT => -240
	},
	{#State 393
		DEFAULT => -239
	},
	{#State 394
		DEFAULT => -182
	},
	{#State 395
		ACTIONS => {
			";" => 414
		}
	},
	{#State 396
		ACTIONS => {
			"\@ARG;" => 415
		}
	},
	{#State 397
		ACTIONS => {
			'WORD' => 53,
			'WORD_SCOPED' => 56,
			'TYPE_INTEGER' => 54
		},
		GOTOS => {
			'Type' => 416
		}
	},
	{#State 398
		ACTIONS => {
			"= sub {" => 417
		}
	},
	{#State 399
		DEFAULT => -66
	},
	{#State 400
		ACTIONS => {
			'MY' => 419
		},
		GOTOS => {
			'TypeInnerProperties' => 418
		}
	},
	{#State 401
		ACTIONS => {
			'OP21_LIST_COMMA' => 420,
			"}" => 422
		},
		GOTOS => {
			'PAREN-25' => 421
		}
	},
	{#State 402
		DEFAULT => -223
	},
	{#State 403
		DEFAULT => -170
	},
	{#State 404
		ACTIONS => {
			"undef" => 127,
			'OP05_LOGICAL_NEG' => 96,
			"\@{" => 97,
			'STDIN' => 304,
			'WORD_SCOPED' => 26,
			'VARIABLE_SYMBOL' => 89,
			'LPAREN' => 119,
			'OP22_LOGICAL_NEG' => 92,
			'CONSTANT_CALL_SCOPED' => 90,
			'WORD_UPPERCASE' => 153,
			'LITERAL_STRING' => 81,
			"%{" => 116,
			'WORD' => 28,
			'OP01_OPEN' => 110,
			'OP05_BITWISE_NEG_LPAREN' => 112,
			'OP03_MATH_INC_DEC' => 136,
			'LBRACKET' => 131,
			'FHREF_SYMBOL_IN' => 305,
			'LBRACE' => 103,
			'OP10_NAMED_UNARY' => 105,
			'OP01_NAMED' => 152,
			'LITERAL_NUMBER' => 80,
			'OP05_MATH_NEG_LPAREN' => 109,
			'SELF' => 135,
			'OP01_CLOSE' => 101
		},
		GOTOS => {
			'Expression' => 151,
			'Literal' => 113,
			'ArrayReference' => 115,
			'SubExpression' => 306,
			'VariableSymbolOrSelf' => 102,
			'WordScoped' => 130,
			'SubExpressionOrInput' => 423,
			'Variable' => 155,
			'Operator' => 134,
			'HashDereference' => 93,
			'HashReference' => 94,
			'ArrayDereference' => 107
		}
	},
	{#State 405
		ACTIONS => {
			'WORD_SCOPED' => 26,
			'LPAREN' => 119,
			'VARIABLE_SYMBOL' => 89,
			'OP22_LOGICAL_NEG' => 92,
			'CONSTANT_CALL_SCOPED' => 90,
			"undef" => 127,
			'ARGV' => 197,
			'OP05_LOGICAL_NEG' => 96,
			"\@{" => 97,
			'LBRACE' => 103,
			'LBRACKET' => 131,
			'OP10_NAMED_UNARY' => 105,
			'OP01_NAMED' => 152,
			'OP05_MATH_NEG_LPAREN' => 109,
			'SELF' => 135,
			'LITERAL_NUMBER' => 80,
			'OP01_CLOSE' => 101,
			'WORD_UPPERCASE' => 153,
			'MY' => 159,
			'LITERAL_STRING' => 81,
			'WORD' => 28,
			"%{" => 116,
			'OP01_OPEN' => 110,
			'OP01_QW' => 200,
			'OP05_BITWISE_NEG_LPAREN' => 112,
			'OP03_MATH_INC_DEC' => 136
		},
		GOTOS => {
			'Variable' => 155,
			'Operator' => 134,
			'ArrayDereference' => 107,
			'HashDereference' => 93,
			'HashReference' => 94,
			'SubExpression' => 236,
			'VariableSymbolOrSelf' => 102,
			'WordScoped' => 130,
			'ArrayReference' => 115,
			'ListElements' => 424,
			'ListElement' => 237,
			'TypeInner' => 198,
			'Literal' => 113,
			'Expression' => 151
		}
	},
	{#State 406
		ACTIONS => {
			'LBRACE' => 103,
			'LBRACKET' => 131,
			'OP10_NAMED_UNARY' => 105,
			'OP01_NAMED' => 152,
			'OP05_MATH_NEG_LPAREN' => 109,
			'SELF' => 135,
			'LITERAL_NUMBER' => 80,
			'OP10_NAMED_UNARY_SCOLON' => 425,
			'OP01_CLOSE' => 101,
			'WORD_UPPERCASE' => 153,
			'LITERAL_STRING' => 81,
			"%{" => 116,
			'WORD' => 28,
			'OP01_OPEN' => 110,
			'OP05_BITWISE_NEG_LPAREN' => 112,
			'OP03_MATH_INC_DEC' => 136,
			'OP01_NAMED_SCOLON' => 428,
			'WORD_SCOPED' => 26,
			'VARIABLE_SYMBOL' => 89,
			'LPAREN' => 119,
			'OP22_LOGICAL_NEG' => 92,
			'CONSTANT_CALL_SCOPED' => 90,
			"undef" => 127,
			'OP05_LOGICAL_NEG' => 96,
			"\@{" => 97
		},
		GOTOS => {
			'ArrayReference' => 115,
			'Literal' => 113,
			'Expression' => 151,
			'Variable' => 155,
			'Operator' => 134,
			'ArrayDereference' => 107,
			'HashReference' => 94,
			'HashDereference' => 93,
			'OpNamedScolonOrSubExp' => 426,
			'SubExpression' => 427,
			'VariableSymbolOrSelf' => 102,
			'WordScoped' => 130
		}
	},
	{#State 407
		ACTIONS => {
			'LITERAL_STRING' => 81,
			'WORD_UPPERCASE' => 153,
			'WORD' => 28,
			"%{" => 116,
			'OP01_OPEN' => 110,
			'OP03_MATH_INC_DEC' => 136,
			'OP05_BITWISE_NEG_LPAREN' => 112,
			'OP10_NAMED_UNARY' => 105,
			'LBRACKET' => 131,
			'LBRACE' => 103,
			'OP05_MATH_NEG_LPAREN' => 109,
			'SELF' => 135,
			'LITERAL_NUMBER' => 80,
			'OP01_NAMED' => 152,
			'OP01_CLOSE' => 101,
			"undef" => 127,
			"\@{" => 97,
			'OP05_LOGICAL_NEG' => 96,
			'VARIABLE_SYMBOL' => 89,
			'LPAREN' => 119,
			'WORD_SCOPED' => 26,
			'OP22_LOGICAL_NEG' => 92,
			'CONSTANT_CALL_SCOPED' => 90
		},
		GOTOS => {
			'ArrayReference' => 115,
			'Expression' => 151,
			'Literal' => 113,
			'HashDereference' => 93,
			'HashReference' => 94,
			'ArrayDereference' => 107,
			'Operator' => 134,
			'Variable' => 155,
			'WordScoped' => 130,
			'VariableSymbolOrSelf' => 102,
			'SubExpression' => 429
		}
	},
	{#State 408
		ACTIONS => {
			'OP21_LIST_COMMA' => 430
		}
	},
	{#State 409
		DEFAULT => -84
	},
	{#State 410
		ACTIONS => {
			'LITERAL_STRING' => -162,
			"%{" => -162,
			'OP19_LOOP_CONTROL' => -162,
			'OP01_OPEN' => -162,
			'OP05_BITWISE_NEG_LPAREN' => -162,
			'LBRACE' => -162,
			"foreach" => -162,
			'OP10_NAMED_UNARY' => -162,
			'OP01_NAMED' => -162,
			'LITERAL_NUMBER' => -162,
			'OP05_MATH_NEG_LPAREN' => -162,
			'OP01_CLOSE' => -162,
			"for" => -162,
			"}" => -162,
			'OP05_LOGICAL_NEG' => -162,
			"\@{" => -162,
			"else" => 433,
			'VARIABLE_SYMBOL' => -162,
			'OP01_PRINT' => -162,
			'CONSTANT_CALL_SCOPED' => -162,
			'OP22_LOGICAL_NEG' => -162,
			'WORD_UPPERCASE' => -162,
			'MY' => -162,
			'WORD' => -162,
			'' => -162,
			'OP03_MATH_INC_DEC' => -162,
			'LBRACKET' => -162,
			"if" => -162,
			'OP01_NAMED_VOID_SCOLON' => -162,
			'SELF' => -162,
			'OP10_NAMED_UNARY_SCOLON' => -162,
			"while" => -162,
			"undef" => -162,
			'OP01_NAMED_VOID_LPAREN' => -162,
			'OP01_NAMED_VOID' => -162,
			"elsif" => 434,
			'OP01_NAMED_SCOLON' => -162,
			'WORD_SCOPED' => -162,
			'LPAREN' => -162,
			'OP19_LOOP_CONTROL_SCOLON' => -162
		},
		GOTOS => {
			'PAREN-40' => 432,
			'OPTIONAL-41' => 435,
			'PAREN-38' => 431
		}
	},
	{#State 411
		ACTIONS => {
			'WORD_SCOPED' => 26,
			'LPAREN' => 119,
			'OP19_LOOP_CONTROL_SCOLON' => 121,
			'OP01_NAMED_SCOLON' => 123,
			'OP01_NAMED_VOID' => 124,
			"while" => -151,
			"undef" => 127,
			'OP01_NAMED_VOID_LPAREN' => 128,
			'OP10_NAMED_UNARY_SCOLON' => 129,
			'OP01_NAMED_VOID_SCOLON' => 132,
			"if" => 133,
			'LBRACKET' => 131,
			'SELF' => 135,
			'OP03_MATH_INC_DEC' => 136,
			'WORD_UPPERCASE' => 137,
			'MY' => 138,
			'WORD' => 28,
			'VARIABLE_SYMBOL' => 89,
			'OP22_LOGICAL_NEG' => 92,
			'CONSTANT_CALL_SCOPED' => 90,
			'OP01_PRINT' => 91,
			'OP05_LOGICAL_NEG' => 96,
			"\@{" => 97,
			"}" => 436,
			"for" => -151,
			'OP01_CLOSE' => 101,
			'LBRACE' => 103,
			'OP10_NAMED_UNARY' => 105,
			"foreach" => -151,
			'OP01_NAMED' => 108,
			'LITERAL_NUMBER' => 80,
			'OP05_MATH_NEG_LPAREN' => 109,
			'OP19_LOOP_CONTROL' => 111,
			'OP01_OPEN' => 110,
			'OP05_BITWISE_NEG_LPAREN' => 112,
			'LITERAL_STRING' => 81,
			"%{" => 116
		},
		GOTOS => {
			'Expression' => 114,
			'Literal' => 113,
			'ArrayReference' => 115,
			'Statement' => 139,
			'VariableSymbolOrSelf' => 102,
			'WordScoped' => 130,
			'ArrayDereference' => 107,
			'OPTIONAL-37' => 104,
			'Operator' => 134,
			'VariableModification' => 125,
			'OperatorVoid' => 95,
			'Operation' => 437,
			'Conditional' => 99,
			'PAREN-36' => 98,
			'LoopLabel' => 120,
			'SubExpression' => 117,
			'VariableDeclaration' => 118,
			'HashReference' => 94,
			'HashDereference' => 93,
			'Variable' => 122
		}
	},
	{#State 412
		DEFAULT => -173
	},
	{#State 413
		ACTIONS => {
			'OP19_VARIABLE_ASSIGN' => 438
		}
	},
	{#State 414
		DEFAULT => -241
	},
	{#State 415
		DEFAULT => -52
	},
	{#State 416
		ACTIONS => {
			'VARIABLE_SYMBOL' => 439
		}
	},
	{#State 417
		ACTIONS => {
			'OP19_LOOP_CONTROL_SCOLON' => -68,
			'WORD_SCOPED' => -68,
			'LPAREN' => -68,
			'OP01_NAMED_SCOLON' => -68,
			'OP01_NAMED_VOID' => -68,
			'OP01_NAMED_VOID_LPAREN' => -68,
			"undef" => -68,
			"while" => -68,
			'OP10_NAMED_UNARY_SCOLON' => -68,
			'SELF' => -68,
			'LBRACKET' => -68,
			"if" => -68,
			'OP01_NAMED_VOID_SCOLON' => -68,
			'LPAREN_MY' => 441,
			'OP03_MATH_INC_DEC' => -68,
			'WORD' => -68,
			'MY' => -68,
			'WORD_UPPERCASE' => -68,
			'OP22_LOGICAL_NEG' => -68,
			'CONSTANT_CALL_SCOPED' => -68,
			'OP01_PRINT' => -68,
			'VARIABLE_SYMBOL' => -68,
			'OP05_LOGICAL_NEG' => -68,
			"\@{" => -68,
			"}" => -68,
			"for" => -68,
			'OP01_CLOSE' => -68,
			'OP01_NAMED' => -68,
			'OP05_MATH_NEG_LPAREN' => -68,
			'LITERAL_NUMBER' => -68,
			'LBRACE' => -68,
			'OP10_NAMED_UNARY' => -68,
			"foreach" => -68,
			'OP05_BITWISE_NEG_LPAREN' => -68,
			'OP19_LOOP_CONTROL' => -68,
			'OP01_OPEN' => -68,
			"%{" => -68,
			'LITERAL_STRING' => -68
		},
		GOTOS => {
			'MethodArguments' => 442,
			'OPTIONAL-27' => 440
		}
	},
	{#State 418
		DEFAULT => -207
	},
	{#State 419
		ACTIONS => {
			'WORD' => 53,
			'TYPE_INTEGER' => 54,
			'WORD_SCOPED' => 56
		},
		GOTOS => {
			'Type' => 443
		}
	},
	{#State 420
		ACTIONS => {
			'OP11_COMPARE_LT_GT' => 185,
			'OP12_COMPARE_EQ_NE' => 184,
			'OP01_CLOSE' => 174,
			'OP08_MATH_ADD_SUB' => 172,
			'OP10_NAMED_UNARY' => 171,
			'OP01_NAMED' => 173,
			'OP19_LOOP_CONTROL' => 177,
			'OP24_LOGICAL_OR_XOR' => 178,
			'OP01_OPEN' => 176,
			'OP23_LOGICAL_AND' => 175,
			'WORD' => 187,
			'OP07_STRING_REPEAT' => 186,
			'OP07_MATH_MULT_DIV_MOD' => 165,
			'OP01_PRINT' => 167,
			'OP19_LOOP_CONTROL_SCOLON' => 182,
			'OP22_LOGICAL_NEG' => 166,
			'OP01_NAMED_VOID' => 183
		},
		GOTOS => {
			'OpStringOrWord' => 369,
			'HashEntryProperties' => 444
		}
	},
	{#State 421
		DEFAULT => -63
	},
	{#State 422
		ACTIONS => {
			";" => 445
		}
	},
	{#State 423
		ACTIONS => {
			")" => 446
		}
	},
	{#State 424
		ACTIONS => {
			")" => 447
		}
	},
	{#State 425
		DEFAULT => -237
	},
	{#State 426
		ACTIONS => {
			'VARIABLE_SYMBOL' => 448
		}
	},
	{#State 427
		ACTIONS => {
			'OP12_COMPARE_EQ_NE' => 225,
			'OP11_COMPARE_LT_GT' => 226,
			'OP15_LOGICAL_AND' => 218,
			'OP08_MATH_ADD_SUB' => 219,
			'OP13_BITWISE_AND' => 217,
			'OP17_LIST_RANGE' => 216,
			";" => 449,
			'OP08_STRING_CAT' => 222,
			'OP04_MATH_POW' => 213,
			'OP16_LOGICAL_OR' => 223,
			'OP24_LOGICAL_OR_XOR' => 214,
			'OP23_LOGICAL_AND' => 215,
			'OP07_STRING_REPEAT' => 224,
			'OP07_MATH_MULT_DIV_MOD' => 210,
			'OP09_BITWISE_SHIFT' => 211,
			'OP14_BITWISE_OR_XOR' => 212,
			'OP18_TERNARY' => 220,
			'OP06_REGEX_MATCH' => 221
		}
	},
	{#State 428
		DEFAULT => -236
	},
	{#State 429
		ACTIONS => {
			'OP06_REGEX_MATCH' => 221,
			'OP18_TERNARY' => 220,
			'OP14_BITWISE_OR_XOR' => 212,
			'OP09_BITWISE_SHIFT' => 211,
			'OP07_MATH_MULT_DIV_MOD' => 210,
			'OP07_STRING_REPEAT' => 224,
			'OP23_LOGICAL_AND' => 215,
			'OP24_LOGICAL_OR_XOR' => 214,
			'OP08_STRING_CAT' => 222,
			'OP16_LOGICAL_OR' => 223,
			'OP04_MATH_POW' => 213,
			'OP08_MATH_ADD_SUB' => 219,
			'OP15_LOGICAL_AND' => 218,
			'OP17_LIST_RANGE' => 450,
			'OP13_BITWISE_AND' => 217,
			'OP11_COMPARE_LT_GT' => 226,
			'OP12_COMPARE_EQ_NE' => 225
		}
	},
	{#State 430
		ACTIONS => {
			'LBRACE' => 103,
			'LBRACKET' => 131,
			'OP10_NAMED_UNARY' => 105,
			'OP01_NAMED' => 152,
			'OP05_MATH_NEG_LPAREN' => 109,
			'SELF' => 135,
			'LITERAL_NUMBER' => 80,
			'OP01_CLOSE' => 101,
			'WORD_UPPERCASE' => 153,
			'LITERAL_STRING' => 81,
			"%{" => 116,
			'WORD' => 28,
			'OP01_OPEN' => 110,
			'OP05_BITWISE_NEG_LPAREN' => 112,
			'OP03_MATH_INC_DEC' => 136,
			'WORD_SCOPED' => 26,
			'VARIABLE_SYMBOL' => 89,
			'LPAREN' => 119,
			'CONSTANT_CALL_SCOPED' => 90,
			'OP22_LOGICAL_NEG' => 92,
			"undef" => 127,
			'OP05_LOGICAL_NEG' => 96,
			"\@{" => 97
		},
		GOTOS => {
			'ArrayDereference' => 107,
			'HashReference' => 94,
			'HashDereference' => 93,
			'Variable' => 155,
			'Operator' => 134,
			'WordScoped' => 130,
			'VariableSymbolOrSelf' => 102,
			'SubExpression' => 451,
			'ArrayReference' => 115,
			'Expression' => 151,
			'Literal' => 113
		}
	},
	{#State 431
		DEFAULT => -158
	},
	{#State 432
		DEFAULT => -161
	},
	{#State 433
		ACTIONS => {
			'LBRACE' => 390
		},
		GOTOS => {
			'CodeBlock' => 452
		}
	},
	{#State 434
		ACTIONS => {
			'LPAREN' => 453
		}
	},
	{#State 435
		DEFAULT => -163
	},
	{#State 436
		DEFAULT => -174
	},
	{#State 437
		DEFAULT => -172
	},
	{#State 438
		ACTIONS => {
			"undef" => 454
		}
	},
	{#State 439
		DEFAULT => -49
	},
	{#State 440
		DEFAULT => -70,
		GOTOS => {
			'STAR-28' => 455
		}
	},
	{#State 441
		ACTIONS => {
			'WORD_SCOPED' => 56,
			'TYPE_INTEGER' => 54,
			'WORD' => 53
		},
		GOTOS => {
			'Type' => 456
		}
	},
	{#State 442
		DEFAULT => -67
	},
	{#State 443
		ACTIONS => {
			"\$TYPED_" => 457
		}
	},
	{#State 444
		DEFAULT => -62
	},
	{#State 445
		DEFAULT => -65
	},
	{#State 446
		ACTIONS => {
			'LBRACE' => 390
		},
		GOTOS => {
			'CodeBlock' => 458
		}
	},
	{#State 447
		ACTIONS => {
			'LBRACE' => 390
		},
		GOTOS => {
			'CodeBlock' => 459
		}
	},
	{#State 448
		ACTIONS => {
			'OP11_COMPARE_LT_GT' => 460
		}
	},
	{#State 449
		DEFAULT => -238
	},
	{#State 450
		ACTIONS => {
			"undef" => 127,
			'OP05_LOGICAL_NEG' => 96,
			"\@{" => 97,
			'WORD_SCOPED' => 26,
			'LPAREN' => 119,
			'VARIABLE_SYMBOL' => 89,
			'OP22_LOGICAL_NEG' => 92,
			'CONSTANT_CALL_SCOPED' => 90,
			'WORD_UPPERCASE' => 153,
			'LITERAL_STRING' => 81,
			'WORD' => 28,
			"%{" => 116,
			'OP01_OPEN' => 110,
			'OP05_BITWISE_NEG_LPAREN' => 112,
			'OP03_MATH_INC_DEC' => 136,
			'LBRACKET' => 131,
			'LBRACE' => 103,
			'OP10_NAMED_UNARY' => 105,
			'OP01_NAMED' => 152,
			'LITERAL_NUMBER' => 80,
			'OP05_MATH_NEG_LPAREN' => 109,
			'SELF' => 135,
			'OP01_CLOSE' => 101
		},
		GOTOS => {
			'ArrayReference' => 115,
			'Literal' => 113,
			'Expression' => 151,
			'ArrayDereference' => 107,
			'HashDereference' => 93,
			'HashReference' => 94,
			'Operator' => 134,
			'Variable' => 155,
			'VariableSymbolOrSelf' => 102,
			'WordScoped' => 130,
			'SubExpression' => 461
		}
	},
	{#State 451
		ACTIONS => {
			'OP24_LOGICAL_OR_XOR' => -85,
			'OP16_LOGICAL_OR' => 223,
			'OP08_STRING_CAT' => 222,
			'OP04_MATH_POW' => 213,
			'OP07_STRING_REPEAT' => 224,
			'OP23_LOGICAL_AND' => -85,
			"]" => -85,
			'OP12_COMPARE_EQ_NE' => 225,
			'OP11_COMPARE_LT_GT' => 226,
			";" => -85,
			")" => -85,
			'OP17_LIST_RANGE' => 216,
			'OP13_BITWISE_AND' => 217,
			'OP08_MATH_ADD_SUB' => 219,
			'OP15_LOGICAL_AND' => 218,
			'OP06_REGEX_MATCH' => 221,
			'OP21_LIST_COMMA' => -85,
			'OP18_TERNARY' => 220,
			"}" => -85,
			'OP09_BITWISE_SHIFT' => 211,
			'OP07_MATH_MULT_DIV_MOD' => 210,
			'OP14_BITWISE_OR_XOR' => 212
		}
	},
	{#State 452
		DEFAULT => -160
	},
	{#State 453
		ACTIONS => {
			"\@{" => 97,
			'OP05_LOGICAL_NEG' => 96,
			"undef" => 127,
			'OP22_LOGICAL_NEG' => 92,
			'CONSTANT_CALL_SCOPED' => 90,
			'VARIABLE_SYMBOL' => 89,
			'LPAREN' => 119,
			'WORD_SCOPED' => 26,
			'OP03_MATH_INC_DEC' => 136,
			'OP05_BITWISE_NEG_LPAREN' => 112,
			'OP01_OPEN' => 110,
			"%{" => 116,
			'WORD' => 28,
			'LITERAL_STRING' => 81,
			'WORD_UPPERCASE' => 153,
			'OP01_CLOSE' => 101,
			'LITERAL_NUMBER' => 80,
			'SELF' => 135,
			'OP05_MATH_NEG_LPAREN' => 109,
			'OP01_NAMED' => 152,
			'OP10_NAMED_UNARY' => 105,
			'LBRACKET' => 131,
			'LBRACE' => 103
		},
		GOTOS => {
			'Operator' => 134,
			'Variable' => 155,
			'ArrayDereference' => 107,
			'HashDereference' => 93,
			'HashReference' => 94,
			'SubExpression' => 462,
			'VariableSymbolOrSelf' => 102,
			'WordScoped' => 130,
			'ArrayReference' => 115,
			'Expression' => 151,
			'Literal' => 113
		}
	},
	{#State 454
		ACTIONS => {
			";" => 463
		}
	},
	{#State 455
		ACTIONS => {
			'OP01_NAMED_SCOLON' => 123,
			'OP19_LOOP_CONTROL_SCOLON' => 121,
			'LPAREN' => 119,
			'WORD_SCOPED' => 26,
			'OP01_NAMED_VOID_LPAREN' => 128,
			"while" => -151,
			"undef" => 127,
			'OP01_NAMED_VOID' => 124,
			'SELF' => 135,
			'LBRACKET' => 131,
			'OP01_NAMED_VOID_SCOLON' => 132,
			"if" => 133,
			'OP10_NAMED_UNARY_SCOLON' => 129,
			'WORD' => 28,
			'WORD_UPPERCASE' => 137,
			'MY' => 138,
			'OP03_MATH_INC_DEC' => 136,
			'OP01_PRINT' => 91,
			'OP22_LOGICAL_NEG' => 92,
			'CONSTANT_CALL_SCOPED' => 90,
			'VARIABLE_SYMBOL' => 89,
			"for" => -151,
			"}" => 465,
			"\@{" => 97,
			'OP05_LOGICAL_NEG' => 96,
			'OP05_MATH_NEG_LPAREN' => 109,
			'LITERAL_NUMBER' => 80,
			'OP01_NAMED' => 108,
			"foreach" => -151,
			'OP10_NAMED_UNARY' => 105,
			'LBRACE' => 103,
			'OP01_CLOSE' => 101,
			"%{" => 116,
			'LITERAL_STRING' => 81,
			'OP05_BITWISE_NEG_LPAREN' => 112,
			'OP01_OPEN' => 110,
			'OP19_LOOP_CONTROL' => 111
		},
		GOTOS => {
			'VariableModification' => 125,
			'OperatorVoid' => 95,
			'Operation' => 464,
			'Conditional' => 99,
			'PAREN-36' => 98,
			'LoopLabel' => 120,
			'VariableDeclaration' => 118,
			'SubExpression' => 117,
			'HashReference' => 94,
			'HashDereference' => 93,
			'Variable' => 122,
			'Literal' => 113,
			'Expression' => 114,
			'ArrayReference' => 115,
			'Statement' => 139,
			'WordScoped' => 130,
			'VariableSymbolOrSelf' => 102,
			'ArrayDereference' => 107,
			'OPTIONAL-37' => 104,
			'Operator' => 134
		}
	},
	{#State 456
		ACTIONS => {
			'SELF' => 466
		}
	},
	{#State 457
		ACTIONS => {
			'OP22_LOGICAL_NEG' => 166,
			'OP19_LOOP_CONTROL_SCOLON' => 182,
			'OP01_PRINT' => 167,
			'OP07_MATH_MULT_DIV_MOD' => 165,
			'OP01_NAMED_VOID' => 183,
			'OP01_NAMED' => 173,
			'OP08_MATH_ADD_SUB' => 172,
			'OP10_NAMED_UNARY' => 171,
			'OP01_CLOSE' => 174,
			'OP12_COMPARE_EQ_NE' => 184,
			'OP11_COMPARE_LT_GT' => 185,
			'OP23_LOGICAL_AND' => 175,
			'WORD' => 187,
			'OP07_STRING_REPEAT' => 186,
			'OP19_LOOP_CONTROL' => 177,
			'OP24_LOGICAL_OR_XOR' => 178,
			'OP01_OPEN' => 176
		},
		GOTOS => {
			'OpStringOrWord' => 467
		}
	},
	{#State 458
		DEFAULT => -171
	},
	{#State 459
		DEFAULT => -169
	},
	{#State 460
		ACTIONS => {
			'OP05_MATH_NEG_LPAREN' => 109,
			'SELF' => 135,
			'LITERAL_NUMBER' => 80,
			'OP01_NAMED' => 152,
			'OP10_NAMED_UNARY' => 105,
			'LBRACKET' => 131,
			'LBRACE' => 103,
			'OP01_CLOSE' => 101,
			'OP10_NAMED_UNARY_SCOLON' => 425,
			'WORD' => 28,
			"%{" => 116,
			'LITERAL_STRING' => 81,
			'WORD_UPPERCASE' => 153,
			'OP03_MATH_INC_DEC' => 136,
			'OP05_BITWISE_NEG_LPAREN' => 112,
			'OP01_OPEN' => 110,
			'OP01_NAMED_SCOLON' => 428,
			'OP22_LOGICAL_NEG' => 92,
			'CONSTANT_CALL_SCOPED' => 90,
			'VARIABLE_SYMBOL' => 89,
			'LPAREN' => 119,
			'WORD_SCOPED' => 26,
			"undef" => 127,
			"\@{" => 97,
			'OP05_LOGICAL_NEG' => 96
		},
		GOTOS => {
			'ArrayReference' => 115,
			'Expression' => 151,
			'Literal' => 113,
			'Variable' => 155,
			'Operator' => 134,
			'HashDereference' => 93,
			'HashReference' => 94,
			'ArrayDereference' => 107,
			'SubExpression' => 427,
			'OpNamedScolonOrSubExp' => 468,
			'VariableSymbolOrSelf' => 102,
			'WordScoped' => 130
		}
	},
	{#State 461
		ACTIONS => {
			'OP06_REGEX_MATCH' => 221,
			'OP18_TERNARY' => -107,
			'OP07_MATH_MULT_DIV_MOD' => 210,
			'OP09_BITWISE_SHIFT' => 211,
			'OP14_BITWISE_OR_XOR' => 212,
			'OP24_LOGICAL_OR_XOR' => -107,
			'OP08_STRING_CAT' => 222,
			'OP16_LOGICAL_OR' => 223,
			'OP04_MATH_POW' => 213,
			'OP07_STRING_REPEAT' => 224,
			'OP23_LOGICAL_AND' => -107,
			'OP11_COMPARE_LT_GT' => 226,
			'OP12_COMPARE_EQ_NE' => 225,
			'OP17_LIST_RANGE' => undef,
			")" => 469,
			'OP13_BITWISE_AND' => 217,
			'OP08_MATH_ADD_SUB' => 219,
			'OP15_LOGICAL_AND' => 218
		}
	},
	{#State 462
		ACTIONS => {
			'OP09_BITWISE_SHIFT' => 211,
			'OP07_MATH_MULT_DIV_MOD' => 210,
			'OP14_BITWISE_OR_XOR' => 212,
			'OP18_TERNARY' => 220,
			'OP06_REGEX_MATCH' => 221,
			'OP11_COMPARE_LT_GT' => 226,
			'OP12_COMPARE_EQ_NE' => 225,
			")" => 470,
			'OP17_LIST_RANGE' => 216,
			'OP13_BITWISE_AND' => 217,
			'OP15_LOGICAL_AND' => 218,
			'OP08_MATH_ADD_SUB' => 219,
			'OP04_MATH_POW' => 213,
			'OP16_LOGICAL_OR' => 223,
			'OP08_STRING_CAT' => 222,
			'OP24_LOGICAL_OR_XOR' => 214,
			'OP23_LOGICAL_AND' => 215,
			'OP07_STRING_REPEAT' => 224
		}
	},
	{#State 463
		DEFAULT => -183
	},
	{#State 464
		DEFAULT => -69
	},
	{#State 465
		ACTIONS => {
			";" => 471
		}
	},
	{#State 466
		DEFAULT => -74,
		GOTOS => {
			'STAR-30' => 472
		}
	},
	{#State 467
		ACTIONS => {
			'OP19_VARIABLE_ASSIGN' => 473,
			'OP02_ARRAY_THINARROW' => 474
		}
	},
	{#State 468
		ACTIONS => {
			'LBRACE' => 103,
			'LBRACKET' => 131,
			'OP10_NAMED_UNARY' => 105,
			'OP01_NAMED' => 152,
			'SELF' => 135,
			'OP05_MATH_NEG_LPAREN' => 109,
			'LITERAL_NUMBER' => 80,
			'OP01_CLOSE' => 101,
			'WORD_UPPERCASE' => 153,
			'LITERAL_STRING' => 81,
			'WORD' => 28,
			"%{" => 116,
			'OP01_OPEN' => 110,
			'OP05_BITWISE_NEG_LPAREN' => 112,
			'OP03_MATH_INC_DEC' => 136,
			'WORD_SCOPED' => 26,
			'LPAREN' => 119,
			'VARIABLE_SYMBOL' => 89,
			'CONSTANT_CALL_SCOPED' => 90,
			'OP22_LOGICAL_NEG' => 92,
			"undef" => 127,
			'OP05_LOGICAL_NEG' => 96,
			"\@{" => 97
		},
		GOTOS => {
			'ArrayReference' => 115,
			'Literal' => 113,
			'Expression' => 151,
			'VariableModification' => 475,
			'Variable' => 122,
			'Operator' => 134,
			'ArrayDereference' => 107,
			'HashDereference' => 93,
			'HashReference' => 94,
			'SubExpressionOrVarMod' => 477,
			'SubExpression' => 476,
			'VariableSymbolOrSelf' => 102,
			'WordScoped' => 130
		}
	},
	{#State 469
		ACTIONS => {
			'LBRACE' => 390
		},
		GOTOS => {
			'CodeBlock' => 478
		}
	},
	{#State 470
		ACTIONS => {
			'LBRACE' => 390
		},
		GOTOS => {
			'CodeBlock' => 479
		}
	},
	{#State 471
		DEFAULT => -71
	},
	{#State 472
		ACTIONS => {
			'OP21_LIST_COMMA' => 480,
			")" => 481
		},
		GOTOS => {
			'PAREN-29' => 482
		}
	},
	{#State 473
		ACTIONS => {
			"undef" => 127,
			'OP05_LOGICAL_NEG' => 96,
			"\@{" => 97,
			'WORD_SCOPED' => 26,
			'LPAREN' => 119,
			'VARIABLE_SYMBOL' => 89,
			'OP22_LOGICAL_NEG' => 92,
			'CONSTANT_CALL_SCOPED' => 90,
			'WORD_UPPERCASE' => 153,
			'LITERAL_STRING' => 81,
			'WORD' => 28,
			"%{" => 116,
			'OP01_OPEN' => 110,
			'OP05_BITWISE_NEG_LPAREN' => 112,
			'OP03_MATH_INC_DEC' => 136,
			'LBRACE' => 103,
			'LBRACKET' => 131,
			'OP10_NAMED_UNARY' => 105,
			'OP01_NAMED' => 152,
			'SELF' => 135,
			'OP05_MATH_NEG_LPAREN' => 109,
			'LITERAL_NUMBER' => 80,
			'OP01_CLOSE' => 101
		},
		GOTOS => {
			'ArrayReference' => 115,
			'Expression' => 151,
			'Literal' => 113,
			'HashDereference' => 93,
			'HashReference' => 94,
			'ArrayDereference' => 107,
			'Operator' => 134,
			'Variable' => 155,
			'VariableSymbolOrSelf' => 102,
			'WordScoped' => 130,
			'SubExpression' => 483
		}
	},
	{#State 474
		ACTIONS => {
			'OP05_LOGICAL_NEG' => 96,
			"\@{" => 97,
			"undef" => 127,
			'WORD_SCOPED' => 26,
			'VARIABLE_SYMBOL' => 89,
			'LPAREN' => 119,
			'CONSTANT_CALL_SCOPED' => 90,
			'OP22_LOGICAL_NEG' => 92,
			'OP01_OPEN' => 110,
			'OP05_BITWISE_NEG_LPAREN' => 112,
			'OP03_MATH_INC_DEC' => 136,
			'WORD_UPPERCASE' => 153,
			'LITERAL_STRING' => 81,
			'WORD' => 28,
			"%{" => 116,
			'OP01_CLOSE' => 101,
			'LBRACKET' => 131,
			'LBRACE' => 103,
			'OP10_NAMED_UNARY' => 105,
			'OP01_NAMED' => 152,
			'OP05_MATH_NEG_LPAREN' => 109,
			'LITERAL_NUMBER' => 80,
			'SELF' => 135
		},
		GOTOS => {
			'ArrayDereference' => 107,
			'HashReference' => 94,
			'HashDereference' => 93,
			'Operator' => 134,
			'Variable' => 155,
			'VariableSymbolOrSelf' => 102,
			'WordScoped' => 130,
			'SubExpression' => 484,
			'ArrayReference' => 115,
			'Literal' => 113,
			'Expression' => 151
		}
	},
	{#State 475
		DEFAULT => -148
	},
	{#State 476
		ACTIONS => {
			'OP06_REGEX_MATCH' => 221,
			'OP18_TERNARY' => 220,
			'OP07_MATH_MULT_DIV_MOD' => 210,
			'OP09_BITWISE_SHIFT' => 211,
			'OP14_BITWISE_OR_XOR' => 212,
			'OP24_LOGICAL_OR_XOR' => 214,
			'OP04_MATH_POW' => 213,
			'OP16_LOGICAL_OR' => 223,
			'OP08_STRING_CAT' => 222,
			'OP07_STRING_REPEAT' => 224,
			'OP23_LOGICAL_AND' => 215,
			'OP12_COMPARE_EQ_NE' => 225,
			'OP11_COMPARE_LT_GT' => 226,
			")" => -147,
			'OP17_LIST_RANGE' => 216,
			'OP13_BITWISE_AND' => 217,
			'OP08_MATH_ADD_SUB' => 219,
			'OP15_LOGICAL_AND' => 218
		}
	},
	{#State 477
		ACTIONS => {
			")" => 485
		}
	},
	{#State 478
		DEFAULT => -167
	},
	{#State 479
		DEFAULT => -157
	},
	{#State 480
		ACTIONS => {
			'MY' => 486
		}
	},
	{#State 481
		ACTIONS => {
			'OP19_VARIABLE_ASSIGN' => 487
		}
	},
	{#State 482
		DEFAULT => -73
	},
	{#State 483
		ACTIONS => {
			'OP06_REGEX_MATCH' => 221,
			'OP21_LIST_COMMA' => -224,
			'OP18_TERNARY' => 220,
			"}" => -224,
			'OP09_BITWISE_SHIFT' => 211,
			'OP07_MATH_MULT_DIV_MOD' => 210,
			'OP14_BITWISE_OR_XOR' => 212,
			'OP24_LOGICAL_OR_XOR' => 214,
			'OP16_LOGICAL_OR' => 223,
			'OP04_MATH_POW' => 213,
			'OP08_STRING_CAT' => 222,
			'OP07_STRING_REPEAT' => 224,
			'OP23_LOGICAL_AND' => 215,
			'OP11_COMPARE_LT_GT' => 226,
			'OP12_COMPARE_EQ_NE' => 225,
			'OP08_MATH_ADD_SUB' => 219,
			'OP15_LOGICAL_AND' => 218,
			'OP13_BITWISE_AND' => 217,
			'OP17_LIST_RANGE' => 216
		}
	},
	{#State 484
		ACTIONS => {
			'OP12_COMPARE_EQ_NE' => 225,
			'OP11_COMPARE_LT_GT' => 226,
			'OP17_LIST_RANGE' => 216,
			'OP13_BITWISE_AND' => 217,
			'OP15_LOGICAL_AND' => 218,
			'OP08_MATH_ADD_SUB' => 219,
			'OP04_MATH_POW' => 213,
			'OP08_STRING_CAT' => 222,
			'OP16_LOGICAL_OR' => 223,
			'OP24_LOGICAL_OR_XOR' => 214,
			'OP23_LOGICAL_AND' => 215,
			'OP07_STRING_REPEAT' => 224,
			"]" => 488,
			'OP09_BITWISE_SHIFT' => 211,
			'OP07_MATH_MULT_DIV_MOD' => 210,
			'OP14_BITWISE_OR_XOR' => 212,
			'OP18_TERNARY' => 220,
			'OP06_REGEX_MATCH' => 221
		}
	},
	{#State 485
		ACTIONS => {
			'LBRACE' => 390
		},
		GOTOS => {
			'CodeBlock' => 489
		}
	},
	{#State 486
		ACTIONS => {
			'WORD_SCOPED' => 56,
			'TYPE_INTEGER' => 54,
			'WORD' => 53
		},
		GOTOS => {
			'Type' => 490
		}
	},
	{#State 487
		ACTIONS => {
			"\@ARG;" => 491
		}
	},
	{#State 488
		ACTIONS => {
			'OP19_VARIABLE_ASSIGN' => 492
		}
	},
	{#State 489
		DEFAULT => -168
	},
	{#State 490
		ACTIONS => {
			'VARIABLE_SYMBOL' => 493
		}
	},
	{#State 491
		DEFAULT => -75
	},
	{#State 492
		ACTIONS => {
			"undef" => 494
		}
	},
	{#State 493
		DEFAULT => -72
	},
	{#State 494
		DEFAULT => -225
	}
],
    yyrules  =>
[
	[#Rule _SUPERSTART
		 '$start', 2, undef
#line 6989 lib/RPerl/GrammarMedium.pm
	],
	[#Rule _PAREN
		 'PAREN-1', 2,
sub {
#line 174 "lib/RPerl/GrammarMedium.eyp"
 goto &Parse::Eyapp::Driver::YYActionforParenthesis}
#line 6996 lib/RPerl/GrammarMedium.pm
	],
	[#Rule _PLUS_LIST
		 'PLUS-2', 2,
sub {
#line 174 "lib/RPerl/GrammarMedium.eyp"
 goto &Parse::Eyapp::Driver::YYActionforT_TX1X2 }
#line 7003 lib/RPerl/GrammarMedium.pm
	],
	[#Rule _PLUS_LIST
		 'PLUS-2', 1,
sub {
#line 174 "lib/RPerl/GrammarMedium.eyp"
 goto &Parse::Eyapp::Driver::YYActionforT_single }
#line 7010 lib/RPerl/GrammarMedium.pm
	],
	[#Rule CompileUnit_4
		 'CompileUnit', 1,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 7021 lib/RPerl/GrammarMedium.pm
	],
	[#Rule CompileUnit_5
		 'CompileUnit', 1,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 7032 lib/RPerl/GrammarMedium.pm
	],
	[#Rule _OPTIONAL
		 'OPTIONAL-3', 1,
sub {
#line 175 "lib/RPerl/GrammarMedium.eyp"
 goto &Parse::Eyapp::Driver::YYActionforT_single }
#line 7039 lib/RPerl/GrammarMedium.pm
	],
	[#Rule _OPTIONAL
		 'OPTIONAL-3', 0,
sub {
#line 175 "lib/RPerl/GrammarMedium.eyp"
 goto &Parse::Eyapp::Driver::YYActionforT_empty }
#line 7046 lib/RPerl/GrammarMedium.pm
	],
	[#Rule _STAR_LIST
		 'STAR-4', 2,
sub {
#line 175 "lib/RPerl/GrammarMedium.eyp"
 goto &Parse::Eyapp::Driver::YYActionforT_TX1X2 }
#line 7053 lib/RPerl/GrammarMedium.pm
	],
	[#Rule _STAR_LIST
		 'STAR-4', 0,
sub {
#line 175 "lib/RPerl/GrammarMedium.eyp"
 goto &Parse::Eyapp::Driver::YYActionforT_empty }
#line 7060 lib/RPerl/GrammarMedium.pm
	],
	[#Rule _STAR_LIST
		 'STAR-5', 2,
sub {
#line 175 "lib/RPerl/GrammarMedium.eyp"
 goto &Parse::Eyapp::Driver::YYActionforT_TX1X2 }
#line 7067 lib/RPerl/GrammarMedium.pm
	],
	[#Rule _STAR_LIST
		 'STAR-5', 0,
sub {
#line 175 "lib/RPerl/GrammarMedium.eyp"
 goto &Parse::Eyapp::Driver::YYActionforT_empty }
#line 7074 lib/RPerl/GrammarMedium.pm
	],
	[#Rule _STAR_LIST
		 'STAR-6', 2,
sub {
#line 175 "lib/RPerl/GrammarMedium.eyp"
 goto &Parse::Eyapp::Driver::YYActionforT_TX1X2 }
#line 7081 lib/RPerl/GrammarMedium.pm
	],
	[#Rule _STAR_LIST
		 'STAR-6', 0,
sub {
#line 175 "lib/RPerl/GrammarMedium.eyp"
 goto &Parse::Eyapp::Driver::YYActionforT_empty }
#line 7088 lib/RPerl/GrammarMedium.pm
	],
	[#Rule _STAR_LIST
		 'STAR-7', 2,
sub {
#line 175 "lib/RPerl/GrammarMedium.eyp"
 goto &Parse::Eyapp::Driver::YYActionforT_TX1X2 }
#line 7095 lib/RPerl/GrammarMedium.pm
	],
	[#Rule _STAR_LIST
		 'STAR-7', 0,
sub {
#line 175 "lib/RPerl/GrammarMedium.eyp"
 goto &Parse::Eyapp::Driver::YYActionforT_empty }
#line 7102 lib/RPerl/GrammarMedium.pm
	],
	[#Rule _PLUS_LIST
		 'PLUS-8', 2,
sub {
#line 175 "lib/RPerl/GrammarMedium.eyp"
 goto &Parse::Eyapp::Driver::YYActionforT_TX1X2 }
#line 7109 lib/RPerl/GrammarMedium.pm
	],
	[#Rule _PLUS_LIST
		 'PLUS-8', 1,
sub {
#line 175 "lib/RPerl/GrammarMedium.eyp"
 goto &Parse::Eyapp::Driver::YYActionforT_single }
#line 7116 lib/RPerl/GrammarMedium.pm
	],
	[#Rule Program_18
		 'Program', 9,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 7127 lib/RPerl/GrammarMedium.pm
	],
	[#Rule _OPTIONAL
		 'OPTIONAL-9', 1,
sub {
#line 176 "lib/RPerl/GrammarMedium.eyp"
 goto &Parse::Eyapp::Driver::YYActionforT_single }
#line 7134 lib/RPerl/GrammarMedium.pm
	],
	[#Rule _OPTIONAL
		 'OPTIONAL-9', 0,
sub {
#line 176 "lib/RPerl/GrammarMedium.eyp"
 goto &Parse::Eyapp::Driver::YYActionforT_empty }
#line 7141 lib/RPerl/GrammarMedium.pm
	],
	[#Rule _OPTIONAL
		 'OPTIONAL-10', 1,
sub {
#line 176 "lib/RPerl/GrammarMedium.eyp"
 goto &Parse::Eyapp::Driver::YYActionforT_single }
#line 7148 lib/RPerl/GrammarMedium.pm
	],
	[#Rule _OPTIONAL
		 'OPTIONAL-10', 0,
sub {
#line 176 "lib/RPerl/GrammarMedium.eyp"
 goto &Parse::Eyapp::Driver::YYActionforT_empty }
#line 7155 lib/RPerl/GrammarMedium.pm
	],
	[#Rule ModuleHeader_23
		 'ModuleHeader', 6,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 7166 lib/RPerl/GrammarMedium.pm
	],
	[#Rule Module_24
		 'Module', 1,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 7177 lib/RPerl/GrammarMedium.pm
	],
	[#Rule Module_25
		 'Module', 1,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 7188 lib/RPerl/GrammarMedium.pm
	],
	[#Rule _STAR_LIST
		 'STAR-11', 2,
sub {
#line 178 "lib/RPerl/GrammarMedium.eyp"
 goto &Parse::Eyapp::Driver::YYActionforT_TX1X2 }
#line 7195 lib/RPerl/GrammarMedium.pm
	],
	[#Rule _STAR_LIST
		 'STAR-11', 0,
sub {
#line 178 "lib/RPerl/GrammarMedium.eyp"
 goto &Parse::Eyapp::Driver::YYActionforT_empty }
#line 7202 lib/RPerl/GrammarMedium.pm
	],
	[#Rule _STAR_LIST
		 'STAR-12', 2,
sub {
#line 178 "lib/RPerl/GrammarMedium.eyp"
 goto &Parse::Eyapp::Driver::YYActionforT_TX1X2 }
#line 7209 lib/RPerl/GrammarMedium.pm
	],
	[#Rule _STAR_LIST
		 'STAR-12', 0,
sub {
#line 178 "lib/RPerl/GrammarMedium.eyp"
 goto &Parse::Eyapp::Driver::YYActionforT_empty }
#line 7216 lib/RPerl/GrammarMedium.pm
	],
	[#Rule _STAR_LIST
		 'STAR-13', 2,
sub {
#line 178 "lib/RPerl/GrammarMedium.eyp"
 goto &Parse::Eyapp::Driver::YYActionforT_TX1X2 }
#line 7223 lib/RPerl/GrammarMedium.pm
	],
	[#Rule _STAR_LIST
		 'STAR-13', 0,
sub {
#line 178 "lib/RPerl/GrammarMedium.eyp"
 goto &Parse::Eyapp::Driver::YYActionforT_empty }
#line 7230 lib/RPerl/GrammarMedium.pm
	],
	[#Rule _PLUS_LIST
		 'PLUS-14', 2,
sub {
#line 178 "lib/RPerl/GrammarMedium.eyp"
 goto &Parse::Eyapp::Driver::YYActionforT_TX1X2 }
#line 7237 lib/RPerl/GrammarMedium.pm
	],
	[#Rule _PLUS_LIST
		 'PLUS-14', 1,
sub {
#line 178 "lib/RPerl/GrammarMedium.eyp"
 goto &Parse::Eyapp::Driver::YYActionforT_single }
#line 7244 lib/RPerl/GrammarMedium.pm
	],
	[#Rule Package_34
		 'Package', 6,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 7255 lib/RPerl/GrammarMedium.pm
	],
	[#Rule _OPTIONAL
		 'OPTIONAL-15', 1,
sub {
#line 179 "lib/RPerl/GrammarMedium.eyp"
 goto &Parse::Eyapp::Driver::YYActionforT_single }
#line 7262 lib/RPerl/GrammarMedium.pm
	],
	[#Rule _OPTIONAL
		 'OPTIONAL-15', 0,
sub {
#line 179 "lib/RPerl/GrammarMedium.eyp"
 goto &Parse::Eyapp::Driver::YYActionforT_empty }
#line 7269 lib/RPerl/GrammarMedium.pm
	],
	[#Rule Header_37
		 'Header', 5,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 7280 lib/RPerl/GrammarMedium.pm
	],
	[#Rule _PLUS_LIST
		 'PLUS-16', 2,
sub {
#line 180 "lib/RPerl/GrammarMedium.eyp"
 goto &Parse::Eyapp::Driver::YYActionforT_TX1X2 }
#line 7287 lib/RPerl/GrammarMedium.pm
	],
	[#Rule _PLUS_LIST
		 'PLUS-16', 1,
sub {
#line 180 "lib/RPerl/GrammarMedium.eyp"
 goto &Parse::Eyapp::Driver::YYActionforT_single }
#line 7294 lib/RPerl/GrammarMedium.pm
	],
	[#Rule Critic_40
		 'Critic', 3,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 7305 lib/RPerl/GrammarMedium.pm
	],
	[#Rule Include_41
		 'Include', 3,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 7316 lib/RPerl/GrammarMedium.pm
	],
	[#Rule Include_42
		 'Include', 4,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 7327 lib/RPerl/GrammarMedium.pm
	],
	[#Rule Constant_43
		 'Constant', 6,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 7338 lib/RPerl/GrammarMedium.pm
	],
	[#Rule _OPTIONAL
		 'OPTIONAL-17', 1,
sub {
#line 186 "lib/RPerl/GrammarMedium.eyp"
 goto &Parse::Eyapp::Driver::YYActionforT_single }
#line 7345 lib/RPerl/GrammarMedium.pm
	],
	[#Rule _OPTIONAL
		 'OPTIONAL-17', 0,
sub {
#line 186 "lib/RPerl/GrammarMedium.eyp"
 goto &Parse::Eyapp::Driver::YYActionforT_empty }
#line 7352 lib/RPerl/GrammarMedium.pm
	],
	[#Rule _STAR_LIST
		 'STAR-18', 2,
sub {
#line 186 "lib/RPerl/GrammarMedium.eyp"
 goto &Parse::Eyapp::Driver::YYActionforT_TX1X2 }
#line 7359 lib/RPerl/GrammarMedium.pm
	],
	[#Rule _STAR_LIST
		 'STAR-18', 0,
sub {
#line 186 "lib/RPerl/GrammarMedium.eyp"
 goto &Parse::Eyapp::Driver::YYActionforT_empty }
#line 7366 lib/RPerl/GrammarMedium.pm
	],
	[#Rule Subroutine_48
		 'Subroutine', 8,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 7377 lib/RPerl/GrammarMedium.pm
	],
	[#Rule _PAREN
		 'PAREN-19', 4,
sub {
#line 187 "lib/RPerl/GrammarMedium.eyp"
 goto &Parse::Eyapp::Driver::YYActionforParenthesis}
#line 7384 lib/RPerl/GrammarMedium.pm
	],
	[#Rule _STAR_LIST
		 'STAR-20', 2,
sub {
#line 187 "lib/RPerl/GrammarMedium.eyp"
 goto &Parse::Eyapp::Driver::YYActionforT_TX1X2 }
#line 7391 lib/RPerl/GrammarMedium.pm
	],
	[#Rule _STAR_LIST
		 'STAR-20', 0,
sub {
#line 187 "lib/RPerl/GrammarMedium.eyp"
 goto &Parse::Eyapp::Driver::YYActionforT_empty }
#line 7398 lib/RPerl/GrammarMedium.pm
	],
	[#Rule SubroutineArguments_52
		 'SubroutineArguments', 7,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 7409 lib/RPerl/GrammarMedium.pm
	],
	[#Rule _STAR_LIST
		 'STAR-21', 2,
sub {
#line 188 "lib/RPerl/GrammarMedium.eyp"
 goto &Parse::Eyapp::Driver::YYActionforT_TX1X2 }
#line 7416 lib/RPerl/GrammarMedium.pm
	],
	[#Rule _STAR_LIST
		 'STAR-21', 0,
sub {
#line 188 "lib/RPerl/GrammarMedium.eyp"
 goto &Parse::Eyapp::Driver::YYActionforT_empty }
#line 7423 lib/RPerl/GrammarMedium.pm
	],
	[#Rule _STAR_LIST
		 'STAR-22', 2,
sub {
#line 188 "lib/RPerl/GrammarMedium.eyp"
 goto &Parse::Eyapp::Driver::YYActionforT_TX1X2 }
#line 7430 lib/RPerl/GrammarMedium.pm
	],
	[#Rule _STAR_LIST
		 'STAR-22', 0,
sub {
#line 188 "lib/RPerl/GrammarMedium.eyp"
 goto &Parse::Eyapp::Driver::YYActionforT_empty }
#line 7437 lib/RPerl/GrammarMedium.pm
	],
	[#Rule _STAR_LIST
		 'STAR-23', 2,
sub {
#line 188 "lib/RPerl/GrammarMedium.eyp"
 goto &Parse::Eyapp::Driver::YYActionforT_TX1X2 }
#line 7444 lib/RPerl/GrammarMedium.pm
	],
	[#Rule _STAR_LIST
		 'STAR-23', 0,
sub {
#line 188 "lib/RPerl/GrammarMedium.eyp"
 goto &Parse::Eyapp::Driver::YYActionforT_empty }
#line 7451 lib/RPerl/GrammarMedium.pm
	],
	[#Rule _STAR_LIST
		 'STAR-24', 2,
sub {
#line 188 "lib/RPerl/GrammarMedium.eyp"
 goto &Parse::Eyapp::Driver::YYActionforT_TX1X2 }
#line 7458 lib/RPerl/GrammarMedium.pm
	],
	[#Rule _STAR_LIST
		 'STAR-24', 0,
sub {
#line 188 "lib/RPerl/GrammarMedium.eyp"
 goto &Parse::Eyapp::Driver::YYActionforT_empty }
#line 7465 lib/RPerl/GrammarMedium.pm
	],
	[#Rule Class_61
		 'Class', 12,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 7476 lib/RPerl/GrammarMedium.pm
	],
	[#Rule _PAREN
		 'PAREN-25', 2,
sub {
#line 189 "lib/RPerl/GrammarMedium.eyp"
 goto &Parse::Eyapp::Driver::YYActionforParenthesis}
#line 7483 lib/RPerl/GrammarMedium.pm
	],
	[#Rule _STAR_LIST
		 'STAR-26', 2,
sub {
#line 189 "lib/RPerl/GrammarMedium.eyp"
 goto &Parse::Eyapp::Driver::YYActionforT_TX1X2 }
#line 7490 lib/RPerl/GrammarMedium.pm
	],
	[#Rule _STAR_LIST
		 'STAR-26', 0,
sub {
#line 189 "lib/RPerl/GrammarMedium.eyp"
 goto &Parse::Eyapp::Driver::YYActionforT_empty }
#line 7497 lib/RPerl/GrammarMedium.pm
	],
	[#Rule Properties_65
		 'Properties', 7,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 7508 lib/RPerl/GrammarMedium.pm
	],
	[#Rule Properties_66
		 'Properties', 5,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 7519 lib/RPerl/GrammarMedium.pm
	],
	[#Rule _OPTIONAL
		 'OPTIONAL-27', 1,
sub {
#line 191 "lib/RPerl/GrammarMedium.eyp"
 goto &Parse::Eyapp::Driver::YYActionforT_single }
#line 7526 lib/RPerl/GrammarMedium.pm
	],
	[#Rule _OPTIONAL
		 'OPTIONAL-27', 0,
sub {
#line 191 "lib/RPerl/GrammarMedium.eyp"
 goto &Parse::Eyapp::Driver::YYActionforT_empty }
#line 7533 lib/RPerl/GrammarMedium.pm
	],
	[#Rule _STAR_LIST
		 'STAR-28', 2,
sub {
#line 191 "lib/RPerl/GrammarMedium.eyp"
 goto &Parse::Eyapp::Driver::YYActionforT_TX1X2 }
#line 7540 lib/RPerl/GrammarMedium.pm
	],
	[#Rule _STAR_LIST
		 'STAR-28', 0,
sub {
#line 191 "lib/RPerl/GrammarMedium.eyp"
 goto &Parse::Eyapp::Driver::YYActionforT_empty }
#line 7547 lib/RPerl/GrammarMedium.pm
	],
	[#Rule Method_71
		 'Method', 8,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 7558 lib/RPerl/GrammarMedium.pm
	],
	[#Rule _PAREN
		 'PAREN-29', 4,
sub {
#line 192 "lib/RPerl/GrammarMedium.eyp"
 goto &Parse::Eyapp::Driver::YYActionforParenthesis}
#line 7565 lib/RPerl/GrammarMedium.pm
	],
	[#Rule _STAR_LIST
		 'STAR-30', 2,
sub {
#line 192 "lib/RPerl/GrammarMedium.eyp"
 goto &Parse::Eyapp::Driver::YYActionforT_TX1X2 }
#line 7572 lib/RPerl/GrammarMedium.pm
	],
	[#Rule _STAR_LIST
		 'STAR-30', 0,
sub {
#line 192 "lib/RPerl/GrammarMedium.eyp"
 goto &Parse::Eyapp::Driver::YYActionforT_empty }
#line 7579 lib/RPerl/GrammarMedium.pm
	],
	[#Rule MethodArguments_75
		 'MethodArguments', 7,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 7590 lib/RPerl/GrammarMedium.pm
	],
	[#Rule SubroutineOrMethod_76
		 'SubroutineOrMethod', 1,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 7601 lib/RPerl/GrammarMedium.pm
	],
	[#Rule SubroutineOrMethod_77
		 'SubroutineOrMethod', 1,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 7612 lib/RPerl/GrammarMedium.pm
	],
	[#Rule Operation_78
		 'Operation', 2,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 7623 lib/RPerl/GrammarMedium.pm
	],
	[#Rule Operation_79
		 'Operation', 1,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 7634 lib/RPerl/GrammarMedium.pm
	],
	[#Rule Operation_80
		 'Operation', 1,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 7645 lib/RPerl/GrammarMedium.pm
	],
	[#Rule Operation_81
		 'Operation', 1,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 7656 lib/RPerl/GrammarMedium.pm
	],
	[#Rule Operator_82
		 'Operator', 5,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 7667 lib/RPerl/GrammarMedium.pm
	],
	[#Rule Operator_83
		 'Operator', 2,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 7678 lib/RPerl/GrammarMedium.pm
	],
	[#Rule Operator_84
		 'Operator', 6,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 7689 lib/RPerl/GrammarMedium.pm
	],
	[#Rule Operator_85
		 'Operator', 8,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 7700 lib/RPerl/GrammarMedium.pm
	],
	[#Rule Operator_86
		 'Operator', 2,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 7711 lib/RPerl/GrammarMedium.pm
	],
	[#Rule Operator_87
		 'Operator', 2,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 7722 lib/RPerl/GrammarMedium.pm
	],
	[#Rule Operator_88
		 'Operator', 2,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 7733 lib/RPerl/GrammarMedium.pm
	],
	[#Rule Operator_89
		 'Operator', 3,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 7744 lib/RPerl/GrammarMedium.pm
	],
	[#Rule Operator_90
		 'Operator', 3,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 7755 lib/RPerl/GrammarMedium.pm
	],
	[#Rule Operator_91
		 'Operator', 2,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 7766 lib/RPerl/GrammarMedium.pm
	],
	[#Rule Operator_92
		 'Operator', 3,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 7777 lib/RPerl/GrammarMedium.pm
	],
	[#Rule Operator_93
		 'Operator', 3,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 7788 lib/RPerl/GrammarMedium.pm
	],
	[#Rule Operator_94
		 'Operator', 3,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 7799 lib/RPerl/GrammarMedium.pm
	],
	[#Rule Operator_95
		 'Operator', 3,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 7810 lib/RPerl/GrammarMedium.pm
	],
	[#Rule Operator_96
		 'Operator', 3,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 7821 lib/RPerl/GrammarMedium.pm
	],
	[#Rule Operator_97
		 'Operator', 3,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 7832 lib/RPerl/GrammarMedium.pm
	],
	[#Rule Operator_98
		 'Operator', 3,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 7843 lib/RPerl/GrammarMedium.pm
	],
	[#Rule Operator_99
		 'Operator', 2,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 7854 lib/RPerl/GrammarMedium.pm
	],
	[#Rule Operator_100
		 'Operator', 1,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 7865 lib/RPerl/GrammarMedium.pm
	],
	[#Rule Operator_101
		 'Operator', 3,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 7876 lib/RPerl/GrammarMedium.pm
	],
	[#Rule Operator_102
		 'Operator', 3,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 7887 lib/RPerl/GrammarMedium.pm
	],
	[#Rule Operator_103
		 'Operator', 3,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 7898 lib/RPerl/GrammarMedium.pm
	],
	[#Rule Operator_104
		 'Operator', 3,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 7909 lib/RPerl/GrammarMedium.pm
	],
	[#Rule Operator_105
		 'Operator', 3,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 7920 lib/RPerl/GrammarMedium.pm
	],
	[#Rule Operator_106
		 'Operator', 3,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 7931 lib/RPerl/GrammarMedium.pm
	],
	[#Rule Operator_107
		 'Operator', 3,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 7942 lib/RPerl/GrammarMedium.pm
	],
	[#Rule Operator_108
		 'Operator', 5,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 7953 lib/RPerl/GrammarMedium.pm
	],
	[#Rule Operator_109
		 'Operator', 2,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 7964 lib/RPerl/GrammarMedium.pm
	],
	[#Rule Operator_110
		 'Operator', 3,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 7975 lib/RPerl/GrammarMedium.pm
	],
	[#Rule Operator_111
		 'Operator', 3,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 7986 lib/RPerl/GrammarMedium.pm
	],
	[#Rule _PAREN
		 'PAREN-31', 1,
sub {
#line 211 "lib/RPerl/GrammarMedium.eyp"
 goto &Parse::Eyapp::Driver::YYActionforParenthesis}
#line 7993 lib/RPerl/GrammarMedium.pm
	],
	[#Rule _OPTIONAL
		 'OPTIONAL-32', 1,
sub {
#line 211 "lib/RPerl/GrammarMedium.eyp"
 goto &Parse::Eyapp::Driver::YYActionforT_single }
#line 8000 lib/RPerl/GrammarMedium.pm
	],
	[#Rule _OPTIONAL
		 'OPTIONAL-32', 0,
sub {
#line 211 "lib/RPerl/GrammarMedium.eyp"
 goto &Parse::Eyapp::Driver::YYActionforT_empty }
#line 8007 lib/RPerl/GrammarMedium.pm
	],
	[#Rule _OPTIONAL
		 'OPTIONAL-33', 1,
sub {
#line 212 "lib/RPerl/GrammarMedium.eyp"
 goto &Parse::Eyapp::Driver::YYActionforT_single }
#line 8014 lib/RPerl/GrammarMedium.pm
	],
	[#Rule _OPTIONAL
		 'OPTIONAL-33', 0,
sub {
#line 212 "lib/RPerl/GrammarMedium.eyp"
 goto &Parse::Eyapp::Driver::YYActionforT_empty }
#line 8021 lib/RPerl/GrammarMedium.pm
	],
	[#Rule OperatorVoid_117
		 'OperatorVoid', 4,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 8032 lib/RPerl/GrammarMedium.pm
	],
	[#Rule OperatorVoid_118
		 'OperatorVoid', 4,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 8043 lib/RPerl/GrammarMedium.pm
	],
	[#Rule OperatorVoid_119
		 'OperatorVoid', 1,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 8054 lib/RPerl/GrammarMedium.pm
	],
	[#Rule OperatorVoid_120
		 'OperatorVoid', 4,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 8065 lib/RPerl/GrammarMedium.pm
	],
	[#Rule OperatorVoid_121
		 'OperatorVoid', 3,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 8076 lib/RPerl/GrammarMedium.pm
	],
	[#Rule OperatorVoid_122
		 'OperatorVoid', 5,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 8087 lib/RPerl/GrammarMedium.pm
	],
	[#Rule OperatorVoid_123
		 'OperatorVoid', 1,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 8098 lib/RPerl/GrammarMedium.pm
	],
	[#Rule OperatorVoid_124
		 'OperatorVoid', 3,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 8109 lib/RPerl/GrammarMedium.pm
	],
	[#Rule _OPTIONAL
		 'OPTIONAL-34', 1,
sub {
#line 214 "lib/RPerl/GrammarMedium.eyp"
 goto &Parse::Eyapp::Driver::YYActionforT_single }
#line 8116 lib/RPerl/GrammarMedium.pm
	],
	[#Rule _OPTIONAL
		 'OPTIONAL-34', 0,
sub {
#line 214 "lib/RPerl/GrammarMedium.eyp"
 goto &Parse::Eyapp::Driver::YYActionforT_empty }
#line 8123 lib/RPerl/GrammarMedium.pm
	],
	[#Rule _OPTIONAL
		 'OPTIONAL-35', 1,
sub {
#line 215 "lib/RPerl/GrammarMedium.eyp"
 goto &Parse::Eyapp::Driver::YYActionforT_single }
#line 8130 lib/RPerl/GrammarMedium.pm
	],
	[#Rule _OPTIONAL
		 'OPTIONAL-35', 0,
sub {
#line 215 "lib/RPerl/GrammarMedium.eyp"
 goto &Parse::Eyapp::Driver::YYActionforT_empty }
#line 8137 lib/RPerl/GrammarMedium.pm
	],
	[#Rule Expression_129
		 'Expression', 1,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 8148 lib/RPerl/GrammarMedium.pm
	],
	[#Rule Expression_130
		 'Expression', 3,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 8159 lib/RPerl/GrammarMedium.pm
	],
	[#Rule Expression_131
		 'Expression', 1,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 8170 lib/RPerl/GrammarMedium.pm
	],
	[#Rule Expression_132
		 'Expression', 4,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 8181 lib/RPerl/GrammarMedium.pm
	],
	[#Rule Expression_133
		 'Expression', 5,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 8192 lib/RPerl/GrammarMedium.pm
	],
	[#Rule Expression_134
		 'Expression', 3,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 8203 lib/RPerl/GrammarMedium.pm
	],
	[#Rule SubExpression_135
		 'SubExpression', 1,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 8214 lib/RPerl/GrammarMedium.pm
	],
	[#Rule SubExpression_136
		 'SubExpression', 1,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 8225 lib/RPerl/GrammarMedium.pm
	],
	[#Rule SubExpression_137
		 'SubExpression', 1,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 8236 lib/RPerl/GrammarMedium.pm
	],
	[#Rule SubExpression_138
		 'SubExpression', 1,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 8247 lib/RPerl/GrammarMedium.pm
	],
	[#Rule SubExpression_139
		 'SubExpression', 1,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 8258 lib/RPerl/GrammarMedium.pm
	],
	[#Rule SubExpression_140
		 'SubExpression', 1,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 8269 lib/RPerl/GrammarMedium.pm
	],
	[#Rule SubExpression_141
		 'SubExpression', 1,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 8280 lib/RPerl/GrammarMedium.pm
	],
	[#Rule SubExpression_142
		 'SubExpression', 1,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 8291 lib/RPerl/GrammarMedium.pm
	],
	[#Rule SubExpression_143
		 'SubExpression', 3,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 8302 lib/RPerl/GrammarMedium.pm
	],
	[#Rule SubExpressionOrInput_144
		 'SubExpressionOrInput', 1,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 8313 lib/RPerl/GrammarMedium.pm
	],
	[#Rule SubExpressionOrInput_145
		 'SubExpressionOrInput', 1,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 8324 lib/RPerl/GrammarMedium.pm
	],
	[#Rule SubExpressionOrInput_146
		 'SubExpressionOrInput', 1,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 8335 lib/RPerl/GrammarMedium.pm
	],
	[#Rule SubExpressionOrVarMod_147
		 'SubExpressionOrVarMod', 1,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 8346 lib/RPerl/GrammarMedium.pm
	],
	[#Rule SubExpressionOrVarMod_148
		 'SubExpressionOrVarMod', 1,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 8357 lib/RPerl/GrammarMedium.pm
	],
	[#Rule _PAREN
		 'PAREN-36', 2,
sub {
#line 219 "lib/RPerl/GrammarMedium.eyp"
 goto &Parse::Eyapp::Driver::YYActionforParenthesis}
#line 8364 lib/RPerl/GrammarMedium.pm
	],
	[#Rule _OPTIONAL
		 'OPTIONAL-37', 1,
sub {
#line 219 "lib/RPerl/GrammarMedium.eyp"
 goto &Parse::Eyapp::Driver::YYActionforT_single }
#line 8371 lib/RPerl/GrammarMedium.pm
	],
	[#Rule _OPTIONAL
		 'OPTIONAL-37', 0,
sub {
#line 219 "lib/RPerl/GrammarMedium.eyp"
 goto &Parse::Eyapp::Driver::YYActionforT_empty }
#line 8378 lib/RPerl/GrammarMedium.pm
	],
	[#Rule Statement_152
		 'Statement', 1,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 8389 lib/RPerl/GrammarMedium.pm
	],
	[#Rule Statement_153
		 'Statement', 2,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 8400 lib/RPerl/GrammarMedium.pm
	],
	[#Rule Statement_154
		 'Statement', 1,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 8411 lib/RPerl/GrammarMedium.pm
	],
	[#Rule Statement_155
		 'Statement', 1,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 8422 lib/RPerl/GrammarMedium.pm
	],
	[#Rule Statement_156
		 'Statement', 2,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 8433 lib/RPerl/GrammarMedium.pm
	],
	[#Rule _PAREN
		 'PAREN-38', 5,
sub {
#line 220 "lib/RPerl/GrammarMedium.eyp"
 goto &Parse::Eyapp::Driver::YYActionforParenthesis}
#line 8440 lib/RPerl/GrammarMedium.pm
	],
	[#Rule _STAR_LIST
		 'STAR-39', 2,
sub {
#line 220 "lib/RPerl/GrammarMedium.eyp"
 goto &Parse::Eyapp::Driver::YYActionforT_TX1X2 }
#line 8447 lib/RPerl/GrammarMedium.pm
	],
	[#Rule _STAR_LIST
		 'STAR-39', 0,
sub {
#line 220 "lib/RPerl/GrammarMedium.eyp"
 goto &Parse::Eyapp::Driver::YYActionforT_empty }
#line 8454 lib/RPerl/GrammarMedium.pm
	],
	[#Rule _PAREN
		 'PAREN-40', 2,
sub {
#line 220 "lib/RPerl/GrammarMedium.eyp"
 goto &Parse::Eyapp::Driver::YYActionforParenthesis}
#line 8461 lib/RPerl/GrammarMedium.pm
	],
	[#Rule _OPTIONAL
		 'OPTIONAL-41', 1,
sub {
#line 220 "lib/RPerl/GrammarMedium.eyp"
 goto &Parse::Eyapp::Driver::YYActionforT_single }
#line 8468 lib/RPerl/GrammarMedium.pm
	],
	[#Rule _OPTIONAL
		 'OPTIONAL-41', 0,
sub {
#line 220 "lib/RPerl/GrammarMedium.eyp"
 goto &Parse::Eyapp::Driver::YYActionforT_empty }
#line 8475 lib/RPerl/GrammarMedium.pm
	],
	[#Rule Conditional_163
		 'Conditional', 7,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 8486 lib/RPerl/GrammarMedium.pm
	],
	[#Rule Loop_164
		 'Loop', 1,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 8497 lib/RPerl/GrammarMedium.pm
	],
	[#Rule Loop_165
		 'Loop', 1,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 8508 lib/RPerl/GrammarMedium.pm
	],
	[#Rule Loop_166
		 'Loop', 1,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 8519 lib/RPerl/GrammarMedium.pm
	],
	[#Rule LoopFor_167
		 'LoopFor', 10,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 8530 lib/RPerl/GrammarMedium.pm
	],
	[#Rule LoopFor_168
		 'LoopFor', 12,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 8541 lib/RPerl/GrammarMedium.pm
	],
	[#Rule LoopForEach_169
		 'LoopForEach', 8,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 8552 lib/RPerl/GrammarMedium.pm
	],
	[#Rule LoopWhile_170
		 'LoopWhile', 5,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 8563 lib/RPerl/GrammarMedium.pm
	],
	[#Rule LoopWhile_171
		 'LoopWhile', 8,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 8574 lib/RPerl/GrammarMedium.pm
	],
	[#Rule _PLUS_LIST
		 'PLUS-42', 2,
sub {
#line 226 "lib/RPerl/GrammarMedium.eyp"
 goto &Parse::Eyapp::Driver::YYActionforT_TX1X2 }
#line 8581 lib/RPerl/GrammarMedium.pm
	],
	[#Rule _PLUS_LIST
		 'PLUS-42', 1,
sub {
#line 226 "lib/RPerl/GrammarMedium.eyp"
 goto &Parse::Eyapp::Driver::YYActionforT_single }
#line 8588 lib/RPerl/GrammarMedium.pm
	],
	[#Rule CodeBlock_174
		 'CodeBlock', 3,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 8599 lib/RPerl/GrammarMedium.pm
	],
	[#Rule _STAR_LIST
		 'STAR-43', 2,
sub {
#line 230 "lib/RPerl/GrammarMedium.eyp"
 goto &Parse::Eyapp::Driver::YYActionforT_TX1X2 }
#line 8606 lib/RPerl/GrammarMedium.pm
	],
	[#Rule _STAR_LIST
		 'STAR-43', 0,
sub {
#line 230 "lib/RPerl/GrammarMedium.eyp"
 goto &Parse::Eyapp::Driver::YYActionforT_empty }
#line 8613 lib/RPerl/GrammarMedium.pm
	],
	[#Rule Variable_177
		 'Variable', 2,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 8624 lib/RPerl/GrammarMedium.pm
	],
	[#Rule VariableRetrieval_178
		 'VariableRetrieval', 3,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 8635 lib/RPerl/GrammarMedium.pm
	],
	[#Rule VariableRetrieval_179
		 'VariableRetrieval', 3,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 8646 lib/RPerl/GrammarMedium.pm
	],
	[#Rule VariableRetrieval_180
		 'VariableRetrieval', 3,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 8657 lib/RPerl/GrammarMedium.pm
	],
	[#Rule VariableDeclaration_181
		 'VariableDeclaration', 4,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 8668 lib/RPerl/GrammarMedium.pm
	],
	[#Rule VariableDeclaration_182
		 'VariableDeclaration', 5,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 8679 lib/RPerl/GrammarMedium.pm
	],
	[#Rule VariableDeclaration_183
		 'VariableDeclaration', 9,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 8690 lib/RPerl/GrammarMedium.pm
	],
	[#Rule VariableDeclaration_184
		 'VariableDeclaration', 4,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 8701 lib/RPerl/GrammarMedium.pm
	],
	[#Rule VariableModification_185
		 'VariableModification', 3,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 8712 lib/RPerl/GrammarMedium.pm
	],
	[#Rule VariableModification_186
		 'VariableModification', 3,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 8723 lib/RPerl/GrammarMedium.pm
	],
	[#Rule _PAREN
		 'PAREN-44', 2,
sub {
#line 235 "lib/RPerl/GrammarMedium.eyp"
 goto &Parse::Eyapp::Driver::YYActionforParenthesis}
#line 8730 lib/RPerl/GrammarMedium.pm
	],
	[#Rule _STAR_LIST
		 'STAR-45', 2,
sub {
#line 235 "lib/RPerl/GrammarMedium.eyp"
 goto &Parse::Eyapp::Driver::YYActionforT_TX1X2 }
#line 8737 lib/RPerl/GrammarMedium.pm
	],
	[#Rule _STAR_LIST
		 'STAR-45', 0,
sub {
#line 235 "lib/RPerl/GrammarMedium.eyp"
 goto &Parse::Eyapp::Driver::YYActionforT_empty }
#line 8744 lib/RPerl/GrammarMedium.pm
	],
	[#Rule ListElements_190
		 'ListElements', 2,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 8755 lib/RPerl/GrammarMedium.pm
	],
	[#Rule ListElement_191
		 'ListElement', 1,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 8766 lib/RPerl/GrammarMedium.pm
	],
	[#Rule ListElement_192
		 'ListElement', 2,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 8777 lib/RPerl/GrammarMedium.pm
	],
	[#Rule ListElement_193
		 'ListElement', 1,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 8788 lib/RPerl/GrammarMedium.pm
	],
	[#Rule ListElement_194
		 'ListElement', 1,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 8799 lib/RPerl/GrammarMedium.pm
	],
	[#Rule _OPTIONAL
		 'OPTIONAL-46', 1,
sub {
#line 237 "lib/RPerl/GrammarMedium.eyp"
 goto &Parse::Eyapp::Driver::YYActionforT_single }
#line 8806 lib/RPerl/GrammarMedium.pm
	],
	[#Rule _OPTIONAL
		 'OPTIONAL-46', 0,
sub {
#line 237 "lib/RPerl/GrammarMedium.eyp"
 goto &Parse::Eyapp::Driver::YYActionforT_empty }
#line 8813 lib/RPerl/GrammarMedium.pm
	],
	[#Rule ArrayReference_197
		 'ArrayReference', 3,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 8824 lib/RPerl/GrammarMedium.pm
	],
	[#Rule _OPTIONAL
		 'OPTIONAL-47', 1,
sub {
#line 238 "lib/RPerl/GrammarMedium.eyp"
 goto &Parse::Eyapp::Driver::YYActionforT_single }
#line 8831 lib/RPerl/GrammarMedium.pm
	],
	[#Rule _OPTIONAL
		 'OPTIONAL-47', 0,
sub {
#line 238 "lib/RPerl/GrammarMedium.eyp"
 goto &Parse::Eyapp::Driver::YYActionforT_empty }
#line 8838 lib/RPerl/GrammarMedium.pm
	],
	[#Rule ArrayDereference_200
		 'ArrayDereference', 3,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 8849 lib/RPerl/GrammarMedium.pm
	],
	[#Rule ArrayDereference_201
		 'ArrayDereference', 4,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 8860 lib/RPerl/GrammarMedium.pm
	],
	[#Rule _OPTIONAL
		 'OPTIONAL-48', 1,
sub {
#line 239 "lib/RPerl/GrammarMedium.eyp"
 goto &Parse::Eyapp::Driver::YYActionforT_single }
#line 8867 lib/RPerl/GrammarMedium.pm
	],
	[#Rule _OPTIONAL
		 'OPTIONAL-48', 0,
sub {
#line 239 "lib/RPerl/GrammarMedium.eyp"
 goto &Parse::Eyapp::Driver::YYActionforT_empty }
#line 8874 lib/RPerl/GrammarMedium.pm
	],
	[#Rule HashEntry_204
		 'HashEntry', 4,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 8885 lib/RPerl/GrammarMedium.pm
	],
	[#Rule HashEntry_205
		 'HashEntry', 1,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 8896 lib/RPerl/GrammarMedium.pm
	],
	[#Rule HashEntry_206
		 'HashEntry', 1,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 8907 lib/RPerl/GrammarMedium.pm
	],
	[#Rule HashEntryProperties_207
		 'HashEntryProperties', 3,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 8918 lib/RPerl/GrammarMedium.pm
	],
	[#Rule _PAREN
		 'PAREN-49', 2,
sub {
#line 241 "lib/RPerl/GrammarMedium.eyp"
 goto &Parse::Eyapp::Driver::YYActionforParenthesis}
#line 8925 lib/RPerl/GrammarMedium.pm
	],
	[#Rule _STAR_LIST
		 'STAR-50', 2,
sub {
#line 241 "lib/RPerl/GrammarMedium.eyp"
 goto &Parse::Eyapp::Driver::YYActionforT_TX1X2 }
#line 8932 lib/RPerl/GrammarMedium.pm
	],
	[#Rule _STAR_LIST
		 'STAR-50', 0,
sub {
#line 241 "lib/RPerl/GrammarMedium.eyp"
 goto &Parse::Eyapp::Driver::YYActionforT_empty }
#line 8939 lib/RPerl/GrammarMedium.pm
	],
	[#Rule HashReference_211
		 'HashReference', 4,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 8950 lib/RPerl/GrammarMedium.pm
	],
	[#Rule HashReference_212
		 'HashReference', 2,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 8961 lib/RPerl/GrammarMedium.pm
	],
	[#Rule _OPTIONAL
		 'OPTIONAL-51', 1,
sub {
#line 242 "lib/RPerl/GrammarMedium.eyp"
 goto &Parse::Eyapp::Driver::YYActionforT_single }
#line 8968 lib/RPerl/GrammarMedium.pm
	],
	[#Rule _OPTIONAL
		 'OPTIONAL-51', 0,
sub {
#line 242 "lib/RPerl/GrammarMedium.eyp"
 goto &Parse::Eyapp::Driver::YYActionforT_empty }
#line 8975 lib/RPerl/GrammarMedium.pm
	],
	[#Rule HashDereference_215
		 'HashDereference', 3,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 8986 lib/RPerl/GrammarMedium.pm
	],
	[#Rule HashDereference_216
		 'HashDereference', 4,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 8997 lib/RPerl/GrammarMedium.pm
	],
	[#Rule WordScoped_217
		 'WordScoped', 1,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 9008 lib/RPerl/GrammarMedium.pm
	],
	[#Rule WordScoped_218
		 'WordScoped', 1,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 9019 lib/RPerl/GrammarMedium.pm
	],
	[#Rule LoopLabel_219
		 'LoopLabel', 1,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 9030 lib/RPerl/GrammarMedium.pm
	],
	[#Rule Type_220
		 'Type', 1,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 9041 lib/RPerl/GrammarMedium.pm
	],
	[#Rule Type_221
		 'Type', 1,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 9052 lib/RPerl/GrammarMedium.pm
	],
	[#Rule Type_222
		 'Type', 1,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 9063 lib/RPerl/GrammarMedium.pm
	],
	[#Rule TypeInner_223
		 'TypeInner', 5,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 9074 lib/RPerl/GrammarMedium.pm
	],
	[#Rule TypeInnerProperties_224
		 'TypeInnerProperties', 6,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 9085 lib/RPerl/GrammarMedium.pm
	],
	[#Rule TypeInnerProperties_225
		 'TypeInnerProperties', 9,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 9096 lib/RPerl/GrammarMedium.pm
	],
	[#Rule TypeInnerConstant_226
		 'TypeInnerConstant', 5,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 9107 lib/RPerl/GrammarMedium.pm
	],
	[#Rule VariableOrLiteral_227
		 'VariableOrLiteral', 1,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 9118 lib/RPerl/GrammarMedium.pm
	],
	[#Rule VariableOrLiteral_228
		 'VariableOrLiteral', 1,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 9129 lib/RPerl/GrammarMedium.pm
	],
	[#Rule VarOrLitOrOpStrOrWord_229
		 'VarOrLitOrOpStrOrWord', 1,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 9140 lib/RPerl/GrammarMedium.pm
	],
	[#Rule VarOrLitOrOpStrOrWord_230
		 'VarOrLitOrOpStrOrWord', 1,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 9151 lib/RPerl/GrammarMedium.pm
	],
	[#Rule VarOrLitOrOpStrOrWord_231
		 'VarOrLitOrOpStrOrWord', 1,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 9162 lib/RPerl/GrammarMedium.pm
	],
	[#Rule VariableSymbolOrSelf_232
		 'VariableSymbolOrSelf', 1,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 9173 lib/RPerl/GrammarMedium.pm
	],
	[#Rule VariableSymbolOrSelf_233
		 'VariableSymbolOrSelf', 1,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 9184 lib/RPerl/GrammarMedium.pm
	],
	[#Rule Literal_234
		 'Literal', 1,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 9195 lib/RPerl/GrammarMedium.pm
	],
	[#Rule Literal_235
		 'Literal', 1,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 9206 lib/RPerl/GrammarMedium.pm
	],
	[#Rule OpNamedScolonOrSubExp_236
		 'OpNamedScolonOrSubExp', 1,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 9217 lib/RPerl/GrammarMedium.pm
	],
	[#Rule OpNamedScolonOrSubExp_237
		 'OpNamedScolonOrSubExp', 1,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 9228 lib/RPerl/GrammarMedium.pm
	],
	[#Rule OpNamedScolonOrSubExp_238
		 'OpNamedScolonOrSubExp', 2,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 9239 lib/RPerl/GrammarMedium.pm
	],
	[#Rule OpNamedScolonOrSubExpIn_239
		 'OpNamedScolonOrSubExpIn', 1,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 9250 lib/RPerl/GrammarMedium.pm
	],
	[#Rule OpNamedScolonOrSubExpIn_240
		 'OpNamedScolonOrSubExpIn', 1,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 9261 lib/RPerl/GrammarMedium.pm
	],
	[#Rule OpNamedScolonOrSubExpIn_241
		 'OpNamedScolonOrSubExpIn', 2,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 9272 lib/RPerl/GrammarMedium.pm
	],
	[#Rule OpStringOrWord_242
		 'OpStringOrWord', 1,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 9283 lib/RPerl/GrammarMedium.pm
	],
	[#Rule OpStringOrWord_243
		 'OpStringOrWord', 1,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 9294 lib/RPerl/GrammarMedium.pm
	],
	[#Rule OpStringOrWord_244
		 'OpStringOrWord', 1,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 9305 lib/RPerl/GrammarMedium.pm
	],
	[#Rule OpStringOrWord_245
		 'OpStringOrWord', 1,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 9316 lib/RPerl/GrammarMedium.pm
	],
	[#Rule OpStringOrWord_246
		 'OpStringOrWord', 1,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 9327 lib/RPerl/GrammarMedium.pm
	],
	[#Rule OpStringOrWord_247
		 'OpStringOrWord', 1,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 9338 lib/RPerl/GrammarMedium.pm
	],
	[#Rule OpStringOrWord_248
		 'OpStringOrWord', 1,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 9349 lib/RPerl/GrammarMedium.pm
	],
	[#Rule OpStringOrWord_249
		 'OpStringOrWord', 1,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 9360 lib/RPerl/GrammarMedium.pm
	],
	[#Rule OpStringOrWord_250
		 'OpStringOrWord', 1,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 9371 lib/RPerl/GrammarMedium.pm
	],
	[#Rule OpStringOrWord_251
		 'OpStringOrWord', 1,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 9382 lib/RPerl/GrammarMedium.pm
	],
	[#Rule OpStringOrWord_252
		 'OpStringOrWord', 1,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 9393 lib/RPerl/GrammarMedium.pm
	],
	[#Rule OpStringOrWord_253
		 'OpStringOrWord', 1,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 9404 lib/RPerl/GrammarMedium.pm
	],
	[#Rule OpStringOrWord_254
		 'OpStringOrWord', 1,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 9415 lib/RPerl/GrammarMedium.pm
	],
	[#Rule OpStringOrWord_255
		 'OpStringOrWord', 1,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 9426 lib/RPerl/GrammarMedium.pm
	],
	[#Rule OpStringOrWord_256
		 'OpStringOrWord', 1,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 9437 lib/RPerl/GrammarMedium.pm
	],
	[#Rule OpStringOrWord_257
		 'OpStringOrWord', 1,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 9448 lib/RPerl/GrammarMedium.pm
	],
	[#Rule OpStringOrWord_258
		 'OpStringOrWord', 1,
sub {
#line 25 "lib/RPerl/GrammarMedium.eyp"

    my $self = shift;
    my $name = $self->YYName();
    bless { children => [ @_ ], line_number => ($self->{TOKENLINE} + 1) }, $name;
}
#line 9459 lib/RPerl/GrammarMedium.pm
	]
],
#line 9462 lib/RPerl/GrammarMedium.pm
    yybypass       => 0,
    yybuildingtree => 1,
    yyprefix       => '',
    yyaccessors    => {
   },
    yyconflicthandlers => {}
,
    yystateconflict => {  },
    @_,
  );
  bless($self,$class);

  $self->make_node_classes('TERMINAL', '_OPTIONAL', '_STAR_LIST', '_PLUS_LIST', 
         '_SUPERSTART', 
         '_PAREN', 
         '_PLUS_LIST', 
         '_PLUS_LIST', 
         'CompileUnit_4', 
         'CompileUnit_5', 
         '_OPTIONAL', 
         '_OPTIONAL', 
         '_STAR_LIST', 
         '_STAR_LIST', 
         '_STAR_LIST', 
         '_STAR_LIST', 
         '_STAR_LIST', 
         '_STAR_LIST', 
         '_STAR_LIST', 
         '_STAR_LIST', 
         '_PLUS_LIST', 
         '_PLUS_LIST', 
         'Program_18', 
         '_OPTIONAL', 
         '_OPTIONAL', 
         '_OPTIONAL', 
         '_OPTIONAL', 
         'ModuleHeader_23', 
         'Module_24', 
         'Module_25', 
         '_STAR_LIST', 
         '_STAR_LIST', 
         '_STAR_LIST', 
         '_STAR_LIST', 
         '_STAR_LIST', 
         '_STAR_LIST', 
         '_PLUS_LIST', 
         '_PLUS_LIST', 
         'Package_34', 
         '_OPTIONAL', 
         '_OPTIONAL', 
         'Header_37', 
         '_PLUS_LIST', 
         '_PLUS_LIST', 
         'Critic_40', 
         'Include_41', 
         'Include_42', 
         'Constant_43', 
         '_OPTIONAL', 
         '_OPTIONAL', 
         '_STAR_LIST', 
         '_STAR_LIST', 
         'Subroutine_48', 
         '_PAREN', 
         '_STAR_LIST', 
         '_STAR_LIST', 
         'SubroutineArguments_52', 
         '_STAR_LIST', 
         '_STAR_LIST', 
         '_STAR_LIST', 
         '_STAR_LIST', 
         '_STAR_LIST', 
         '_STAR_LIST', 
         '_STAR_LIST', 
         '_STAR_LIST', 
         'Class_61', 
         '_PAREN', 
         '_STAR_LIST', 
         '_STAR_LIST', 
         'Properties_65', 
         'Properties_66', 
         '_OPTIONAL', 
         '_OPTIONAL', 
         '_STAR_LIST', 
         '_STAR_LIST', 
         'Method_71', 
         '_PAREN', 
         '_STAR_LIST', 
         '_STAR_LIST', 
         'MethodArguments_75', 
         'SubroutineOrMethod_76', 
         'SubroutineOrMethod_77', 
         'Operation_78', 
         'Operation_79', 
         'Operation_80', 
         'Operation_81', 
         'Operator_82', 
         'Operator_83', 
         'Operator_84', 
         'Operator_85', 
         'Operator_86', 
         'Operator_87', 
         'Operator_88', 
         'Operator_89', 
         'Operator_90', 
         'Operator_91', 
         'Operator_92', 
         'Operator_93', 
         'Operator_94', 
         'Operator_95', 
         'Operator_96', 
         'Operator_97', 
         'Operator_98', 
         'Operator_99', 
         'Operator_100', 
         'Operator_101', 
         'Operator_102', 
         'Operator_103', 
         'Operator_104', 
         'Operator_105', 
         'Operator_106', 
         'Operator_107', 
         'Operator_108', 
         'Operator_109', 
         'Operator_110', 
         'Operator_111', 
         '_PAREN', 
         '_OPTIONAL', 
         '_OPTIONAL', 
         '_OPTIONAL', 
         '_OPTIONAL', 
         'OperatorVoid_117', 
         'OperatorVoid_118', 
         'OperatorVoid_119', 
         'OperatorVoid_120', 
         'OperatorVoid_121', 
         'OperatorVoid_122', 
         'OperatorVoid_123', 
         'OperatorVoid_124', 
         '_OPTIONAL', 
         '_OPTIONAL', 
         '_OPTIONAL', 
         '_OPTIONAL', 
         'Expression_129', 
         'Expression_130', 
         'Expression_131', 
         'Expression_132', 
         'Expression_133', 
         'Expression_134', 
         'SubExpression_135', 
         'SubExpression_136', 
         'SubExpression_137', 
         'SubExpression_138', 
         'SubExpression_139', 
         'SubExpression_140', 
         'SubExpression_141', 
         'SubExpression_142', 
         'SubExpression_143', 
         'SubExpressionOrInput_144', 
         'SubExpressionOrInput_145', 
         'SubExpressionOrInput_146', 
         'SubExpressionOrVarMod_147', 
         'SubExpressionOrVarMod_148', 
         '_PAREN', 
         '_OPTIONAL', 
         '_OPTIONAL', 
         'Statement_152', 
         'Statement_153', 
         'Statement_154', 
         'Statement_155', 
         'Statement_156', 
         '_PAREN', 
         '_STAR_LIST', 
         '_STAR_LIST', 
         '_PAREN', 
         '_OPTIONAL', 
         '_OPTIONAL', 
         'Conditional_163', 
         'Loop_164', 
         'Loop_165', 
         'Loop_166', 
         'LoopFor_167', 
         'LoopFor_168', 
         'LoopForEach_169', 
         'LoopWhile_170', 
         'LoopWhile_171', 
         '_PLUS_LIST', 
         '_PLUS_LIST', 
         'CodeBlock_174', 
         '_STAR_LIST', 
         '_STAR_LIST', 
         'Variable_177', 
         'VariableRetrieval_178', 
         'VariableRetrieval_179', 
         'VariableRetrieval_180', 
         'VariableDeclaration_181', 
         'VariableDeclaration_182', 
         'VariableDeclaration_183', 
         'VariableDeclaration_184', 
         'VariableModification_185', 
         'VariableModification_186', 
         '_PAREN', 
         '_STAR_LIST', 
         '_STAR_LIST', 
         'ListElements_190', 
         'ListElement_191', 
         'ListElement_192', 
         'ListElement_193', 
         'ListElement_194', 
         '_OPTIONAL', 
         '_OPTIONAL', 
         'ArrayReference_197', 
         '_OPTIONAL', 
         '_OPTIONAL', 
         'ArrayDereference_200', 
         'ArrayDereference_201', 
         '_OPTIONAL', 
         '_OPTIONAL', 
         'HashEntry_204', 
         'HashEntry_205', 
         'HashEntry_206', 
         'HashEntryProperties_207', 
         '_PAREN', 
         '_STAR_LIST', 
         '_STAR_LIST', 
         'HashReference_211', 
         'HashReference_212', 
         '_OPTIONAL', 
         '_OPTIONAL', 
         'HashDereference_215', 
         'HashDereference_216', 
         'WordScoped_217', 
         'WordScoped_218', 
         'LoopLabel_219', 
         'Type_220', 
         'Type_221', 
         'Type_222', 
         'TypeInner_223', 
         'TypeInnerProperties_224', 
         'TypeInnerProperties_225', 
         'TypeInnerConstant_226', 
         'VariableOrLiteral_227', 
         'VariableOrLiteral_228', 
         'VarOrLitOrOpStrOrWord_229', 
         'VarOrLitOrOpStrOrWord_230', 
         'VarOrLitOrOpStrOrWord_231', 
         'VariableSymbolOrSelf_232', 
         'VariableSymbolOrSelf_233', 
         'Literal_234', 
         'Literal_235', 
         'OpNamedScolonOrSubExp_236', 
         'OpNamedScolonOrSubExp_237', 
         'OpNamedScolonOrSubExp_238', 
         'OpNamedScolonOrSubExpIn_239', 
         'OpNamedScolonOrSubExpIn_240', 
         'OpNamedScolonOrSubExpIn_241', 
         'OpStringOrWord_242', 
         'OpStringOrWord_243', 
         'OpStringOrWord_244', 
         'OpStringOrWord_245', 
         'OpStringOrWord_246', 
         'OpStringOrWord_247', 
         'OpStringOrWord_248', 
         'OpStringOrWord_249', 
         'OpStringOrWord_250', 
         'OpStringOrWord_251', 
         'OpStringOrWord_252', 
         'OpStringOrWord_253', 
         'OpStringOrWord_254', 
         'OpStringOrWord_255', 
         'OpStringOrWord_256', 
         'OpStringOrWord_257', 
         'OpStringOrWord_258', );
  $self;
}

#line 263 "lib/RPerl/GrammarMedium.eyp"


# [[[ SEMANTIC MAP, ABSTRACT SYNTAX TREE NODES TO CLASSES ]]]

{
# Map from abstract syntax tree to classes
# DEV NOTE: derived from grammar rules in GrammarMedium.output file, use the following process for grammar updates...
# 1.  Update grammar code in this file, above this line only
# 2.  Run `script/development/grammar_medium_recompile.sh`
# 3.  Run `perl t/12_parse.t` for new & existing grammar parse-only tests, if errors goto step 1
# 4.  Inspect updates from GrammarMedium.output file, note starting & finishing & increment/decrement numbers if any rule numbers have changed
# 5a. Run `scripts/development/grammar_medium_increment.pl START FINISH INCREMENT` if rules added from step 4, repeat if needed
# 5b. Run `scripts/development/grammar_medium_decrement.pl START FINISH DECREMENT` if rules deleted from step 4, repeat if needed
# 6.  Copy updates from GrammarMedium.output file into this file with now-unique numbers, below this line only, if rules added
# 7.  Run `script/development/grammar_medium_recompile.sh` again
our string_hashref $RULES = {
CompileUnit_4 => 'RPerl::CompileUnit::Program',                             # CompileUnit -> Program
CompileUnit_5 => 'RPerl::CompileUnit::Module',                              # CompileUnit -> PLUS-2
Program_18 => 'RPerl::CompileUnit::Program',                                # Program -> SHEBANG OPTIONAL-3 USE_RPERL Header STAR-4 STAR-5 STAR-6 STAR-7 PLUS-8
ModuleHeader_23 => 'RPerl::CompileUnit::Module::Header',                    # ModuleHeader -> OPTIONAL-9 OPTIONAL-10 'package' WordScoped ';' Header
Module_24 => 'RPerl::CompileUnit::Module::Package',                         # Module -> Package
Module_25 => 'RPerl::CompileUnit::Module::Class::Generator',                # Module -> Class
Package_34 => 'RPerl::CompileUnit::Module::Package',                        # Package -> STAR-10 STAR-11 STAR-12 PLUS-13 LITERAL_NUMBER ';'
Header_37 => 'RPerl::NonGenerator',                                         # Header -> 'use strict;' 'use warnings;' OPTIONAL-15 'our' VERSION_NUMBER_ASSIGN
Critic_40 => 'RPerl::CompileUnit::Critic',                                  # Critic -> '## no critic qw(' PLUS-14 ')'
Include_41 => 'RPerl::CompileUnit::Include',                                # Include -> USE WordScoped ';'
Include_42 => 'RPerl::CompileUnit::Include',                                # Include -> USE WordScoped OP01_QW ';'
Constant_43 => 'RPerl::CompileUnit::Constant',                              # Constant -> 'use constant' WORD_UPPERCASE OP20_HASH_FATARROW TypeInnerConstant Literal ';'
Subroutine_48 => 'RPerl::CodeBlock::Subroutine',                            # Subroutine -> 'our' Type VARIABLE_SYMBOL '= sub {' OPTIONAL-16 STAR-17 '}' ';'
SubroutineArguments_52 => 'RPerl::CodeBlock::Subroutine::Arguments',        # SubroutineArguments -> LPAREN_MY Type VARIABLE_SYMBOL STAR-19 ')' OP19_VARIABLE_ASSIGN '@ARG;'
Class_61 => 'RPerl::CompileUnit::Module::Class::Generator',                 # Class -> 'use parent qw(' WordScoped ')' ';' Include STAR-20 STAR-21 STAR-22 Properties STAR-23 LITERAL_NUMBER ';'
Properties_65 => 'RPerl::NonGenerator',                                     # Properties -> 'our hashref $properties' OP19_VARIABLE_ASSIGN LBRACE HashEntryProperties STAR-27 '}' ';'
Properties_66 => 'RPerl::NonGenerator',                                     # Properties -> 'our hashref $properties' OP19_VARIABLE_ASSIGN LBRACE '}' ';'
Method_71 => 'RPerl::CodeBlock::Subroutine::Method',                        # Method -> 'our' TYPE_METHOD VARIABLE_SYMBOL '= sub {' OPTIONAL-26 STAR-27 '}' ';'
MethodArguments_75 => 'RPerl::CodeBlock::Subroutine::Method::Arguments',    # MethodArguments -> LPAREN_MY TYPE_SELF STAR-29 ')' OP19_VARIABLE_ASSIGN '@ARG;'
SubroutineOrMethod_76 => 'RPerl::CodeBlock::Subroutine',                    # SubroutineOrMethod -> Subroutine
SubroutineOrMethod_77 => 'RPerl::CodeBlock::Subroutine::Method',            # SubroutineOrMethod -> Method
Operation_78 => 'RPerl::Operation::Expression',                             # Operation -> Expression ';'
Operation_79 => 'RPerl::Operation::Expression::Operator::Named',            # Operation -> OP01_NAMED_SCOLON
Operation_80 => 'RPerl::Operation::Expression::Operator::NamedUnary',       # Operation -> OP10_NAMED_UNARY_SCOLON
Operation_81 => 'RPerl::Operation::Statement',                              # Operation -> Statement
Operator_82 => 'RPerl::Operation::Expression::Operator::Print',             # Operator -> LPAREN OP01_PRINT FHREF_SYMBOL_BRACES ListElements ')'
Operator_83 => 'RPerl::Operation::Expression::Operator::Named',             # Operator -> OP01_NAMED SubExpression
Operator_84 => 'RPerl::Operation::Expression::Operator::Named',             # Operator -> LPAREN OP01_NAMED ListElement OP21_LIST_COMMA ListElements ')'
Operator_85 => 'RPerl::Operation::Expression::Operator::Open',              # Operator -> OP01_OPEN MY TYPE_FHREF FHREF_SYMBOL OP21_LIST_COMMA LITERAL_STRING OP21_LIST_COMMA SubExpression
Operator_86 => 'RPerl::Operation::Expression::Operator::Close',             # Operator -> OP01_CLOSE FHREF_SYMBOL
Operator_87 => 'RPerl::Operation::Expression::Operator::IncrementDecrement',                # Operator -> OP03_MATH_INC_DEC Variable
Operator_88 => 'RPerl::Operation::Expression::Operator::IncrementDecrement',                # Operator -> Variable OP03_MATH_INC_DEC
Operator_89 => 'RPerl::Operation::Expression::Operator::Arithmetic::Power',                 # Operator -> SubExpression OP04_MATH_POW SubExpression
Operator_90 => 'RPerl::Operation::Expression::Operator::Bitwise::Negation',                 # Operator -> OP05_BITWISE_NEG_LPAREN SubExpression ')'
Operator_91 => 'RPerl::Operation::Expression::Operator::Logical::Negation',                 # Operator -> OP05_LOGICAL_NEG SubExpression
Operator_92 => 'RPerl::Operation::Expression::Operator::Arithmetic::Negative',              # Operator -> OP05_MATH_NEG_LPAREN SubExpression ')'
Operator_93 => 'RPerl::Operation::Expression::Operator::RegularExpression',                 # Operator -> SubExpression OP06_REGEX_MATCH OP06_REGEX_PATTERN
Operator_94 => 'RPerl::Operation::Expression::Operator::String::Repeat',                    # Operator -> SubExpression OP07_STRING_REPEAT SubExpression
Operator_95 => 'RPerl::Operation::Expression::Operator::Arithmetic::MultiplyDivideModulo',  # Operator -> SubExpression OP07_MATH_MULT_DIV_MOD SubExpression
Operator_96 => 'RPerl::Operation::Expression::Operator::Arithmetic::AddSubtract',           # Operator -> SubExpression OP08_MATH_ADD_SUB SubExpression
Operator_97 => 'RPerl::Operation::Expression::Operator::String::Concatenate',               # Operator -> SubExpression OP08_STRING_CAT SubExpression
Operator_98 => 'RPerl::Operation::Expression::Operator::Bitwise::Shift',                    # Operator -> SubExpression OP09_BITWISE_SHIFT SubExpression
Operator_99 => 'RPerl::Operation::Expression::Operator::NamedUnary',                        # Operator -> OP10_NAMED_UNARY SubExpression
Operator_100 => 'RPerl::Operation::Expression::Operator::NamedUnary',                        # Operator -> OP10_NAMED_UNARY
Operator_101 => 'RPerl::Operation::Expression::Operator::Compare::LessThanGreaterThan',     # Operator -> SubExpression OP11_COMPARE_LT_GT SubExpression
Operator_102 => 'RPerl::Operation::Expression::Operator::Compare::EqualNotEqual',           # Operator -> SubExpression OP12_COMPARE_EQ_NE SubExpression
Operator_103 => 'RPerl::Operation::Expression::Operator::Bitwise::And',                     # Operator -> SubExpression OP13_BITWISE_AND SubExpression
Operator_104 => 'RPerl::Operation::Expression::Operator::Bitwise::OrXor',                   # Operator -> SubExpression OP14_BITWISE_OR_XOR SubExpression
Operator_105 => 'RPerl::Operation::Expression::Operator::Logical::And',                     # Operator -> SubExpression OP15_LOGICAL_AND SubExpression
Operator_106 => 'RPerl::Operation::Expression::Operator::Logical::OrXor',                   # Operator -> SubExpression OP16_LOGICAL_OR SubExpression
Operator_107 => 'RPerl::Operation::Expression::Operator::List::Range',                      # Operator -> SubExpression OP17_LIST_RANGE SubExpression
Operator_108 => 'RPerl::Operation::Expression::Operator::Ternary',                          # Operator -> SubExpression OP18_TERNARY VariableOrLiteral COLON VariableOrLiteral
Operator_109 => 'RPerl::Operation::Expression::Operator::Logical::Negation',                # Operator -> OP22_LOGICAL_NEG SubExpression
Operator_110 => 'RPerl::Operation::Expression::Operator::Logical::And',                     # Operator -> SubExpression OP23_LOGICAL_AND SubExpression
Operator_111 => 'RPerl::Operation::Expression::Operator::Logical::OrXor',                   # Operator -> SubExpression OP24_LOGICAL_OR_XOR SubExpression
OperatorVoid_117 => 'RPerl::Operation::Statement::OperatorVoid::Print',                     # OperatorVoid -> OP01_PRINT OPTIONAL-31 ListElements ';'
OperatorVoid_118 => 'RPerl::Operation::Statement::OperatorVoid::Print',                     # OperatorVoid -> OP01_PRINT FHREF_SYMBOL_BRACES ListElements ';'
OperatorVoid_119 => 'RPerl::Operation::Statement::OperatorVoid::Named',                     # OperatorVoid -> OP01_NAMED_VOID_SCOLON
OperatorVoid_120 => 'RPerl::Operation::Statement::OperatorVoid::Named',                     # OperatorVoid -> OP01_NAMED_VOID_LPAREN OPTIONAL-32 ')' ';'
OperatorVoid_121 => 'RPerl::Operation::Statement::OperatorVoid::Named',                     # OperatorVoid -> OP01_NAMED_VOID ListElements ';'
OperatorVoid_122 => 'RPerl::Operation::Expression::Operator::Named',                        # OperatorVoid -> OP01_NAMED ListElement OP21_LIST_COMMA ListElements ';'
OperatorVoid_123 => 'RPerl::Operation::Statement::OperatorVoid::LoopControl',               # OperatorVoid -> OP19_LOOP_CONTROL_SCOLON
OperatorVoid_124 => 'RPerl::Operation::Statement::OperatorVoid::LoopControl',               # OperatorVoid -> OP19_LOOP_CONTROL LoopLabel ';'
Expression_129 => 'RPerl::Operation::Expression::Operator',                                     # Expression -> Operator
Expression_130 => 'RPerl::Operation::Expression::ConstantCall',                                 # Expression -> WORD_UPPERCASE LPAREN ')'
Expression_131 => 'RPerl::Operation::Expression::ConstantCall',                                 # Expression -> CONSTANT_CALL_SCOPED
Expression_132 => 'RPerl::Operation::Expression::SubroutineCall',                               # Expression -> WordScoped LPAREN OPTIONAL-33 ')'
Expression_133 => 'RPerl::Operation::Expression::SubroutineCall::MethodCall',                   # Expression -> Variable OP02_METHOD_THINARROW LPAREN OPTIONAL-34 ')'
Expression_134 => 'RPerl::Operation::Expression::SubroutineCall::MethodCall::ConstructorCall',  # Expression -> WordScoped OP02_METHOD_THINARROW_NEW ')'
SubExpression_135 => 'RPerl::Operation::Expression',                                            # SubExpression -> Expression
SubExpression_136 => 'RPerl::Operation::Expression::SubExpression::Literal::Undefined',         # SubExpression -> 'undef'
SubExpression_137 => 'RPerl::Operation::Expression::SubExpression::Literal',                    # SubExpression -> Literal
SubExpression_138 => 'RPerl::Operation::Expression::SubExpression::Variable',                   # SubExpression -> Variable
SubExpression_139 => 'RPerl::DataStructure::Array::Reference',                                  # SubExpression -> ArrayReference
SubExpression_140 => 'RPerl::Operation::Expression::SubExpression::ArrayDereference',           # SubExpression -> ArrayDereference
SubExpression_141 => 'RPerl::DataStructure::Hash::Reference',                                   # SubExpression -> HashReference
SubExpression_142 => 'RPerl::Operation::Expression::SubExpression::HashDereference',            # SubExpression -> HashDereference
SubExpression_143 => 'RPerl::Operation::Expression::SubExpression::Parenthesis',                # SubExpression -> LPAREN SubExpression ')'
SubExpressionOrInput_144 => 'RPerl::Operation::Expression::SubExpression',                      # SubExpressionOrInput -> SubExpression
SubExpressionOrInput_145 => 'RPerl::InputOutput::FilehandleIn',                                 # SubExpressionOrInput -> FHREF_SYMBOL_IN
SubExpressionOrInput_146 => 'RPerl::InputOutput::Stdin',                                        # SubExpressionOrInput -> STDIN
SubExpressionOrVarMod_147 => 'RPerl::Operation::Expression::SubExpression',                     # SubExpressionOrVarMod -> SubExpression
SubExpressionOrVarMod_148 => 'RPerl::Operation::Statement::VariableModification',               # SubExpressionOrVarMod -> VariableModification
Statement_152 => 'RPerl::Operation::Statement::Conditional',                                    # Statement -> Conditional
Statement_153 => 'RPerl::Operation::Statement::Loop',                                           # Statement -> OPTIONAL-36 Loop
Statement_154 => 'RPerl::Operation::Statement::OperatorVoid',                                   # Statement -> OperatorVoid
Statement_155 => 'RPerl::Operation::Statement::VariableDeclaration',                            # Statement -> VariableDeclaration
Statement_156 => 'RPerl::Operation::Statement::VariableModification',                           # Statement -> VariableModification ';'
Conditional_163 => 'RPerl::Operation::Statement::Conditional',                                  # Conditional -> 'if' LPAREN SubExpression ')' CodeBlock STAR-38 OPTIONAL-40
Loop_164 => 'RPerl::Operation::Statement::Loop::For',                                           # Loop -> LoopFor
Loop_165 => 'RPerl::Operation::Statement::Loop::ForEach',                                       # Loop -> LoopForEach
Loop_166 => 'RPerl::Operation::Statement::Loop::While',                                         # Loop -> LoopWhile
LoopFor_167 => 'RPerl::Operation::Statement::Loop::For',                                        # LoopFor -> 'for' MY TYPE_INTEGER VARIABLE_SYMBOL LPAREN SubExpression OP17_LIST_RANGE SubExpression ')' CodeBlock
LoopFor_168 => 'RPerl::Operation::Statement::Loop::For',                                        # LoopFor -> 'for' LPAREN_MY TYPE_INTEGER VARIABLE_SYMBOL OP19_VARIABLE_ASSIGN OpNamedScolonOrSubExp VARIABLE_SYMBOL OP11_COMPARE_LT_GT OpNamedScolonOrSubExp SubExpressionOrVarMod ')' CodeBlock
LoopForEach_169 => 'RPerl::Operation::Statement::Loop::ForEach',                                # LoopForEach -> 'foreach' MY Type VARIABLE_SYMBOL LPAREN ListElements ')' CodeBlock
LoopWhile_170 => 'RPerl::Operation::Statement::Loop::While',                                    # LoopWhile -> 'while' LPAREN SubExpression ')' CodeBlock
LoopWhile_171 => 'RPerl::Operation::Statement::Loop::While',                                    # LoopWhile -> 'while' LPAREN_MY Type VARIABLE_SYMBOL OP19_VARIABLE_ASSIGN SubExpressionOrInput ')' CodeBlock
CodeBlock_174 => 'RPerl::CodeBlock',                                                            # CodeBlock -> LBRACE PLUS-41 '}'
Variable_177 => 'RPerl::Operation::Expression::SubExpression::Variable',                        # Variable -> VariableSymbolOrSelf STAR-44
VariableRetrieval_178 => 'RPerl::Operation::Expression::SubExpression::Variable::Retrieval',    # VariableRetrieval -> OP02_ARRAY_THINARROW SubExpression ']'
VariableRetrieval_179 => 'RPerl::Operation::Expression::SubExpression::Variable::Retrieval',    # VariableRetrieval -> OP02_HASH_THINARROW SubExpression '}'
VariableRetrieval_180 => 'RPerl::Operation::Expression::SubExpression::Variable::Retrieval',    # VariableRetrieval -> OP02_HASH_THINARROW WORD '}'
VariableDeclaration_181 => 'RPerl::Operation::Statement::VariableDeclaration',                  # VariableDeclaration -> MY Type VARIABLE_SYMBOL ';'
VariableDeclaration_182 => 'RPerl::Operation::Statement::VariableDeclaration',                  # VariableDeclaration -> MY Type VARIABLE_SYMBOL OP19_VARIABLE_ASSIGN OpNamedScolonOrSubExpIn
VariableDeclaration_183 => 'RPerl::Operation::Statement::VariableDeclaration',                  # VariableDeclaration -> MY Type VARIABLE_SYMBOL OP02_ARRAY_THINARROW SubExpression ']' OP19_VARIABLE_ASSIGN 'undef' ';'
VariableDeclaration_184 => 'RPerl::Operation::Statement::VariableDeclaration',                  # VariableDeclaration -> MY TYPE_FHREF FHREF_SYMBOL ';'
VariableModification_185 => 'RPerl::Operation::Statement::VariableModification',                # VariableModification -> Variable OP19_VARIABLE_ASSIGN SubExpressionOrInput
VariableModification_186 => 'RPerl::Operation::Statement::VariableModification',                # VariableModification -> Variable OP19_VARIABLE_ASSIGN_BY SubExpression
ListElements_190 => 'RPerl::DataStructure::Array::ListElements',                                # ListElements -> ListElement STAR-43
ListElement_191 => 'RPerl::Operation::Expression::SubExpression',                               # ListElement -> SubExpression
ListElement_192 => 'RPerl::Operation::Expression::SubExpression',                               # ListElement -> TypeInner SubExpression
ListElement_193 => 'RPerl::DataStructure::Array::ListElement',                                  # ListElement -> OP01_QW
ListElement_194 => 'RPerl::DataStructure::Array::ListElement',                                  # ListElement -> ARGV
ArrayReference_197 => 'RPerl::DataStructure::Array::Reference',                                 # ArrayReference -> LBRACKET OPTIONAL-45 ']'
ArrayDereference_200 => 'RPerl::Operation::Expression::SubExpression::ArrayDereference',        # ArrayDereference -> '@{' Variable '}'
ArrayDereference_201 => 'RPerl::Operation::Expression::SubExpression::ArrayDereference',        # ArrayDereference -> '@{' OPTIONAL-47 ArrayReference '}'
HashEntry_204 => 'RPerl::DataStructure::Hash::Entry',                                           # HashEntry -> VarOrLitOrOpStrOrWord OP20_HASH_FATARROW OPTIONAL-47 SubExpression
HashEntry_205 => 'RPerl::Operation::Expression::SubExpression::HashDereference',                # HashEntry -> HashDereference
HashEntry_206 => 'RPerl::DataStructure::Hash::Entry',                                           # HashEntry -> ENV
HashEntryProperties_207 => 'RPerl::NonGenerator',                                               # HashEntryProperties -> OpStringOrWord OP20_HASH_FATARROW TypeInnerProperties
HashReference_211 => 'RPerl::DataStructure::Hash::Reference',                                   # HashReference -> LBRACE HashEntry STAR-50 '}'
HashReference_212 => 'RPerl::DataStructure::Hash::Reference',                                   # HashReference -> LBRACE '}'
HashDereference_215 => 'RPerl::Operation::Expression::SubExpression::HashDereference',          # HashDereference -> '%{' Variable '}'
HashDereference_216 => 'RPerl::Operation::Expression::SubExpression::HashDereference',          # HashDereference -> '%{' OPTIONAL-51 HashReference '}'
WordScoped_217 => 'RPerl::NonGenerator',                                                        # WordScoped -> WORD
WordScoped_218 => 'RPerl::NonGenerator',                                                        # WordScoped -> WORD_SCOPED
LoopLabel_219 => 'RPerl::NonGenerator',                                                         # LoopLabel -> WORD_UPPERCASE  # RPerl::Operation::Statement -> LoopLabel COLON
Type_220 => 'RPerl::NonGenerator',                                                              # Type -> WORD
Type_221 => 'RPerl::NonGenerator',                                                              # Type -> WORD_SCOPED
Type_222 => 'RPerl::NonGenerator',                                                              # Type -> TYPE_INTEGER
TypeInner_223 => 'RPerl::DataType::TypeInner',                                                  # TypeInner -> MY Type '$TYPED_' OpStringOrWord OP19_VARIABLE_ASSIGN
TypeInnerProperties_224 => 'RPerl::NonGenerator',                                               # TypeInnerProperties -> MY Type '$TYPED_' OpStringOrWord OP19_VARIABLE_ASSIGN SubExpression
TypeInnerProperties_225 => 'RPerl::NonGenerator',                                               # TypeInnerProperties -> MY Type '$TYPED_' OpStringOrWord OP02_ARRAY_THINARROW SubExpression ']' OP19_VARIABLE_ASSIGN 'undef'
TypeInnerConstant_226 => 'RPerl::NonGenerator',                                                 # TypeInnerConstant -> MY Type '$TYPED_' WORD_UPPERCASE OP19_VARIABLE_ASSIGN
VariableOrLiteral_227 => 'RPerl::Operation::Expression::SubExpression::Variable',               # VariableOrLiteral -> Variable
VariableOrLiteral_228 => 'RPerl::Operation::Expression::SubExpression::Literal',                # VariableOrLiteral -> Literal
VarOrLitOrOpStrOrWord_229 => 'RPerl::Operation::Expression::SubExpression::Variable',           # VarOrLitOrOpStrOrWord -> Variable
VarOrLitOrOpStrOrWord_230 => 'RPerl::Operation::Expression::SubExpression::Literal',            # VarOrLitOrOpStrOrWord -> Literal
VarOrLitOrOpStrOrWord_231 => 'RPerl::NonGenerator',                                             # VarOrLitOrOpStrOrWord -> OpStringOrWord
VariableSymbolOrSelf_232 => 'RPerl::NonGenerator',                                              # VariableSymbolOrSelf -> VARIABLE_SYMBOL
VariableSymbolOrSelf_233 => 'RPerl::NonGenerator',                                              # VariableSymbolOrSelf -> SELF
Literal_234 => 'RPerl::Operation::Expression::SubExpression::Literal::Number',                  # Literal -> LITERAL_NUMBER
Literal_235 => 'RPerl::Operation::Expression::SubExpression::Literal::String',                  # Literal -> LITERAL_STRING
OpNamedScolonOrSubExp_236 => 'RPerl::NonGenerator',                                             # OpNamedScolonOrSubExp -> OP01_NAMED_SCOLON
OpNamedScolonOrSubExp_237 => 'RPerl::NonGenerator',                                             # OpNamedScolonOrSubExp -> OP10_NAMED_UNARY_SCOLON
OpNamedScolonOrSubExp_238 => 'RPerl::NonGenerator',                                             # OpNamedScolonOrSubExp -> SubExpression ';'
OpNamedScolonOrSubExpIn_239 => 'RPerl::NonGenerator',                                           # OpNamedScolonOrSubExpIn -> OP01_NAMED_SCOLON
OpNamedScolonOrSubExpIn_240 => 'RPerl::NonGenerator',                                           # OpNamedScolonOrSubExpIn -> OP10_NAMED_UNARY_SCOLON
OpNamedScolonOrSubExpIn_241 => 'RPerl::NonGenerator',                                           # OpNamedScolonOrSubExpIn -> SubExpressionOrInput ';'
OpStringOrWord_242 => 'RPerl::NonGenerator',                                                    # OpStringOrWord -> OP24_LOGICAL_OR_XOR
OpStringOrWord_243 => 'RPerl::NonGenerator',                                                    # OpStringOrWord -> OP23_LOGICAL_AND
OpStringOrWord_244 => 'RPerl::NonGenerator',                                                    # OpStringOrWord -> OP22_LOGICAL_NEG
OpStringOrWord_245 => 'RPerl::NonGenerator',                                                    # OpStringOrWord -> OP19_LOOP_CONTROL_SCOLON
OpStringOrWord_246 => 'RPerl::NonGenerator',                                                    # OpStringOrWord -> OP19_LOOP_CONTROL
OpStringOrWord_247 => 'RPerl::NonGenerator',                                                    # OpStringOrWord -> OP12_COMPARE_EQ_NE
OpStringOrWord_248 => 'RPerl::NonGenerator',                                                    # OpStringOrWord -> OP11_COMPARE_LT_GT
OpStringOrWord_249 => 'RPerl::NonGenerator',                                                    # OpStringOrWord -> OP10_NAMED_UNARY
OpStringOrWord_250 => 'RPerl::NonGenerator',                                                    # OpStringOrWord -> OP08_MATH_ADD_SUB
OpStringOrWord_251 => 'RPerl::NonGenerator',                                                    # OpStringOrWord -> OP07_MATH_MULT_DIV_MOD
OpStringOrWord_252 => 'RPerl::NonGenerator',                                                    # OpStringOrWord -> OP07_STRING_REPEAT
OpStringOrWord_253 => 'RPerl::NonGenerator',                                                    # OpStringOrWord -> OP01_NAMED
OpStringOrWord_254 => 'RPerl::NonGenerator',                                                    # OpStringOrWord -> OP01_CLOSE
OpStringOrWord_255 => 'RPerl::NonGenerator',                                                    # OpStringOrWord -> OP01_OPEN
OpStringOrWord_256 => 'RPerl::NonGenerator',                                                    # OpStringOrWord -> OP01_NAMED_VOID
OpStringOrWord_257 => 'RPerl::NonGenerator',                                                    # OpStringOrWord -> OP01_PRINT
OpStringOrWord_258 => 'RPerl::NonGenerator',                                                    # OpStringOrWord -> WORD
};

    1;
}


=for None

=cut


#line 9932 lib/RPerl/GrammarMedium.pm



1;
