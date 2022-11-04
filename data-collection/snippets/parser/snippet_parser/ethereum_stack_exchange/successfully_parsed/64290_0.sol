contract Test {

   address[] investors;
   mapping(address => uint256) private balances;

   function saveAddress() payable public {
       investors.push(msg.sender);
       balances[msg.sender] = msg.value;
   }
}
