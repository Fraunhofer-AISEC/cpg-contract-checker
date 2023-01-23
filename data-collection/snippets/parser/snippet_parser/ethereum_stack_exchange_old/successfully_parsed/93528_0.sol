contract LibraryA {
    function getSenderAddress() public returns (address); 
    }

contract LibraryB {
    function getSenderAddress() public returns (address); 
    }

contract UseCase {
    function checkToken(LibraryA a) public returns (address)
        {return a.getSenderAddress();}}

