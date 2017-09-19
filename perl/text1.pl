#!/usr/bin/perl
use warnings;
use strict;

open my $fh, '<', 'textfile.txt' or die "can't open file $!";
my $file_contents = do
{
    local $/;
    <$fh>;
};

#$/ = undef;
#open QUOTES, "textfile.txt" or die $!;
#my $file_contents = <QUOTES>;
#print "$file_contents";
my $sentCount = 0;

while($file_contents =~ /[.;:!?]+/g)
{
    $sentCount++;
}
print "The number of sentences is: $sentCount \n";

$file_contents =~ s/[0-9]//g; #no numbers
$file_contents =~ s/  / /g; #no double spaces
$file_contents =~ s/[!,:;?.]+//g; #no sentence markers
#print $file_contents;
my @words = split(' ',$file_contents);
my $wordCount = scalar @words;
print "The number of words is: $wordCount \n"; #prints num of elements in array

#my $syllCount = Syllable(\@words);
#print "The number of syllables are:  $syllCount \n" ;

    my $counter = 0;
    my $sc = 0;
    foreach $counter(@words)
    {  
#        if(substr $counter,-1 == 'e')
#        {
#            $counter = substr $counter, -1;

#        }
        my @vowels = qw/a e i o u y A E I O U Y/;
        my $seen = 0;
        for my $char(split //, $counter)
        {
            for my $v(@vowels)
            {
                if($char =~ m/$v/)
                {
                    $seen++;
                }
            }
        }
     
    }
#my $counter = 0;
#my $sc = 0;
#foreach $counter (@words)
#{
#    $sc = $sc + Syllable($counter);
#}
#print "the number of syllables are: $sc\n";

#my $syllCount = Syllable(\@words);
print "The number of syllables are:  $seen \n" ;

