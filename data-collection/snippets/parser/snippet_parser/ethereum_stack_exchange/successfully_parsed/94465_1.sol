pragma solidity ^0.7.0;

contract Item {
    
    uint256 fee;

    
    string name;
    uint256 price;
    address payable public owner;
    uint256 time;
    bool sold; 

    uint256 maxBid;

    struct Bid {
        address payable bider;
        uint256 amount;
    }

    Bid[] Bids;

    constructor(string memory _itemName, uint256 _price, address payable _owner, uint256 _time) {
        name = _itemName;
        price = _price;
        owner = _owner;
        time = block.timestamp + _time;
        sold = false;
    }


function timeLeft() public view returns(uint256) {
    return time - block.timestamp;
    
}


function newBid (address payable _bider, uint256 _amount) public payable {
    if (block.timestamp + time > time) {
        sellItem();
        require(block.timestamp < time, "Sorry, time is up");
    }else {
        require(_amount > maxBid, "The bid must be higher than the current maximum bid");
        Bids.push(Bid( _bider, _amount ));
        
        fee = (_amount / 100) * 14;
    }
}


function sellItem () private {
    address _maxAmountAddress;
    uint256 _maxAmount = 0;
    
    for (uint i = 0; i <= Bids.length; i++) {
        if (Bids[i].amount > _maxAmount) {
            _maxAmountAddress = Bids[i].bider;
            _maxAmount = Bids[i].amount;
        }
    }
    
    for (uint j = 0; j <= Bids.length; j++) {
        if (_maxAmountAddress != Bids[j].bider) {
            Bids[j].bider.transfer(Bids[j].amount);
        }
    }
    
    
    owner.transfer(_maxAmount - fee);
    sold = true;
} 


function getMaxBid () public view returns(uint256) {
    return maxBid;
}
}
