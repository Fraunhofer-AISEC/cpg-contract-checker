pragma solidity 0.5.1;

contract MyContract {
    mapping(address => uint256) public balances;
    address payable wallet;
    
    constructor(address payable _wallet) public {
        wallet = _wallet;
    }
    
    function buyToken() public payable{
        
        balances[msg.sender] += 1;
        wallet.transfer(msg.value);
        
    }
}
