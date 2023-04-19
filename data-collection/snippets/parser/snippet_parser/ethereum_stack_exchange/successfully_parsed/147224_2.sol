contract User {
    
    address userAddress;
    uint16 userReputation;
    string userName;

    constructor(address adr, string memory name) {
        userAddress = adr;
        userName = name;
        userReputation = 0;
    }

    function getUserAddress() public view returns (address) {
        return userAddress;
    }

    function getUserReputation() public view returns (uint16) {
        return userReputation;
    }

    function setUserReputation(uint16 reputation) public {
        userReputation = reputation;
    }

    function getUserName() public view returns(string memory) {
        return userName;
    }

    function setUserName(string memory name) public {
        userName = name;
    }

}
