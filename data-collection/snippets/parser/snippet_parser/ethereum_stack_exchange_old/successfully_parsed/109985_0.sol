pragma solidity 0.8.0;



contract Books{
    
    string  public Booksz;
    
     
    
    function addBooks( string memory _author, string memory _title) public  returns (string memory){
        return Booksz =(_author, _title);
    }
    
   
}
