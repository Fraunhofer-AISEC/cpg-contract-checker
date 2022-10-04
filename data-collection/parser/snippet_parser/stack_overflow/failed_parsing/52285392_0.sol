address public owner;

modifier onlyOwner() {
    require(msg.sender == owner, "Owner account is required");
    _;
}

constructor() public {
    owner = msg.sender;
}

function doStuff()
external
view
onlyOwner
returns (bool) {
    return true;
}
