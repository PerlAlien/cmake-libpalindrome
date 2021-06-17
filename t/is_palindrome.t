use Test2::V0 -no_srand => 1;
use FFI::Platypus;
use FFI::CheckLib qw( find_lib );
use Path::Tiny qw( path );

my $ffi = FFI::Platypus->new;
$ffi->lib(do {
  my $lib = find_lib lib => 'palindrome', libpath => path('libpalindrome')->absolute, systempath => [];
  ok $lib, 'has lib';
  note "lib = $lib";
  $lib;
});

$ffi->attach(is_palindrome => ['string'] => 'int' => '$');

ok(__PACKAGE__->can('is_palindrome'), 'has symbol');

is is_palindrome('foo'),  0, 'foo';
is is_palindrome('foof'), 1, 'foof';
is is_palindrome('foof'), 1, 'foof x 2';
is is_palindrome('racecar'), 1, 'racecar';
is is_palindrome('Was it a car or a cat I saw?'), 1, 'Was it a car or a cat I saw?';

is is_palindrome('racecar'), 1, 'racecar x 2';
is is_palindrome('Was it a car or a cat I saw?'), 1, 'Was it a car or a cat I saw? x 2';

done_testing;
