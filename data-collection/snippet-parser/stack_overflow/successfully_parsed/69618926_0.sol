function setBook(string memory bookId, string memory bookName, string memory authorName) public returns(string memory){
   keyval[bookId].bookId = bookId;
   keyval[bookId].bookName = bookName;
   keyval[bookId].authorName = authorName;
   keyval[bookId].released = true;
   return bookId;
}
