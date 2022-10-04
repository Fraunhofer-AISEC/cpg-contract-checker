

pragma solidity >=0.7.1;

contract Campaign {
    struct Status {
        uint32 cost;
        mapping(uint256 => address) jobs; 
    }
    
    struct Provider {
            mapping(string => Status[]) jobStatus;
    }
    
    mapping(address => Provider) providers;

    function submit(string memory key) public {
         Provider storage provider = providers[msg.sender];
         provider.jobStatus[key].push(Status({cost:100}));
    }
}
