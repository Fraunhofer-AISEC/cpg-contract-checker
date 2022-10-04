 receive() external payable {
    
    require(paidWei % priceInWei == 0, "Sorry, partial payments are not accepted!");
   
    paidWei += msg.value;
    numberPaid = msg.value/priceInWei;
    require(quantity >= numberPaid, "Sorry, there is not enough stock to fulfill this order");
    quantity -= numberPaid;
     
    (bool success, ) = address(parentContract).call{value:msg.value}(abi.encodeWithSignature("triggerPayment(uint256, uint256, address)", index, numberPaid, msg.sender));
    require(success, "Payment processing failed, please contact the owner");
}
