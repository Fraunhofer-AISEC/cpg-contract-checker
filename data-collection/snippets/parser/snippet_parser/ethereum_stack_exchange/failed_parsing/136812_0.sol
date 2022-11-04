 struct Book {
      string name;
      string writer;
      string genre;
      string publisher;
   }
 
   string[] memory bookInfo = ["bookName", "bookAuthor", "bookGenre", "bookPublisher"];
   Book book1 = Book(...bookInfo);
