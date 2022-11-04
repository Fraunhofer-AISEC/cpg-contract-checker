pragma solidity 0.5.6;
pragma experimental ABIEncoderV2;

contract Hash{

    uint256[][] public data;

    function append(uint _a, uint _b) public {
        data.push([_a, _b]);
    }

    function hash(uint256 _idx, string memory _b) public view returns(bytes32) {
        return keccak256(abi.encodePacked(data[_idx], _b));
    }
}
