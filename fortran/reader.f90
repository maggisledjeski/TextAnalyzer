program reader

character,dimension(:),allocatable ::long_string
integer::filesize,wordcount,pos
logical::found,inword
integer::first,last

type word
    integer::length
    character,dimension(:),allocatable::data
    integer::syllables
end type word

class(word),dimension(:),allocatable::words
class(word),dimension(:),allocatable::tmp_words

interface
subroutine read_file(string,filesize)
character,dimension(:),allocatable::string
integer::filesize
end subroutine read_file
end interface

call read_file(long_string,filesize)

pos=1
found=.false.
wordcount=0
do while(pos.le.filesize)
    if((.not.found).and. inword(long_string(pos:pos)))then
        first=pos
        found=.true.
    elseif(found.and.(.not.inword(long_string(pos:pos))))then
        last=pos
        found=.false.
        if(wordcount.gt.0)then
            wordcount=wordcount+1
            allocate(tmp_words(wordcount))
            do i=1,wordcount-1
                tmp_words(i)%length=words(i)%length
                tmp_words(i)%data=words(i)%data
            enddo
            call move_alloc(tmp_words,words)
            allocate(words(wordcount)%data(last-first))
            words(wordcount)%length=last-first
            words(wordcount)%data(1:last-first)=long_string(first:last)
        else
            wordcount=1
            allocate(words(wordcount))
            allocate(words(wordcount)%data(last-first))
            words(wordcount)%length=last-first
            words(wordcount)%data(1:last-first)=long_string(first:last)
        endif
        print*,pos,' ',filesize,' ',wordcount,' ',words(wordcount)%data
    endif
    pos=pos+1
enddo

do i=1,wordcount
    print*,words(i)%data
enddo

print*,"Read",filesize,"characters."

end program reader
