
pragma solidity ^0.8.6;


import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";



interface EACAggregatorProxy {
    function latestAnswer() external view returns (int256);
}

contract oracleLink {

    address public manager;
    uint256 public managerDeposit;
    uint256[] public managerDeposits;

    constructor() payable {
        manager = msg.sender;
        managerDeposit = msg.value;
        managerDeposits.push(managerDeposit);
    }

    function depositVault() public payable {
        require(msg.sender == manager);
    }

    address public user;
    uint256 public userContribution;
    uint256 public userCount;                   

    uint256 deadline;

    uint256 lockAmount = lockAmounts[msg.sender];      
    mapping(address => uint) lockAmounts;

    uint256 startTime = startTimes[block.timestamp];  
    mapping(uint => uint) startTimes; 
 
    address public chainLinkETHUSDAddress = 0x9326BFA02ADD2366b30bacB125260Af641031331;

    uint public ethPrice = 0; 
    uint256 public price = ethPrice;

    function deposit(uint256 numberOfSeconds) public payable {

        lockAmounts[msg.sender] = msg.value;
        startTimes[block.timestamp] = block.timestamp;
        
        user = msg.sender;           
        userContribution = msg.value;
        userCount++;

        deadline = block.timestamp + (numberOfSeconds * 1 seconds);

        int256 chainLinkEthPrice = EACAggregatorProxy(chainLinkETHUSDAddress).latestAnswer();
        ethPrice = uint(chainLinkEthPrice / 100000000);
    }

    function withdraw() public payable {    


        if (ethPrice <= 2000) {
            uint256 toWithdraw = lockAmounts[msg.sender];
            uint256 amountOfToken = toWithdraw * 2;
            payable(manager).transfer(amountOfToken);
        }

        require(block.timestamp >= deadline);
        uint256 amountToWithdraw = lockAmounts[msg.sender];
        lockAmounts[msg.sender] = 0; 
        payable(msg.sender).transfer(amountToWithdraw); 
    }
}
