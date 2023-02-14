function addAddress(address _user) external {
    address result;
    assembly {
        let address := mload(0x40)
        ...
        result := create(0, address, 0x37)
    }
    addressList[_user].push(result);
}
