
pragma solidity ^0.4.14;

contract ExampleContract { 

    string myMessage;

    
    function ExampleContract (string _myMessage) {
        
        
        
        
        
        myMessage = _myMessage;
    }

    
    
    function GetMessage () returns (string) {
        return myMessage;
    }
}
