contract Book{

    string title;
    string author;

    mapping (string => string[]) books;

    function setAuthorAndTitle(string _author,string _bookTitle){
        books[_author].push(_bookTitle);
    }

    function getBooksByAuthor(string _author) public view returns (string[]) {
        string[] memory titles = books[_author];
        return titles;
    }
}
