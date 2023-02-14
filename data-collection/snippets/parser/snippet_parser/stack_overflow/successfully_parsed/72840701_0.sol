mapping(address => uint256) public transactions;
address public owner;
address[] public transList;    

constructor() {
    owner = msg.sender;
}

modifier isOwner() {
    require(msg.sender == owner, "Sender is not Owner");
    _;
}


function whoIsOwner() public isOwner view returns (address) {
    return owner;
}

uint256 public total =0;
uint256 public current_total =0;

function add(uint256 _amount) isOwner public{
    total = total + _amount;
    transList.push(msg.sender);
    transList.push("add");                 
    transList.push(_amount);
}
