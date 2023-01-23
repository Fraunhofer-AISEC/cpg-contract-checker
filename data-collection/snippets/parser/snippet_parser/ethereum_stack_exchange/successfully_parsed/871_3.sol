

function removeCustomer(string calldata userName) external returns (uint8) {
        (bool result, uint256 index) = getCustomerIndex(userName);
        if (result){
            for (uint i=index+1; i<customers.length-1; i++){
                customers[i-1] = customers[i];
            }
            customers.length--;
            return 1;
        }
        return 0;
    }
