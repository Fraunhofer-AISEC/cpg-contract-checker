pragma solidity ^0.8.1;

contract SendMoney{
    uint public publicBalance;
    uint public lockedUntil;

    function receiveMoney() public payable{
        publicBalance += msg.value;
        lockedUntil = block.timestamp + 1;
    }

    function getBalance() public view returns(uint){
        return address(this).balance;
    }

    function withdrawMoney() public{
        if(lockedUntil < block.timestamp){
            address payable to  = payable(msg.sender);
            to.transfer(getBalance());
        }
    }

    function withdrawMoneyTo(address payable _to) public{
        if(lockedUntil < block.timestamp){
            _to.transfer(getBalance());
        }
    }
}
