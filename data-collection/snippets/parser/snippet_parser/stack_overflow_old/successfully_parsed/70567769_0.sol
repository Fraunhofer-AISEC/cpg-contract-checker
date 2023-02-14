pragma solidity ^0.6.0

contract School {
   struct Book {
      string name;
   }
   Book[2] public books = [Book("we1"), Book("uer")];
    
   struct Reader {
      string name;
      uint booksRead; 
      Book[] books;
   }

   Reader public readers;
  
   function _createReader(string memory _name) public returns (uint) {
      #some logic
      readers.push(Reader("Freddie", 0, books[0])); 
      uint256 readerID = readers.length - 1;
      return readerID;
      
   }


}

