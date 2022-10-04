contract NewBook {

    struct ChapterData {
        
        string title;
        uint pages;
    }

    struct BookData {
        
        ChapterData[] chapters;
    }

    mapping(bytes32 => BookData) books; 

    function addChapter(bytes32 _bookID, string memory title, uint pages) public {
        ChapterData memory c = ChapterData({
            title: title,
            pages: pages
        });
        books[_bookID].chapters.push(c);
    }
}