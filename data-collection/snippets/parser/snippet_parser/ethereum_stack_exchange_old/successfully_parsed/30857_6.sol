struct Address {
    address[] addressList;
}

function createProposal() public {
    address[] memory emptyAddressList;
    Address memory _address = Address({
       addressList: emptyAddressList
    })
}
