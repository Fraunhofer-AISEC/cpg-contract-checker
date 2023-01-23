function ConcatenateArrays(address[] Accounts, address[] Accounts2) returns(address[]) {
    address[] memory returnArr = new address[](Accounts.length + Accounts2.length);

    uint i=0;
    for (; i < Accounts.length; i++) {
        returnArr[i] = Accounts[i];
    }

    uint j=0;
    while (j < Accounts.length) {
        returnArr[i++] = Accounts2[j++];
    }

    return returnArr;
} 
