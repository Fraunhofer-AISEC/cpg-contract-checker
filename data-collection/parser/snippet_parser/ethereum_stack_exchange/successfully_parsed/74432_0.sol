    pragma solidity ^0.5.0;

    contract ExampleRNG {

        
        uint public seedTrigger; 

        
        uint public registrantCounter;

        
        
        uint[] internal winningSeeds;

        
        uint public winningThreshold; 

        
        bytes32 public latestSeed;

        
        uint public stakes;

        
        struct Tickets {
            uint lower;
            uint upper;
        }

        
        mapping(address => Tickets) public ticketsets;


        constructor(uint _seedTrigger, uint _winningThreshold) public {
            seedTrigger = _seedTrigger;
            winningThreshold = _winningThreshold;
        }

        
        
        function register(uint stake) external {
            require(winningSeeds.length <= winningThreshold, "[!] the registration activity has been closed");

            ticketsets[msg.sender].lower = stakes;
            ticketsets[msg.sender].upper = stakes + stake;

            latestSeed = keccak256(abi.encodePacked(latestSeed, stake));

            stakes = stakes + stake;

            registrantCounter++;

            if (registrantCounter == seedTrigger) {
                uint winningSeed = uint(latestSeed) % stakes;
                winningSeeds.push(winningSeed); 
                registrantCounter = 0;
            }
        }

        function revealWinningSeeds() external view returns(uint[] memory) {
            return(winningSeeds);
        }
    }
