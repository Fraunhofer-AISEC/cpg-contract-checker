mapping(address => uint) public balanceReceived;

function withdrawMoney(address _to, uint _amount) payable public {
   require(balanceReceived[msg.sender] - _amount > 0, "You do not have the funds");
}
