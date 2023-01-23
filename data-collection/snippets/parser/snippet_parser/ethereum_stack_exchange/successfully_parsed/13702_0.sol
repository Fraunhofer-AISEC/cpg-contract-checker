pragma solidity 0.4.8;

contract SimpleContractTest {
    event ReturnValue(address _from, uint256 _value);
    function SimpleContractTest()
    payable
    {

    }
    function myBalanceConstant() constant returns (uint256 amount)
    {
      return msg.sender.balance;
    }
    function contractBalanceConstant() constant returns (uint256 amount)
    {
      return this.balance;
    }
    function myBalancePublic() public returns (uint256 amount)
    {
      ReturnValue(msg.sender, msg.sender.balance);
      return msg.sender.balance;
    }
    function contractBalancePublic() public returns (uint256 amount)
    {
      ReturnValue(msg.sender, msg.sender.balance);
      return this.balance;
    }
}
