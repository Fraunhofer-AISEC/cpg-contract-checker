
pragma solidity ^0.8.0;


contract DataStorage {

    
    address private owner;

    
    mapping(address => bool) private authorizedAddresses;

    
    struct Data {
        string dataType;
        string data;
    }

    
    mapping(string => mapping(address => Data)) private dataByType;

    
    constructor() {
        owner = msg.sender;
    }

    
    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this function");
        _;
    }

    
    modifier onlyAuthorized() {
        require(authorizedAddresses[msg.sender], "Not authorized");
        _;
    }

    
    function addAuthorizedAddress(address _address) public onlyOwner {
        authorizedAddresses[_address] = true;
    }

    
    function removeAuthorizedAddress(address _address) public onlyOwner {
        authorizedAddresses[_address] = false;
    }

    
    function storeData(string memory dataType, string memory data) public onlyAuthorized {
        dataByType[dataType][msg.sender] = Data(dataType, data);
    }

    
    function retrieveData(string memory dataType, address userAddress) public view returns (string memory) {
        return dataByType[dataType][userAddress].data;
    }

}
