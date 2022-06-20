pragma solidity ^0.4.24;

interface iFlightSuretyData {
    function registerOracle(address server, uint8 index1, uint8 index2, uint8 index3) external payable;
}

import "./SafeMath.sol";

contract FlightSuretyApp {
    using SafeMath for uint256;

    bool operationalStatus;
    address owner;
    iFlightSuretyData FlightSecuretyData;

    constructor() public {
        operationalStatus = true;
        owner = msg.sender;
    }

    modifier requireOwner() {
        require(msg.sender == owner, "Owner is required");
        _;
    }

    modifier requireOperational() {
        require(operationalStatus == true, "Contract is not operational");
        _;
    }

    function registerDataContract(address dataContract) external
    requireOwner {
        FlightSecuretyData = iFlightSuretyData(dataContract);
    }

    uint256 constant ORACLE_REGISTRATION_FEE = 1 ether;

    modifier requireOracleRegistrationFee() {
        require(msg.value == ORACLE_REGISTRATION_FEE, "Oracle Registration Cost 1 ether");
    _;
    }

    function registerOracle() external payable
    requireOperational
    requireOracleRegistrationFee {
        (uint8 index1, uint8 index2, uint8 index3) = indexesThrown();
        FlightSecuretyData.registerOracle.value(msg.value)(msg.sender, index1, index2, index3);
    }

    function indexesThrown() private view returns(uint8 _index1, uint8 _index2, uint8 _index3)                
    {
        uint8 index1 = generateIndex1();
        uint8 index2 = generateIndex2(index1);
        uint8 index3 = generateIndex3(index1, index2);
        return (index1, index2, index3);
    }

    function generateIndex1() private view returns(uint8 _index) {
        uint256 mod = 10;
        uint256 time = block.timestamp;
        uint256 difficulty = block.difficulty;
        uint8 value = uint8(SafeMath.mod(uint256(keccak256(abi.encodePacked(time, difficulty, msg.sender))), mod));
        return value;
    }

    function generateIndex2(uint8 _index1) private view returns(uint8 _index) {
        uint256 mod = 10;
        uint256 time = block.timestamp;
        uint256 difficulty = block.difficulty;
        uint8 value = uint8(SafeMath.mod(uint256(keccak256(abi.encodePacked(time, difficulty, msg.sender))), mod));
        while(value == _index1) {
            time = SafeMath.add(time, 500);
            difficulty = SafeMath.add(difficulty, 700);
            value = uint8(SafeMath.mod(uint256(keccak256(abi.encodePacked(time, difficulty, msg.sender))), mod));
        }
        return value;
    }

    function generateIndex3(uint8 _index1, uint8 _index2) private view returns(uint8 _index) {
        uint256 mod = 10;
        uint256 time = block.timestamp;
        uint256 difficulty = block.difficulty;
        uint8 value = uint8(SafeMath.mod(uint256(keccak256(abi.encodePacked(time, difficulty, msg.sender))), mod));
        while((value == _index1) || (value == _index2)) {
            time = SafeMath.add(time, 500);
            difficulty = SafeMath.add(difficulty, 700);
            value = uint8(SafeMath.mod(uint256(keccak256(abi.encodePacked(time, difficulty, msg.sender))), mod));
        }
        return value;
    }
}
