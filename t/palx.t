use Test2::V0 -no_srand => 1;
use Test::Alien;
use Env qw( @PATH );
use Path::Tiny qw( path );

unshift @PATH, path( 'palx' )->absolute->stringify;

my $exe = 'palx';

run_ok([$exe])
  ->exit_is(1);

run_ok([$exe, 'one', 'two'])
  ->exit_is(1);

run_ok([$exe, 'foo'])
  ->exit(2);

run_ok([$exe, 'foof'])
  ->success;

run_ok([$exe, 'racecar'])
  ->success;

run_ok([$exe, 'Was it a car or a cat I saw?'])
  ->success;

done_testing;
