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


sub read_file {
    my ($file_name) = @_;

    open my $in, '<:encoding(UTF-8)', $file_name or die "Could not open '$file_name' for reading $!";
    local $/ = undef;
    my $all = <$in>;
    close $in;

    return $all;

    # Example: my $data = read_file($file_name);
    #          $data =~ s/regular expression/replacement text/g;
    #          print "$data\n";
}


sub write_file {
    my ($file_name, $content) = @_;

    open my $out, '>:encoding(UTF-8)', $file_name or die "Could not open '$file_name' for writing $!";
    print $out $content;
    close $out;

    return;
    # Example: my $data = read_file($file_name);
    #          xxxx
    #          my $out_file = 'out_file.txt';
    #          write_file($out_file, $data);
}
 
 
1;

