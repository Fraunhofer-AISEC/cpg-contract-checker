   mapping (address => uint) balances;

   event Transfer(address indexed _from, uint256 _value);

   function deposit() public returns (uint) {
      balances[msg.sender] += msg.value;
      Transfer(msg.sender, msg.value);
      return balances[msg.sender];
   }
}
