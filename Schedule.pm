package Schedule;
use strict;
use warnings;

sub get_schedule{
    my $r=bless {};
    $r->{league}=Utils::current_league();
    $r->_parse_html_page(Utils::get_raw_schedule($r->{league}));
}

sub get_boxscore_list{
    return ();
}


1;
