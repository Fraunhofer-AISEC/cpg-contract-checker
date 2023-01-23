event PropertyNftBought(address _owner, address _buyer, uint256 _price);

function buy(uint256 _id) external payable {
        price = price;
        require(price >= 2, 'This token is not for sale');
        require(msg.value >= price, 'Incorrect value');
        buildings[_id - 1].owner = ownerOf(_id);
        _transfer(owner, msg.sender, _id);
        payable(owner).transfer(msg.value); 

        emit PropertyNftBought(owner, msg.sender, msg.value);
    }
