uint256 requiredAmount = 1 ether;

function myPayableFunc() external payable {
    
    require(msg.value > requiredAmount); 

    

    
    if (address(this).balance > requiredAmount) {
        uint256 refundAmount = address(this).balance - requiredAmount;
        address(msg.sender).call{ value: refundAmount }("");
    }
}
