contract Raffle {

    mapping(address => bytes32) commitments;
    mapping(uint256 => address) reserved;
    mapping(bytes32 => address) commitOwners; 

    event Reserved(uint256 value, address owner);
    event Committed(bytes32 hash);

    function commit(bytes32 hash) public {
        require(commitments[msg.sender] == bytes32(0), "Already committed");
        require(commitOwners[hash] == address(0), "I HATE YOU FRONT RUNNER!"); 
        commitments[msg.sender] = hash;
        commitOwners[hash] = msg.sender;
        emit Committed(hash);
    }

    function reveal(uint256 nonce, uint256 value) public {
        bytes32 d = digest(nonce, value); 
        require(commitments[msg.sender] == d, "Invalid data");
        require(reserved[value] == address(0), "Already reserved");
        reserved[value] = msg.sender;
        emit Reserved(value, msg.sender);
    }

    
    function digest(uint256 nonce, uint256 value) public pure returns (bytes32) {
        return keccak256(abi.encodePacked(nonce, value));
    }
}
