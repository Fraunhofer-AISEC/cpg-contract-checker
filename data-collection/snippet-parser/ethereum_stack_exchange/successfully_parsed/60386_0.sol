pragma solidity ^0.4.23;

contract Hotelbooking{

    address receiver;
    function deposit(uint256 _amount) payable public {
        require(msg.value == _amount);
        
    }

    function Execution (address _Address, uint _Amount) {
           receiver = _Address;
           receiver.transfer(_Amount);
       }
    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
}
