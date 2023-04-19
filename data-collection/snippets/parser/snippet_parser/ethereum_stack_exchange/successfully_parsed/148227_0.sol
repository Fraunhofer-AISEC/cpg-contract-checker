
pragma solidity ^0.8.0;


contract GyberStorage{


    address private owner;

    

    address[] private authorizedAddresses;

    

    struct Data{
        uint256 id;
        string dataType;
        address userAddress;
        string link;
    }

    
    mapping(uint256 => Data) private data;

    
    constructor(){
        owner = msg.sender;
    }

    
    modifier onlyOwner(){
        require(msg.sender == owner,'Only owner can call this function');
        _;
    }

    
    modifier onlyAuthorized(){
        
    bool isAuthorized = false;

        
    for (uint i = 0;i < authorizedAddresses.length;i++){
        if (authorizedAddresses[i] == msg.sender){
            isAuthorized = true;
            break;
        }
    }
    
       
    require(isAuthorized,"Not authorized");
    _;

    }

    
    function addAuthorizedAddress(address _address) public onlyOwner {
        authorizedAddresses.push(_address);
    }

    
    function removeAuthorizedAddress(address _address) public onlyOwner {
        for (uint i = 0; i < authorizedAddresses.length; i++){
            if (authorizedAddresses[i] == _address){
                delete authorizedAddresses[i];
            }
        }
    }

    
    function addData(uint256 id, string memory dataType, address userAddress, string memory link) public onlyAuthorized {

        
    require(data[id].id == 0);

        
    data[id] = Data(id, dataType, userAddress, link);

    }

    
    function getData(uint256 id,address userAddress,string memory dataType ) public view returns (uint256, string memory, address , string memory){
        
    require(data[id].id != 0,"Data with this ID does not exist");

        
    return (data[id].id, data[id].dataType, data[id].userAddress, data[id].link);
    }

    
    function updateData(uint256 id, string memory dataType, address userAddress, string memory linkIpfs) public onlyAuthorized{

        
    require(data[id].id != 0,"Data with this ID does not exist");
    
    delete data[id];
    }

}
