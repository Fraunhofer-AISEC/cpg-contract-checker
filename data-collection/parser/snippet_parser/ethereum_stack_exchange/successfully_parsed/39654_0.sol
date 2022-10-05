contract Ownable {
    mapping(address => bool) public owner;
    event AddedOwner(address newOwner);
    event RemovedOwner(address removedOwner);

    
    function Ownable() public {
        owner[msg.sender] = true;
    }

    
    modifier onlyOwner() {
        require(owner[msg.sender]);
        _;
    }

    function addOwner(address _newOwner) onlyOwner public {
        require(_newOwner != 0);
        owner[_newOwner] = true;
        AddedOwner(_newOwner);
    }

    function removeOwner(address _toRemove) onlyOwner public {
        require(_toRemove != 0);
        require(_toRemove != msg.sender);
        owner[_toRemove] = false;
        RemovedOwner(_toRemove);
    }
}
