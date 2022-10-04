
pragma solidity 0.8.0;

contract Raffle {
    struct Commitments {
        bytes32 commitment;
        uint256 blockNumber;
    }

    mapping(address => Commitments) commitments;
    mapping(uint256 => address) reserved;

    function commit(bytes32 hash) external {
        require(commitments[msg.sender].commitment == bytes32(0), "Already committed");
        commitments[msg.sender] = Commitments(hash, block.number);
    }

    function reveal(uint256 nonce, uint256 value) external {
        bytes32 d = digest(nonce, value, msg.sender);
        require(commitments[msg.sender].commitment == d, "Invalid data");
        if (reserved[value] == address(0)) {
            reserved[value] = msg.sender;
        } else if (commitments[reserved[value]].blockNumber > commitments[msg.sender].blockNumber) {
            reserved[value] = msg.sender;
        } else {
            revert('Already reserved');
        }
    }

    function digest(uint256 nonce, uint256 value, address sender) public pure returns (bytes32) {
        return keccak256(abi.encodePacked(nonce, value, sender));
    }
}
