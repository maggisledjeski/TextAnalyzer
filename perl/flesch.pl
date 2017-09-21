#!/usr/bin/perl
use warnings;
use strict;

open my $fh, '<', 'KJV.txt' or die "can't open file $!";
my $file_contents = do
{
    local $/;
    <$fh>;
};
my $sentCount = 0;
while($file_contents =~ /[.;:!?]+/g)
{
    $sentCount++;
}
print "The number of sentences is: $sentCount \n";
$file_contents =~ s/[0-9]//g; #no numbers
$file_contents =~ s/  / /g; #no double spaces
$file_contents =~ s/[!,:;?.]+//g; #no sentence markers
my @words = split(' ',$file_contents);
my $words;
my $wordCount = scalar @words;
print "The number of words is: $wordCount \n"; #prints num of elements in array

sub isVowel
{
    my $char = shift;
    my $bool = 0;
    my @vowels = qw/a e i o u y A E I O U Y/;
    for my $v(@vowels)
    {
        if($char =~ m/$v/)
        {
            $bool = 1;
        }
    }
    return $bool;
}

sub Syllable
{
    my $w = shift;
    my $c = substr($w,length($w)-1,1);
    my $wordCheck = substr($w,0,length($w)-1);
    my $bool = 1;
    my @vowels = qw/a e i o u y A E I O U Y/;
    my $seen = 0;
    my $old = 0;
    my $new;
    my $char;
    my $char2;
    for my $i(0..length($w)-1)
    {
        $char = substr($w,$i,1);
        $new = isVowel($char);
        if($new == 1)
        {
            $seen++;
            if($old == 1)
            {
                $seen--;
            }
        }
        $char2 = substr($w,$i,1);
        $old = isVowel($char2);
    }
    my $vCount = 0;
    my $letterC;
    my $letter;
    if($c eq 'e')
    {
        for my $check(0..length($wordCheck)-1)
        {
            $letter = substr($wordCheck,$check,1);
            $letterC = isVowel($letter);
            if($letterC == 1)
            {
                $vCount = $vCount + 1;
            }
        }
        if($vCount >= 1)
        {
            $seen--;
        }  
    }
    return $seen;
}

my $counter = 0;
my $sc = 0;
my $s;
foreach $counter (@words)
{
    $s = Syllable($counter);
    $sc = $sc + $s;
}
print "the number of syllables are: $sc\n";
my $a = $sc/$wordCount;
my $b = $wordCount/$sentCount;
my $index = 206.835 - ($a*84.6) - ($b*1.015);
print "a =  $a\n";
print "b = $b\n";
print "index = $index\n";
