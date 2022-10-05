contract Owned {
    address public contractOwner;

    constructor() public {
        contractOwner = msg.sender;
    }

    modifier requireContractOwner() {
        require(msg.sender == contractOwner, "Caller is not contract owner");
        _;
    }
}
