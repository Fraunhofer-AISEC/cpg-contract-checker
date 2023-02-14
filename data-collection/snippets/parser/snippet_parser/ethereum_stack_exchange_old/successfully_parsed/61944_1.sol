 function test(address addr, bytes32 email) public {
        require(addressName[addr] == 0); 
        addressName[address] = email;  
    }
