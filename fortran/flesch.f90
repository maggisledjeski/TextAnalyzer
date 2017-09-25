program flesch
character,dimension(:),allocatable::long_string
integer::filesize, sc, wc, syc, start, sy, s, w
character(LEN=1)::ch, c
real::fsy,fs,fw,ind,a,b,grade

interface
subroutine read_file(string,filesize)
character,dimension(:),allocatable::string
integer::filesize
end subroutine read_file
end interface

call read_file(long_string,filesize)
!print*,long_string
!print*,"Read",filesize," characters."

sc=0
do i=0,filesize
    ch = long_string(i)
    if(ch=='.' .or. ch=='?' .or. ch=='!' .or. ch==';' .or. ch==':') then
        sc=sc+1
    end if;
end do;
!print *,sc

wc=0;
do i=0,filesize
    c = long_string(i)
    if(c=='.'.or.c=='?'.or.c=='!'.or.c==';'.or.c==':'.or.c==' '.or.c==',') then
        wc=wc+1
    end if;
end do;
!print*,wc

start=0;
syc=0;   
do i=0,filesize
    c = long_string(i)
    if(c/='.'.or.c/='?'.or.c/='!'.or.c/=';'.or.c/=':'.or.c/=' '.or.c/=',') then
        if(start==0) then
            if(c=='a'.or.c=='e'.or.c=='i'.or.c=='o'.or.c=='u'.or.c=='y') then
                syc=syc+1
                start=1
            elseif(c=='A'.or.c=='E'.or.c=='I'.or.c=='O'.or.c=='U'.or.c=='Y') then
                syc=syc+1
                start=1
            else
                start=0 
            end if;
        else
            start=0
        end if;
    end if;
end do;

start=0
do i=0,filesize
    c=long_string(i)
    if(start==0) then
       if(c=='e') then
            start=1
       end if;
    elseif(start==1.and.c=='e') then
       syc=syc-1
       start=0
    else
        start=0
    end if;
end do;
!print*,syc        

sy=syc  !syllable count
w=wc    !word count
s=sc     !sentence count
fsy=FLOAT(sy)
fs=FLOAT(s)
fw=FLOAT(w)
a=fsy/fw
b=fw/fs
print *,'a = ',a
print *,'b = ',b
ind=206.835 - (a*84.6) - (b*1.015)
grade=(a*11.8)+(b*0.39)-15.59
print *,'syllable float = ',fsy
print *,'sentence float = ',fs
print *,'word float = ',fw
print *,'index is ',ind
print *,'grade is ',grade

end program flesch

subroutine read_file(string,filesize)
character,dimension(:),allocatable::string
integer::counter
integer::filesize
character(LEN=1)::input


inquire(file="KJV.txt",size=filesize)
open(unit=5,status="old",access="direct",form="unformatted",recl=1,file="KJV.txt")
allocate( string(filesize))

counter=1
100 read(5,rec=counter,err=200)input
    string(counter:counter) = input
    counter=counter+1
    goto 100
200 continue
counter=counter-1
close(5)
end subroutine read_file
