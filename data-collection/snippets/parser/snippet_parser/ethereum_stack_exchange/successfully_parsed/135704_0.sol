
 function addBook(string memory _name, bool _promoted) external returns (uint) {
   uint pdate = block.timestamp;
   uint bookId = bookList.length;
   bookList.push(Book(bookId, _name, 0, pdate, _promoted));
   bookToOwner[bookId] = msg.sender;

   
   return apbookIdpId;
 }

