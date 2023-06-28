


pragma solidity ^0.8.0;


import "@solidstate/contracts/proxy/diamond/SolidStateDiamond.sol";

contract Crud is SolidStateDiamond {
    function getSelector(
        string calldata _funcSignature
    ) external pure returns (bytes4) {
        return bytes4(keccak256(bytes(_funcSignature)));
    }
}
