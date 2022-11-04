
    struct ResponseInfo {
        address requester; 
        bool isOpen; 
        mapping(uint8 => address[]) responses; 
    }

    
    
    mapping(bytes32 => ResponseInfo) private oracleResponses;


function fetchFlightStatus(address airlineID, string memory flight, uint256 timestamp) external requireIsOperational {
        uint8 index = getRandomIndex(msg.sender);

        
        bytes32 key = keccak256(abi.encodePacked(index, airlineID, flight, timestamp));
        oracleResponses[key] = ResponseInfo({
            requester: msg.sender,
            isOpen: true
        });
        emit OracleRequest(index, airlineID, flight, timestamp);
    }
