
pragma solidity ^0.8.19;

contract sendMonetSolidity{
    uint public receiveBalance;

    
    function sendMoney()public payable{
        receiveBalance += msg.value;
    }

    function getBalance()public view returns(uint){
        return address(this).balance;
    }


    function withdrawMoney() public {
        payable(msg.sender).transfer(this.getBalance());
    }

    function sendMoneyToSpecidicAddress(address payable _to) public{
        _to.transfer(this.getBalance());
    }


    
}
