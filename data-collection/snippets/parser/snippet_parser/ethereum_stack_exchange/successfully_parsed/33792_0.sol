contract xyz {
    mapping(address => bool) Users;
    function add(address userAddress) {
            require(userAddress != 0x0 && !Users[userAddress]);             
            Users[userAddress] = true;    
    }
    function pass(address passAddress) returns (bool) {   
        return Users[passAddress];
    }
}

contract SaveData {
    address[] addrs;
    string[] hashSet;
    xyz asd = xyz();
    function Save(address PubAddress) {
        require(asd.pass(PubAddress)==true);
        addrs.push(PubAddress);    

    }

    function saveHash(string hashStr) {
        hashSet.push(hashStr);
    }
}
