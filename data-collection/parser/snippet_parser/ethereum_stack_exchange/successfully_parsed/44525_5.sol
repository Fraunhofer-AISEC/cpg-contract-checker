pragma solidity ^0.4.21;

contract Shitlist{

    
    mapping(string => uint) countevents;

    
    mapping(string => mapping(uint => string)) database;

    struct Victim {
        address person;
        uint stake;
        uint time;
    }

    
    mapping(address => mapping(string =>Victim)) victimDatabase;

    uint RefundTime;
    uint MinimumStake;

    function Shitlist(uint _refundtime, uint _minimumStake) public {
        RefundTime = _refundtime;
        MinimumStake = _minimumStake;

    }

    function makeClaim(string _name, string _ipfs) payable public {
        
        countevents[_name] += 1;
        database[_name][countevents[_name]] = _ipfs;
        victimDatabase[msg.sender][_name].person = msg.sender;
        victimDatabase[msg.sender][_name].stake = msg.value;
        victimDatabase[msg.sender][_name].time = block.timestamp;
    }

    function checkClaimExists(string _name) view public returns(uint){
        
        if(countevents[_name] == 0)
            return(0);
        else
            return(countevents[_name]);
    }

    function getClaimDetails(string _name, uint _number) view public returns(string){
        require(_number >= 1);
        require( keccak256(database[_name][_number]) != keccak256(""));
        return(database[_name][_number]);
    }

    function refundStake(string _name)  public {
        require(victimDatabase[msg.sender][_name].stake > 0);
        require(victimDatabase[msg.sender][_name].time <= block.timestamp + RefundTime);
        msg.sender.transfer(victimDatabase[msg.sender][_name].stake);

    }

}
