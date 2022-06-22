pragma solidity 0.5.0;

contract InterableMapping {

    address[] public addressList;
    mapping(address => bool) public isAddress;

    function insertAddress(address customer) public {
        require(!isAddress[customer]);
        addressList.push(customer);
        isAddress[customer] = true;
    }

    function getAddressCount() public view returns(uint count) {
        return addressList.length;
    }
}
