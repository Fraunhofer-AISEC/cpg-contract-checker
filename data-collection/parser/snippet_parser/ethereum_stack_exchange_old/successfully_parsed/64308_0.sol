uint public result;
address public owner;

constructor() public {
    owner = msg.sender;
}

function add(uint a, uint b) public returns(uint) {
    result = a + b;
    return result;
}
