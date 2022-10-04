uint public sellPrice =0.5;


function setPrices(uint newSellPrice) public onlyOwner {
    sellPrice = newSellPrice;
}


function buy(uint256 payload) public payable {
    uint amount = safeDiv(msg.value, sellPrice);               
   

    transferFrom(owner, msg.sender, amount);


}
