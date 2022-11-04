pragma solidity ^0.4.24;

contract TestContract {

    function() external payable { }

    function payContract() public payable {}

    function paySomeone(address _address, uint256 _amount) external {
         _address.transfer(_amount);
    }

    function getBalance() public view returns (uint256) {
         return address(this).balance;
   }

}
