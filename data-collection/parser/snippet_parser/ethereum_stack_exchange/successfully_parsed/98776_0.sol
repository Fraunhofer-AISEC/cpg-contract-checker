    contract Lottery{

    uint128 difficulty;
    uint128 immutable public BLOCK_VEST_PERIOD;
    mapping(address => guess) entry;

    struct guess{
        bytes32 guess;
        uint256 vestEnd;
    }

    constructor(uint128 _vestPeriod, uint128 _difficulty){
        BLOCK_VEST_PERIOD = _vestPeriod;
        difficulty = _difficulty;
    }

    function submitEntry(uint128 _x)external{
        entry[msg.sender] = guess(
            keccak256(abi.encodePacked(_x)),           
            block.number + BLOCK_VEST_PERIOD
        );
    }

    
    function claimEntry()external returns(bool){
        require(block.number - entry[msg.sender].vestEnd < 256, "cannot claimEntry if more than 255 blocks have passed");
        require(block.number >= entry[msg.sender].vestEnd, "must wait a few more blocks for vesting to end. For security reasons");
        bytes32 hash = entry[msg.sender].guess;
        for(uint128 i = 0; i < BLOCK_VEST_PERIOD; i++){
            hash = keccak256(abi.encodePacked(
                hash,
                blockhash(i)
                ));
        }
        return hashPuzzle(hash);
    }

    function hashPuzzle(bytes32 _entry) public returns(bool){
        
    }

}
