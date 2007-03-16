use strict;
use warnings;
use blib;
use Data::Dumper;

use Test::More tests => 20;

use Net::DNS::Async;

my $c = new Net::DNS::Async();
for my $i (1..20) {
	$c->add(sub { cb($i, @_) }, "www.microsoft.com", 'A');
}
$c->done();

sub cb {
	my ($i, $res) = @_;
	ok(defined $res, "Received multi $i");
}
