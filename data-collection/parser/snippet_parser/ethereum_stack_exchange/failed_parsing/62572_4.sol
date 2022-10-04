address[] public addressList;
mapping (address => bool) public userAddr;
mapping (bytes32 => bool) public doesHashExist; 


    function insertAddress(address[] addressUser) public returns (bool) 
    {
        bytes32 newHash = keccak256(addressUser);
        require(!doesHashExist[newHash]);
        for (uint256 i = 0; i < addressUser.length; i++) {
                push addressUser to addressList
                insert addressUser to userAddr
            }
        }
        doesHashExist[newHash] = True;
        return true;
    }
