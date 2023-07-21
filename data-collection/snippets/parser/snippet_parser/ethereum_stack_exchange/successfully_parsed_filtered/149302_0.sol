function createRandomGoblin () public payable {

            uint256 price = getCreateGoblinPrice() * 10 ** 18; 
            require(blueGem.balanceOf(msg.sender) >= price);
            require(blueGem.approve(address(this), price), "Failed to approve token transfer");
            
            require(blueGem.transferFrom(msg.sender, address(this), price));
            _createGoblin(msg.sender);

    }
