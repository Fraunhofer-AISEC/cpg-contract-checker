contract NewBook {

    struct ChapterData {
        string chapterID;
        string title;
        uint pages;
    }

    struct BookData {
        string bookID;
        ChapterData[] chapters;
    }

    mapping(string => BookData) public books;

    
    
    function addChapter(string memory _bookID, string memory _chapterID) public {
        books[_bookID].chapters.push(ChapterData[_chapterID]);
    }
}
