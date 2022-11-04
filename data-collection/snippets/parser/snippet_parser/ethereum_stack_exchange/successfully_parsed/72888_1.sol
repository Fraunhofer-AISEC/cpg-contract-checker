    function addChapter(bytes32 _bookID, string memory title, string color, uint pages) public {
        uint _length = books[_bookID].chapters.length;
        books[_bookID].chapters.length++;

        ChapterData storage c = books[_bookID].chapters[_length];
        c.title = title;
        c.color = color;
        c.pages = pages;

    }
