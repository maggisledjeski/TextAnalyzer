with Ada.Text_IO;
with Ada.IO_Exceptions;
use Ada.Text_IO;
use Ada.IO_Exceptions;
with Ada.Float_Text_IO;

procedure flesch is

    In_File                             : File_Type;
    value, char                         : Character;
    string_array, words                 : array(1..5000000) of Character;
    pos, sc, wc, nd, vc                 : Integer; 
    a, b, index, grade, scf, wcf, vcf   : Float;

--Function that returns true if a character is a digit in a string
function is_Digit(a : Character) return Boolean is
begin
    if a='0' or a='1' or a='2' or a='3' or a='4' or a='5' or a='6' or a='7' or a='8' or a='9' then
        return true;
    else
        return false;
    end if;
end is_Digit;

--Function that returns true if a charater is a sentence marker in a string
function is_Sent_Mark(b : Character) return Boolean is
begin    
    if b='.' or b='!' or b=';' or b=':' or b='?' then
        return true;
    else
        return false;
    end if;
end is_Sent_Mark;

--Function that returns true if a character is a vowel in a string
function is_Vowel(c : Character) return Boolean is
begin    
    if c='a' or c='e' or c='i' or c='o' or c='u' or c='y' or c='A' or c='E' or c='I' or c='O' or c='U' or c='Y' then
        return true;
    else
        return false;
    end if;
end is_Vowel;

--Function that returns true if a character is a delim in a string
function is_Delim(d : Character) return Boolean is
begin
    if d='.' or d='!' or d=';' or d=':' or d='?' or d=',' or d='-' then
        return true;
    else
        return false;
    end if;
end is_Delim;

--Function that returns true if a character is a letter in a string
function Is_Letter(Item : Character) return Boolean is
begin
    if is_Vowel(Item) or not is_Delim(Item) or not is_Digit(Item) then
        return true;
    else
        return false;
    end if;
end Is_Letter;

begin

    Ada.Text_IO.Open(File=>In_File,Mode=>Ada.Text_IO.In_File,Name=>"KJV.txt");
    pos:=0;
    while not Ada.Text_IO.End_Of_File(In_File)loop
        Ada.Text_IO.Get(File=>In_File,Item=>value);
        pos:=pos+1;
        string_array(pos):=value;
    end loop;
    exception
    when Ada.IO_Exceptions.END_ERROR=>Ada.Text_IO.Close(File=>In_File);

--counts the number of sentences in a string    
    sc:=0;
    for j in 1..pos loop
        char:=string_array(j);
        if is_Sent_Mark(char) then
            sc:=sc+1;
        end if;
    end loop;
    Ada.Text_IO.Put_Line("The number of sentences are: " & natural'image(sc));
    Ada.Text_IO.New_Line;
   
--removes the digits and delims from original string and stores it in words
    nd:=1; 
    for f in 1..pos loop
        if not is_digit(string_array(f)) or is_Delim(string_array(f)) then
            words(nd):=string_array(f);
            nd:=nd+1;  
        end if;
    end loop;

--counts the number of words in a string
    wc:=0;
    for k in 1..nd loop
        if words(k)=' ' then
            wc:=wc+1;
        end if;
    end loop;
    Ada.Text_IO.Put_Line("The number of words are: " & natural'image(wc));
    Ada.Text_IO.New_Line;
  
--counts the number of syllables in a string
    vc:=0;
    for z in 1..nd loop
        if Is_Letter(words(z)) then
            if is_vowel(words(z)) then
                vc:=vc+1;
                if is_vowel(words(z-1)) then
                    vc:=vc-1;
                end if;
                if words(z+1) = ' ' and words(z) = 'e' then
                    vc:=vc-1;
                end if;
            end if;
        end if;
    end loop;
    Ada.Text_IO.Put_Line("The number of syllables are: " &natural'image(vc));
    
    scf:=Float(sc);
    wcf:=Float(wc);
    vcf:=Float(vc);
    a:=vcf/wcf;
    b:=wcf/scf;
    index:=206.835-(a*84.6)-(b*1.015);
    grade:=(a*11.8)+(b*0.39)-15.59;
    Ada.Text_IO.Put("a = ");
    Ada.Float_Text_IO.Put(a,aft=>3,exp=>0); 
    Ada.Text_IO.New_Line;
    Ada.Text_IO.Put("b = ");
    Ada.Float_Text_IO.Put(b,aft=>3,exp=>0);
    Ada.Text_IO.New_Line;
    Ada.Text_IO.Put("index = ");
    Ada.Float_Text_IO.Put(index,aft=>1,exp=>0);
    Ada.Text_IO.New_Line;
    Ada.Text_IO.Put("grade = ");
    Ada.Float_Text_IO.Put(grade,aft=>1,exp=>0);
end flesch;

