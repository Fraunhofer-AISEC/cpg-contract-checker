pragma solidity ^0.5.0;

    contract testTransfer {
        
        function Transfer () public payable {
        
        address payable x = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
        address payable myAddress = msg.sender;
        if (x.balance < 100 && myAddress.balance >= 10) x.transfer (10 ether);
        }
    }
