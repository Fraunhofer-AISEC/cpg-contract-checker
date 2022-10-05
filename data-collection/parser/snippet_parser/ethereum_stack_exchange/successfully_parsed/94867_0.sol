

pragma solidity 0.7.6;

contract XPrize {
    
    struct Contest {
        uint prizeMoney;
        bool claimed;
    }
    
    mapping(bytes32 => Contest) public contests;
    
    event NewContest(address sender, bytes32 contestId, uint prizeMoney);
    event PrizeClaimed(address winner,bytes32 secret, bytes32 contestId, uint prizeMoney);
    
    
    function newContest(bytes32 contestId) public payable { 
        Contest storage c = contests[contestId];
        require(c.prizeMoney == 0, "contest is already defined.");
        require(msg.value > 0, "send money");
        c.prizeMoney = msg.value;
        emit NewContest(msg.sender, contestId, msg.value);
    }
    
    
    function claimPrize(bytes32 secret) public {
        bytes32 key = hashHelper(secret);
        Contest storage c = contests[key];
        require(c.prizeMoney > 0, "there is no prize money there");
        require(!c.claimed, "already paid out");
        c.claimed = true;
        emit PrizeClaimed(msg.sender,secret, key, c.prizeMoney);
        msg.sender.transfer(c.prizeMoney);
    }
    
    
    function hashHelper(bytes32 secret) public view returns(bytes32) {
        return keccak256(abi.encodePacked(secret, address(this)));
    }
    
}
