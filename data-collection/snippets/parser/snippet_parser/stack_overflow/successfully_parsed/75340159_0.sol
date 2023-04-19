contract RandomNumber{

    uint number;

    function get_random() public{
        bytes32 ramdonNumber = keccak256(abi.encodePacked(block.timestamp,blockhash(block.number-1)));
        number = uint(ramdonNumber);
    }
}
