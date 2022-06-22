struct EnContract {
    uint price;
    uint amount;
    string energysource;
    address owner;
}

EnContract[] public encontracts;

mapping (uint => address) public contractToOwner;
mapping (address => uint) public ownerContractCount;

function _createContract(uint _price, uint _amount, string _energysource) internal {
    uint id = encontracts.push(EnContract(_price, _amount, _energysource, msg.sender)) - 1;
    contractToOwner[id] = msg.sender;
    ownerContractCount[msg.sender]++;
}

function createContract(uint _price, uint _amount, string _energysource) public {
    require(ownerContractCount[msg.sender] == 0);
    _createContract(_price, _amount, _energysource);
}
}
