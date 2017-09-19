#!/usr/bin/perl
use warnings;
use strict;

open my $fh, '<', 'textfile.txt' or die "can't open file $!";
my $file_contents = do 
{   
    local $/;
    <$fh>;
};
print "$file_contents";
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
my $words;
my $wordCount = scalar @words;
#print "Z @words";
print "The number of words is: $wordCount \n"; #prints num of elements in array

#Function DEF
sub Syllable
{
    my $w = shift; 
    my $c = substr($w,length($w)-1,1);
    my $wordCheck = substr($w,0,length($w)-1);
    my $bool = 1;
#    print $wordCheck;
    my @vowels = qw/a e i o u y A E I O U Y/;
    my $seen = 0;
    for my $char(split //, $w)
    {
        for my $v(@vowels)
        {
            if($char =~ m/$v/)
            {
                $seen++;
            }
        }
#        if($c eq 'e')
#        {
#            $seen--;
#        }
    }
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
    
    return $seen;
}

my $counter = 0;
my $sc = 0;
foreach $counter (@words)
{
#    print "X $counter";
    $sc = $sc + Syllable($counter);
#    print "The number of syllables are: $sc\n";
}
print "the number of syllables are: $sc\n";
#read $fh, my $file_content, -s $fh;



#open my $input, '<', $file or die "can't open $file : $!";
#while(<$input>)
#{
#    chomp;
#    print $input;
#}
#close $input or die "can't close $file: $!";

#$_ = q("I wonder what in the world is happening right now");
#print "Enter text to find: ";
#my $pattern = <STDIN>;
#chomp($pattern);
#if(/$pattern/)
#{
#    print "The text matches the pattern '$pattern'.\n";
#}
#else
#{
#    print "The '$pattern' was not found.\n";
#}

#if word is in string
#my $var = "I love cats \n";
#if($var =~ /cats/)
#{
#    print "'cats' was found!\n";
#}

#if word is not in string
#my $s = "I love cats \n";
#if($s !~ /dogs/)
#{
#    print "'dogs' was not found \n";
#}
#print qq|'"Hi," said Jack. "Have your read/. today?"'\n|;
#print qq#'"Hi," said Jack. "Have your read/. today?"'\n#;
#print qq('"Hi," said Jack. "Have your read/. today?"'\n);
#print qq<'"Hi," said Jack. "Have your read/. today?"'\n>;

#print "Test one: ", 6 > 3 && 3 > 4, "\n";
#print "Test two: ", 6 > 3 and 3 > 4, "\n";

#print "Hello World. \n";
