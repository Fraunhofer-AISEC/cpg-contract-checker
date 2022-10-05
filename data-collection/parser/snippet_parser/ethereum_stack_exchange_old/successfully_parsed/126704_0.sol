    function simulateRent() public payable{
        uint256 rent_received = msg.value;
       
        for (uint i = 0; i < ownersCount; i++) {
            uint256 calculateRent = balanceOf(address(owners[i]))*(rent_received)/_totalSupply;
            payable(address(owners[i])).transfer(calculateRent);
        }
    }
