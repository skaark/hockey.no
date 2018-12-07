package Utils;
use strict;
use warnings;
use Carp qw(croak);
my $current;

sub current_league{
    if(@_){
	warn "Setting league to $current\n";
	$current=shift;
    }
    return $current;
}

my %goalies;
sub get_all_goalies{
    return grep {$_->has_matches_in($current)} values %goalies;
}

sub create_goalie{
    my $id=shift;
    if(not exists $goalies{$id}){
	$goalies{$id}=new Goalie(@_);
    }
}

sub get_goalie{
    my $id=shift;
    croak "No such goalie: $id" if not exists $goalies{$id};
    return $goalies{$id};
}

1;
