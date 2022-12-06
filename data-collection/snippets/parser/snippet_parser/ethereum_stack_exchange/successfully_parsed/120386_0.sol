mapping(address => uint) public bidderAmount;
address[] public bidders;

function bulkTransfer() external onlyAdmin {
   for(uint i = 0;i <= bidders.length - 1;i++){
       payable(bidders[i]).transfer(bidderAmount[bidders[i]]);
   }
}
