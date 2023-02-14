function buyGood(uint index) public payable {
        Good storage good = goods[index];

        require(msg.sender != good.owner && good.forSale && msg.value >= good.price);

        if(good.owner == 0x0) {
            balances[owner] += msg.value;
        }else {
            balances[good.owner] += msg.value;
        }

        good.owner = msg.sender;
        good.forSale = false;

        emit GoodOwnerChanged(index);
    }
