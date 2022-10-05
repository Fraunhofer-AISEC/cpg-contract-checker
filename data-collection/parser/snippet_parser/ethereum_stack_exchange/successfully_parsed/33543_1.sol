address[]   public sellers;
mapping (address => uint256) public arrayIndexes;
function addAddress(address _addr) public {
    uint id = sellers.length;
    arrayIndexes[_addr] = id;
    sellers.push(_addr);
}

function removeAddress(address _addr) public {
    uint id = arrayIndexes[_addr];
    delete sellers[id];
}
