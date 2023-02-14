contract University { 
    address public owner; 
    address public student; 
    bytes32 fName; 
    bytes32 lName; 
    bytes32 Studies; 
    bytes32 private caCertificate; 
    bytes32 ipfs_hash;

    constructor() public { 
        owner = msg.sender; 
    } 

     modifier onlyOwner() { if (msg.sender == owner) _; } 
     modifier onlyOwnerOrStudent() { 
         if (msg.sender == owner || msg.sender == student) _; 

    .....
}
