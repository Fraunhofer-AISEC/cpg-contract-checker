
pragma solidity ^0.8.0;

contract MyContract {
    
    mapping(address => uint64) public balances;

    function deposit() public payable {
        
        assert( uint64(msg.value) + balances[msg.sender] - balances[msg.sender] == uint64(msg.value) );

        balances[msg.sender] += uint64(msg.value);
    }

    function withdrawTo(address payable _to, uint64 _amount) public {
        require(balances[msg.sender] >= _amount, "Insufficient funds");
        assert(balances[msg.sender] >= balances[msg.sender] - _amount);
        balances[msg.sender] -= _amount;
        _to.transfer(_amount);
    }
}
