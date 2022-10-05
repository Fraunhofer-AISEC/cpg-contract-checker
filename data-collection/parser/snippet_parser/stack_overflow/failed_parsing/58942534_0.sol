mapping (address=>bool) addr_mapping;

function transferToken(address sender, address receiver) public{
    require(addr_mapping[sender] == true, "Sender not in mapping");
    require(addr_mapping[receiver] == true, "Receiver not in mapping");
    ...
}

function addToMapping(address addr) onlyOwner {
    ...
}
