pragma solidity >=0.7.0;
pragma experimental ABIEncoderV2;

contract Payback {
    struct Address {
        uint256 id;
        string name;
        address _address;
    }

    Address[] addresses;

    function addAddress() external {
        Address memory newAddress = Address(
            1,
            "Test",
            0xDEE7796E89C82C36BAdd1375076f39D69FafE252
        );
        addresses.push(newAddress);
    }

    function getAddress() external view returns (Address memory) {
        return addresses[0];
    }
}
