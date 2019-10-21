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

if (@ARGV != 1) {
    print STDERR $USAGE;
    exit 1;
}
my ($PG_FILE_PATH) = @ARGV;
my $PG_FILE_NAME = basename($PG_FILE_PATH);
# my $DIR = dirname($PG_FILE_PATH);
my $OUT_PREFIX = "";
if ($PG_FILE_NAME =~ /^(.+).pg$/) {
    $OUT_PREFIX = $1;
}
if ($OPT{o}) {
    my $dir = $OPT{o};
    $OUT_PREFIX = "$dir/$OUT_PREFIX";
}

my $NODES_FILE = "$OUT_PREFIX.pgx.nodes";
my $EDGES_FILE = "$OUT_PREFIX.pgx.edges";
my $JSON_FILE = "$OUT_PREFIX.pgx.json";

while (my $line = <>) {
    chomp($line);
    my @f = split(/\s+/, $line);
    if ($f[1] eq "->" or $f[1] eq "--") {
	
    } else {
	print_nodes($line);
    }
}

################################################################################
### Function ###################################################################
################################################################################

sub print_nodes {
    my ($line) = @_;

    my @f = split(/\s+/, $line);

    my $node_id = shift @f;
    print $node_id, "\n";

    for my $field (@f) {
	if ($field =~ /^:/) {
	    
	} elsif ($field =~ /^\S+:\S+$/) {
	}
    }
    
}
