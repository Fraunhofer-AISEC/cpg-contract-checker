pragma solidity >=0.4.17;
contract B {
    address private owner;

    constructor (
        address _owner
    ) 
        public
    {
        owner = _owner;
    }

    function logData(
        bytes32 data,
        uint    timestamp
    )
        public
        returns(bool res)
    {
        ...
    }

    ...
