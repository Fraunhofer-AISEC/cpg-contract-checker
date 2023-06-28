function send(address payable _to) public payable {
        (bool sent, bytes memory data) = _to.call{value: msg.value}("");
        require(sent, "Failed to send Ether");
    }

    function deleteAccount(address _addr) public {
        send(payable(to));
        
        delete accDetails[_addr];
        delete balanceOf[_addr];
        delete addrTouniqueIdentifier[_addr];
        delete uniqueIdentifierToAddr[];
    }
