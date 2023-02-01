struct Flat {
    uint256 priceInWei;
    address currentOccupant;
    bool flatIsAvailable;
}


Flat[8] public flatDB;

modifier landlordOnly() {
    require(msg.sender == landlordAddress);
    _;
}

constructor() public {
landlordAddress = msg.sender;
for (uint i=0; i<8; i++) {
    flatDB[i].flatIsAvailable = true;
    if (i % 2 == 0) {
        flatDB[i].priceInWei = 0.1 ether;
    } else {
        flatDB[i].priceInWei = 0.2 ether;
    }
  }
}

uint256[] array;
    
function getFlatDB() payable public returns (uint256) {
    
    for (uint i=0; i<8; i++) {
        array.push(flatDB[i].priceInWei);
    }
    return array;
}
