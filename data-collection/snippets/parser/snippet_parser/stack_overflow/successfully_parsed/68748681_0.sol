pragma solidity >=0.4.0 <0.9.0;


contract MyStruct {

    
    struct Book {
        string name;
        string writer;
        uint id;
        bool available;
    }
    
    
    Book book1;
    
    
    Book book2 = Book ("Building Ethereum DApps", "Roberto Infante", 2, false);


    
    function setBookDetails() public {
        
        book1 = Book("Introducing Ethereum and Solidity", "Chris Dannen", 1, true);

        
        Book memory book3 = Book ("Solidity Programming Essentials", "Ritesh Modi", 3, true);
    }
        
    
    function getBookDetails() public view returns (string memory, string memory, uint, bool) {
          return (book1.name, book1.writer, book1.id, book1.available);
        
        
    }
}
