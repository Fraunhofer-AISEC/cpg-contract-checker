function paySubscription(address receiverAddress, uint256 amount) external onlyOwner {
    receiverAddress.transfer(amount);

}

function payAllSubs(address[] memory receivers, uint256[] amounts) external onlyOwner {
       for (uint i=0; i<receivers.length; i++) {
          address currAddress = receivers[i];
          uint256 amt = amounts[i]
          this.paySubscription(currAddress, amt);
      }
    
}
