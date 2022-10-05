pragme ^0.7.0;

interface ERC20Token {...};

contract MyEscrow {
  address payable seller;
  address payable buyer;
  uint256 sellerRefund;
  uint256 buyerRefund;
  address addressToken;

  function depositEscrow(uint256 _amount) external returns (bool) {
    ERC20Token(addressToken).transferFrom(msg.sender, address(this), _amount);  
    
  }

  function refundEscrow() sellerOnly external returns (bool) {
      ERC20Token(addressToken).transfer(seller, sellerRefund);
      ERC20Token(addressToken).transfer(buyer, buyerRefund);
      
  }

}
