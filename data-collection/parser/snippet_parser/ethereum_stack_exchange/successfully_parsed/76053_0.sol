contract Diary {
    string[] private facts;
    mapping (address => bool) approvedAddresses;
    address owner;

    constructor() public {
        owner = msg.sender;
        approvedAddresses[0xca35b7d915458ef540ade6068dfe2f44e8fa733c] = true;
    }
}