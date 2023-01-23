contract Safe {
   mapping(address => uint) public userBalances;
   
   function deposit() public payable {
       userBalances[msg.sender] += msg.value;
   }

   function withdraw(uint _amount) public {
       require(userBalances[msg.sender] >= _amount, "low balance");
       payable(msg.sender).call({value: _amount});
       userBalances[msg.sender] -= _amount;
   }
}
