contract VelixIDToken is ReleasableToken, BurnableToken {
    ...

    function transfer(address _to, uint _value) public returns (bool success) {
        
        CanTransferChecked(released || transferAgents[msg.sender], msg.sender, transferAgents[msg.sender], released);
        if (released || transferAgents[msg.sender]) {
            return super.transfer(_to, _value);
        } else {
            return false;
        }
    }

    ...
}

contract ReleasableToken is ERC20, Ownable {
    ...

    function transfer(address _to, uint _value) public returns (bool success) {
        
        CanTransferChecked(released || transferAgents[msg.sender], msg.sender, transferAgents[msg.sender], released);
        if (released || transferAgents[msg.sender]) {revert();}
        return super.transfer(_to, _value);
    }

    ...
}
