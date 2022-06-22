pragma solidity ^0.8.0;


contract ReceivedEther {

    function transferEther(address payable _recipient, uint _amount) external returns (bool) {
        require(address(this).balance >= _amount, 'Not enough Ether in contract!');
        _recipient.transfer(_amount);
        return true;
    }
    
    
    function contractBalance() external view returns (uint) {
        return address(this).balance;
    }
}
