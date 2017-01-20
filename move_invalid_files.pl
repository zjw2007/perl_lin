#!/usr/bin/perl
use strict;

#
# only for gateway dps.
# move old invalid files from /rawdata/invalid to target directory.
#
# created by: Way (Jianwei.zhu@xxx.com).
# created date: 05/13/2016.
#
# init ver 0.01
#


if (@ARGV < 1){
    print "Usage: $0 Before_Date<yyyymmdd>\n";
    print "Note:  move files from /rawdata/invalid to /rawdata/yyyymmdd.\n\n";
    exit;
}

my $t_time = shift @ARGV;
my $s_dir  = '/rawdata/invalid';
my $t_dir  = '/rawdata/' . &cal_time('','day',0);

#print "$t_time\n";
#print "$s_dir\n";
#print "$t_dir\n";

if (!-e $t_dir) {
    my @command = ('/bin/mkdir','-p',$t_dir);
    system(@command) == 0 or die "Could not '@command': $?";
}

    opendir(DIR, $s_dir);
    my @file = readdir(DIR);
    closedir(DIR);

        foreach (@file) {
            next, if -d;
            my $i_file = '/rawdata/invalid/' . $_;
            my $c_time = (stat($i_file))[9];
            my ($sec, $min, $hour, $day, $mon, $year) = localtime($c_time);
            my $b_time = sprintf " %04d%02d%02d", $year + 1900, $mon + 1, $day;
            chomp $b_time;

                if ($b_time < $t_time) {
                    my @cmd = ('/bin/mv',$i_file,$t_dir);
                    system(@cmd) == 0 or die "Could not '@cmd': $?";
                }

        }


# function
sub cal_time {
    my ($j, $format, $diff) = @_;
        my ($sec,$min,$hour,$mday,$mon,$year) = localtime(time+$diff);
        $year += 1900;
        $mon +=1;
 
    if ($format eq "day"){
         my $cal_day = sprintf ("%04d$j%02d$j%02d", $year,$mon,$mday);
         return $cal_day;
    }
 
    elsif ($format eq "hour") {
            my $cal_hour = sprintf ("%02d", $hour);
            return $cal_hour;
    }
 
    elsif ($format eq "min") {
            my $cal_min = sprintf ("%02d$j%02d", $hour,$min);
            return $cal_min;
    }
 
    elsif ($format eq "sec") {
            my $cal_sec = sprintf ("%02d$j%02d$j%02d", $hour,$min,$sec);
            return $cal_sec;
    }
}
