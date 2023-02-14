pragma solidity ^0.4.17;


contract Hello {
    
    string public constant aString = 'Hello World!';

    
    function printMe() returns (string){
        return aString;
    }
}


contract Goodbye is Hello{
    
    string public constant aString = 'Goodbye World!';

    
    function printMe() returns (string){
        return super.printMe();
    }

    
    function printMe2() returns (string){
        return aString;
    }
}
