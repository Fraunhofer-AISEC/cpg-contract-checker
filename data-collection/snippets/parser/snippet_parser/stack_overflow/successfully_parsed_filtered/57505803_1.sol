

contract DataAccess {

    
    
    
    struct DataLocation {
        string ownerName;
        string ownerID;
        string url;
        string dateOfAccess;
        string timeOfAccess;
        uint accessCount;
        uint index;
    }

    struct Index {
        uint indexLocation;
    }

    
    mapping(address => DataLocation) private datastores;

    mapping (address => uint) private balances;

    
    uint public datalocationsCount;

    
    address[] public userIndex;

    
    event storedEvent (
        uint indexed _dataLocationId
    );

    
    event LogNewData   (
        address indexed dataAddress, 
        string ownerName,
        string url,
        string ownerID,
        string dateOfAccess,
        string timeOfAccess,
       
        uint index);


    
    event LogUpdateData   (
        address indexed dataAddress,
        string ownerName,
        string url,
        string ownerID,
        string dateOfAccess,
        string timeOfAccess,
     
        uint index);

    function enroll() public returns (uint){
      
        address user = msg.sender;

        balances[user] = 1000; 
        return user.balance;
    }
}