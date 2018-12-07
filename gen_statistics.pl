#!/usr/bin/perl

use strict;
use warnings;
use lib qw(./);
use HConfig;
use Utils;
use Schedule;
use Data::Dumper qw(Dumper);
for my $league (HConfig::get_leagues()){
  print Dumper($league);
  Utils::current_league($league);
  my $schedule=Schedule::get_schedule();
  for my $box ($schedule->get_boxscore_list())
    {
      Override::apply($box);
      $box->calc_goalie_stats();
    }
  for my $goalie (sort { $a->save_percentage() <=> $b->save_percentage()} (Utils::get_all_goalies()))
    {
      $goalie->print_stat_line();
    }
}
