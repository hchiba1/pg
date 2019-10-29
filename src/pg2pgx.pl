#!/usr/bin/perl -w
use strict;
use File::Basename;
use Getopt::Std;
my $PROGRAM = basename $0;
my $USAGE=
"Usage: $PROGRAM [OPTION] PG_FILE_PATH

OPTION:
-o DIR: output directory (default: current directory)
";

my %OPT;
getopts('o:', \%OPT);

# if (@ARGV != 1) {
#     print STDERR $USAGE;
#     exit 1;
# }
# my ($PG_FILE_PATH) = @ARGV;

!@ARGV && -t and die $USAGE;
my @INPUT = <>;

my $OUT_PREFIX = "";
# if ($OPT{o}) {
#     $OUT_PREFIX = $OPT{o};
# } else {
#     die;
# }

# my $PG_FILE_NAME = basename($PG_FILE_PATH);
# if ($PG_FILE_NAME =~ /^(.+).pg$/) {
#     $OUT_PREFIX = $1;
# }
# if ($OPT{o}) {
#     my $dir = $OPT{o};
#     $OUT_PREFIX = "$dir/$OUT_PREFIX";
# }

my $NODES_FILE = "$OUT_PREFIX.pgx.nodes";
my $EDGES_FILE = "$OUT_PREFIX.pgx.edges";
my $JSON_FILE = "$OUT_PREFIX.pgx.json";

for my $line (@INPUT) {
    chomp($line);
    my @f = split(/\t/, $line);
    if ($f[1] eq "->" or $f[1] eq "--") {
        # edge
    } else {
        # node
        print_node(@f);
    }
}

################################################################################
### Function ###################################################################
################################################################################

sub print_node {
    my @f = @_;

    my ($node_id) = shift @f;
    print $node_id, "\n";
    for my $f (@f) {
        print $f, "\n";
    }
}
