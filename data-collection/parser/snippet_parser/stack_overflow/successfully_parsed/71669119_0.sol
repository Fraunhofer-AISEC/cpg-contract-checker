
pragma solidity ^0.8.4;

interface ITargetContract {
    function addWhitelist(bytes32 _something, string memory _id)
        external;
}

contract MyContract {
    function addWhitelist(
        address _t,
        bytes32 _something,
        string memory _id
    ) public {
        ITargetContract(_t).addWhitelist(_something, _id);
    }
}
