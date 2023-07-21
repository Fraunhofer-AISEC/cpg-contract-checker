 struct Test1 {
        address wallet_address;
        uint256 counts;
    }
    
    mapping(address => uint256) public nftOwners;

   function storeWalletAddress(Test1[] memory _arr) public  {
        require(_arr.length > 0, "array length issue");
        for (uint i = 0; i < _arr.length; i++) {
            address owner = _arr[i].wallet_address;
            nftOwners[owner] = _arr[i].counts;
        }
    }
