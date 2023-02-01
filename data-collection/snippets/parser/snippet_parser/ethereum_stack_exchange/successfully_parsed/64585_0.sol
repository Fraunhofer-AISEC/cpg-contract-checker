event itemBought(uint256 itemId);

Contract2Interface private contract2Interface;

constructor() public {
    contract2Interface = Contract2Interface('contract address');
}

function buy(uint256 itemId) public payable {
      

    uint256 itemId = contract2Interface.buy(itemId, msg.sender);
    emit itemBought(itemId);
}
