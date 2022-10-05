 struct Customer {
    string userName;
    string dataHash;
    address bank;
    int256 upVotes;
}

Customer[] public customers; 

...

...

function getCustomerIndex(string memory userName) internal view returns(bool, uint256) {
    for(uint i=0; i<customers.length; i++) {
        if (stringEquals(customers[i].userName, userName)){
            return (true, i);
        }
    }
    return (false, 0);
}
