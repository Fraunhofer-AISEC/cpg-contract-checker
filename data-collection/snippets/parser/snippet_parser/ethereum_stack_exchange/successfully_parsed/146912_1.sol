


pragma solidity >=0.7.0 <0.9.0;


import "./User.sol";

contract CryptoOp is User{

    constructor(){
        smart_contract_owner = msg.sender;
    }    

    function getBalance() public view returns (uint) {
        return address(this).balance;
    }

    function addFund() public isNotExists isValueSufficient payable returns(string memory){
        dataset[msg.sender].owner_balance += msg.value;
        return "Amount deposit successfully";
    }

    function sendFund(address payable receiver, uint _value) public isNotReceiver payable{
        require(dataset[msg.sender].owner_balance >= _value, "You have insufficient balance");
        (bool sent,) = receiver.call{value: _value}("");
        require(sent,"Failed to send");
        dataset[msg.sender].owner_balance-=_value;
        dataset[receiver].owner_balance+=_value;
    }

    function getMyBalance() public view isNotExists returns(uint){
        return dataset[msg.sender].owner_balance;
    }

    receive() external payable {
        dataset[msg.sender].owner_balance += msg.value;
    }

    fallback() external payable {
        dataset[msg.sender].owner_balance += msg.value;
    }

    

}
