import "./SafeMath.sol";

contract FlightSuretyData {
    using SafeMath for uint256;

    bool operationalStatus;
    address owner;
    address appContract;

    constructor() public {
        operationalStatus = true;
        owner = msg.sender;
        airlines[owner].registrationStatus = true;
    }

    modifier requireOwner() {
        require(msg.sender == owner, "Require contract owner");
        _;
    }

    modifier requireApplication() {
        require(msg.sender == appContract, "Require application");
        _;
    }

    modifier requireOperational() {
        require(operationalStatus == true, "Contract is not operational");
        _;
    }

    function registerApplicationContract(address application) external
    requireOwner
    requireOperational {
        appContract = application;
    }

    struct oracle {
        uint8 index1;
        uint8 index2;
        uint8 index3;
        mapping(bytes32 => bool) voteState;
    }

    struct oracleServer {
        mapping(uint256 => oracle) oracles;
        uint256 numberOfOracles;
    }

    mapping(address => oracleServer) private oracleServers;

    function registerOracle(address server, uint8 index1, uint8 index2, uint8 index3) external payable
    requireOperational
    requireApplication {
        uint256 counter = oracleServers[server].numberOfOracles;
        oracleServers[server].oracles[counter].index1 = index1;
        oracleServers[server].oracles[counter].index2 = index2;
        oracleServers[server].oracles[counter].index3 = index3;
        counter = SafeMath.add(counter, 1);
        oracleServers[server].numberOfOracles = counter;
    }
}
