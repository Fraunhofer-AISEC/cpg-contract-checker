pragma solidity ^0.8.16;

contract FunctionExample{
    mapping(address => uint) public balanceReceived;

    address payable owner;

    constructor() {
        owner = payable(msg.sender);
    }

    function destroySmartContract() public{
        require(msg.sender == owner,"Only Owner is allowed to do this!");
        selfdestruct(owner);
    }





    function getOwner() public view returns(address){
        return owner;
    }



    function convertWeiToEther(uint _amountInWei) public pure returns(uint){
        return _amountInWei/1 ether;
    }

    function recieveMoney() public payable {

        assert(balanceReceived[msg.sender] + msg.value >= balanceReceived[msg.sender]);
        balanceReceived[msg.sender] += msg.value;
    }

    function withdrawMoney(address payable _to, uint _amount) public{
        require(balanceReceived[msg.sender] >= _amount,"You dont have enough funds!!");
        assert(balanceReceived[msg.sender] >= balanceReceived[msg.sender] - _amount);
        _to.transfer(_amount);
        balanceReceived[msg.sender] -= _amount;
    }

    fallback () external payable {
        recieveMoney();
    }

    receive () external payable {
        
    }


}
