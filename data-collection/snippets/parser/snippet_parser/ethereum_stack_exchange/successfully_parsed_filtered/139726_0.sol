
function withdraw() public onlyOwner {
   uint balance = address(this).balance;
   msg.sender.transfer(balance);
}



function withdrawMoney() external onlyOwner {
   (bool success, ) = msg.sender.call{ value: address(this).balance } ("");
   require(success, "Transfer failed.");
}
