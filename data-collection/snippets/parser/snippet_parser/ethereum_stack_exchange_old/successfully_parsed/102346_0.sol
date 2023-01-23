
pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/math/SafeMath.sol";


contract DeploymentExample is Ownable {
    using SafeMath for uint;

    mapping(address  => uint) public balances;
    uint public totalDeposited;

    event Deposited(address indexed who, uint amount);
    event Withdrawn(address indexed who, uint amount);

    
    receive() external payable {
        depositEther();
    }

    
    function depositEther() public payable {
        require(msg.value > 0);
        balances[msg.sender] = balances[msg.sender].add(msg.value);
        totalDeposited = totalDeposited.add(msg.value);
        emit Deposited(msg.sender, msg.value);
    }

    
    function withdraw(uint _amount) public  {
        require(balances[msg.sender] >= _amount);
        balances[msg.sender] = balances[msg.sender].sub(_amount);
        totalDeposited = totalDeposited.sub(_amount);
        msg.sender.transfer(_amount);
        emit Withdrawn(msg.sender, _amount);
    }

    
    function kill() public onlyOwner {
        
        address payable payableOwner = address(uint160(owner()));
        selfdestruct(payableOwner);
    }
}
