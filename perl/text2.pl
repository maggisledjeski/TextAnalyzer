#!/usr/bin/perl
use warnings;
use strict;

my $w = "faile";
    my $c = substr($w,length($w)-1,1);
    my $wordCheck = substr($w,0,length($w)-1);
    print "$wordCheck \n";
    my $bool = 1;
    my @vowels = qw/a e i o u y A E I O U Y/;
    my $seen = 0;
    my $count = -1;
    my $prev = 0;
    my $vb = 0;
    my @cat = split(//, $w);
    for my $char(@cat)
    {
        for my $v(@vowels)
        {
            if($char =~ m/$v/)
            {
                $vb = 1;
                if($prev == 0)
                {
                    $seen++;
                    $prev = 1;
                    print $char;
                    print $seen;
                    print "$prev \n";
                }
                else
                {
                    if($prev == 1)
                    {
                        $seen--;
                        $prev = 1;
                        print $char;
                        print $seen;
                        print "$prev \n";
                    }
                }    
            }
            else
            {
                $vb = 0;
                if($prev == 1)
                {
                    $prev = 0;
                    print $char;
                    print $seen;
                    print "$prev \n";
                }
                else
                {
                    if($prev == 0)
                    {
                        $prev = 0;
                    }
                }
            }
            
#            if($char =~ m/$v/ && $prev == 0)
#            {   
#                print "$char ";
#                $seen++;
#                print "$seen ";
#                $prev = 1;
#                print "$prev \n";
#            }
#            else
#            {
#                if($char =~ m/$v/ && $prev == 1)
#                {
#                    $seen--;
#                    print $char;
#                   print "$seen ";
#                    $prev = 1;
#                    print "$prev \n";
#                }
#                else
#                {
#                    if($char !~ m/$v/)
#                    {
#                    print $char;
#                    print "$seen ";
#                    $prev = 0;
#                    print "$prev \n";
#                    }
#                }
#            }
        }
#        $count++;
#        print "$count \n";
    }
    print "$seen \n";
    if($c eq 'e')
    {
        for my $check(split //,$wordCheck)
        {
            for my $vcheck(@vowels)
            {
                if($check =~ m/$vcheck/)
                {
                    $bool = 0;
                }
            }
        }
        if($bool eq 0)
        {
            $seen--;
        }
    }
    

    #print "$seen\n";
                                                                     
