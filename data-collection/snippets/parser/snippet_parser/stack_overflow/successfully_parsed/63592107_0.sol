import "./provableAPI.sol"; 
import "./Ownable.sol";

contract Coinflip is usingProvable, Ownable {

    struct CoinflipSession {
        uint betAmount;
    }

    uint public balance;
    uint256 constant NUM_RANDOM_BYTES_REQUESTED = 1;
    uint256 public latestNumber;

    event LogNewProvableQuery(string description);
    event generateRandomNumber(uint256 randomNumber);
    event betTaken(uint betAmount);
    event winPayout(uint betAmount);


    constructor() public {
        update();
    }

    
    mapping (address => CoinflipSession) private session;

    modifier costs(uint cost){
        require(msg.value >= cost);
        _;
    }


    function __callback(bytes32 queryId, string memory _result, bytes memory _proof) public {
        require(msg.sender == provable_cbAddress());

        uint256 randomNumber = uint256(keccak256(abi.encodePacked(_result))) % 2;
        latestNumber = randomNumber;
        emit generateRandomNumber(randomNumber);
    }


    function update() payable public {
        uint256 QUERY_EXECUTION_DELAY = 0;
        uint256 GAS_FOR_CALLBACK = 200000;
        provable_newRandomDSQuery(
            QUERY_EXECUTION_DELAY,
            NUM_RANDOM_BYTES_REQUESTED,
            GAS_FOR_CALLBACK
        );
    }

    function addContractFunds() public payable{
        balance += msg.value;
    }

    function intakeToken() public payable costs(1 wei){
        
        balance += msg.value;
        CoinflipSession memory newSession;  

        newSession.betAmount = msg.value;

        address creator = msg.sender;
        session[creator] = newSession;

        emit betTaken(newSession.betAmount);
    }

    function flipCoin() public returns(uint) {
        
        if (random() == 0) {
            return 0;
        } 
        resetBalance();
        return 1;
    }

    function resetBalance() private {
        session[msg.sender].betAmount = 0;
    }

    function handleWinPayout() public payable {

        balance -= session[msg.sender].betAmount *2;
        uint toTransfer = session[msg.sender].betAmount*2;
        msg.sender.transfer(toTransfer);
        

        emit winPayout(session[msg.sender].betAmount * 2);

        resetBalance();
    }
   

    function random() public view returns (uint) {
        return now % 2;
    }  
}
