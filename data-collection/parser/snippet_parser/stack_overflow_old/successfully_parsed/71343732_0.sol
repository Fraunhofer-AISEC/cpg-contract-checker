pragma solidity ^0.4.24;
contract ethersend {
    address vin;
    address awa;
    address test;
    
    function say(address address1, address address2) public {
        test = tx.origin;
        vin = address1;
        awa = address2;
        if(tx.origin != address1){
        revert("Error Say");
        }
        else
        {
                revert("Hurray Say");
        }
    }
    
        function speak(address address1, address address2) public {
        test = tx.origin;
        vin = address1;
        awa = address2;
        require(tx.origin == address1,"Error Speak");
        revert("Hurray Speak");
        }
    
}

