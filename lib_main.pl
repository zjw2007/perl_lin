#!/usr/bin/perl
 
 
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
 
    # Example: my $yesterday = cal_time('_','day',-86400);
    # Output:  YYYY_MM_DD
}
 
 
sub log {
    my ($msg) = @_;
    my ($sec,$min,$hour,$mday,$mon,$year) = localtime(time);
    printf("[%04d-%02d-%02d %02d:%02d:%02d] %s\n", $year+1900,$mon+1,$mday,$hour,$min,$sec,$msg);
 
    # Example: &log("Text...");
    # Output:  [YYYY-MM-DD hh:mm:ss] Text...
}
 
 
sub log_and_die
{
    my ($mes) = @_;
    &log($mes);
    exit(1);
}
 
 
1;

