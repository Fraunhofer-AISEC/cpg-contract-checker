
pragma solidity ^0.8.0;
pragma abicoder v2;

contract test {

    struct Part {
        address payable account;
        uint96 value;
    }

     struct DataV2 {
        Part[] payouts;
        Part[] originFees;
        bool isMakeFill;
    }

    event log(DataV2 data);
    function get(bytes memory data) public {
        emit log(abi.decode(data, (DataV2)));
    }

}
