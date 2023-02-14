   function payMultipleUsers(address tokenAddress, address[] memory users, uint256[] memory payments) external returns (address[] memory notPaid) {
        
        

        require(users.length == payments.length, "Wrong parameters");
        
        
        
        address[] notPaid = new address[](users.length); 
        uint auxIndex;
        
        
        for (uint i = 0; i < users.length; i++) {
            (bool paid,) = address(tokenAddress).call(
                abi.encodeWithSignature("transferFrom(address,address,uint256)", tokenAddress, users[i], payments[i])
            );
            if (!paid) {
                notPaid[auxIndex] = users[i];
                auxIndex++;
            }
        }
        
        return notPaid;
    }
