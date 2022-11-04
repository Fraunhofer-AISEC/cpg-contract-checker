pragma solidity ^0.8.16;
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";

contract SharedWallet is Ownable{

    mapping(address => uint) public allowance;

    fallback () external payable{
        
    }
    
    receive () external payable {

    }

    modifier ownerOrAllowed(uint _amount) {
        requiredCondition(uint _amount);
        _;
    }

    function requiredCondition(uint _amount) public {
        require(_checkOwner() || allowance[msg.sender] >_amount,"You are not allowed!");
    }

    function addAllowance(address _who, uint _amount) public onlyOwner{
        allowance[_who] = _amount;
    }

    function withdrawMoney(address payable _to, uint _amount) public ownerOrAllowed(_amount){
        _to.transfer(_amount);
    }
}

