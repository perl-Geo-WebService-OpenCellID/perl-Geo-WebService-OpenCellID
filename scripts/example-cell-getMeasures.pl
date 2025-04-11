#!/usr/bin/perl

=head1 NAME

example-cell-getMeasures.pl - Simple example showing usage of cell->getMeasures method

=cut

use strict;
use warnings;
use Data::Dumper;
use Geo::WebService::OpenCellID;
my $key=shift;
my $gwo=Geo::WebService::OpenCellID->new(key=>$key);
my $response=$gwo->cell->getMeasures(
                         mcc => 250,
                         mnc => 99,
                         lac => 0,
                         cellid=>29513,
                        );
if ($response) {
  print "+" x 80, "\n";
  print Dumper([$response]);
  print "-" x 80, "\n";
  printf "Status: %s\n", $response->stat;
  printf "Lat: %s\n", $response->lat;
  printf "Lon: %s\n", $response->lon;
  #printf "Range: %s\n", $response->range;
  printf "Samples: %s\n", $response->nbSamples;
  printf "Cell ID: %s:%s:%s:%s\n", $response->mnc, $response->mcc,
                                   $response->lac, $response->cellid;
  foreach my $measure ($response->measures) {
    printf "Lat: %s, Lon: %s\n", $measure->{"lat"}, $measure->{"lon"};

  }
} else {
  print "Something went wrong."
}
