pragma solidity ^0.5.0;

contract NewBook {

    struct ChapterData {
        
        string title;
        string color;
        uint pages;
    }

    struct BookData {
        
        ChapterData[] chapters;
    }

    mapping(bytes32 => BookData) books; 

    function addChapter(bytes32 _bookID, string memory title, string memory color, uint pages) public {
        ChapterData memory c = ChapterData({
            title: title,
            color: color,
            pages: pages
        });
        books[_bookID].chapters.push(c);
    }

    function changeColor (bytes32 _bookID, uint256 chapter, string memory color) public {
        ChapterData storage _chapter = (books[_bookID]).chapters[chapter];
        _chapter.color = color;
    }

    function numChapters (bytes32 _bookID) public view returns (uint256) {
        return books[_bookID].chapters.length;
    }

    function getChapterIndex (bytes32 _bookID, string memory title) public view returns (uint256) {
        for (uint i=0; i < books[_bookID].chapters.length; i++) {
            if( keccak256(abi.encodePacked(books[_bookID].chapters[i].title)) == keccak256(abi.encodePacked(title))){
                return i;
            }
        }
    }
}
