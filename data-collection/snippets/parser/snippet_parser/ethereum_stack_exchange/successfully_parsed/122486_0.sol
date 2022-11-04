pragma solidity ^0.8.0;


contract test{

    function fundcontract(uint256 _amount) public payable {
        address(this).balance += _amount;
    }

    function getbalance()public view returns(uint256){
        return address(this).balance;
    }
    function getcontractAddress() public view returns(address){
        return address(this);
    }
}
