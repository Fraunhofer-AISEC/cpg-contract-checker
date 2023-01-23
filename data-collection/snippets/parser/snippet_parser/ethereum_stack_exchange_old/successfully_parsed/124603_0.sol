

pragma solidity ^0.6.6;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@chainlink/contracts/src/v0.6/interfaces/AggregatorV3Interface.sol";

contract votingContract is Ownable{

    mapping(string => uint) public candidateToSupporters;
    mapping(string => mapping(address => uint)) public candidateToFunds;
    mapping(string => bool) public candidateToExistence;
    bool public voted = false;
    AggregatorV3Interface public priceFeedAddress;
    uint public MINIMUM_DEPOSIT = 10 * (10 ** 18);

    struct Candidate{
        string name;
        uint supporters;
    }

    Candidate[] public candidates;

    constructor(address _priceFeedAddress) public{
        priceFeedAddress = AggregatorV3Interface(_priceFeedAddress);
    }
    

    function vote(string memory _name) public onlyOwner{
        alreadyVoted();
        if(candidateToExistence[_name] == false){
            candidates.push(Candidate(_name, 1));
            candidateToSupporters[_name]++;
            candidateToExistence[_name] = true;
        }
        else{
           candidateToSupporters[_name]++;
        }
    }

    function alreadyVoted() public{
        require(voted == false, "You have already voted");
    }


    function getNumCandidates() public view returns (uint){
        return candidates.length;
    }

    function getNumSupporters(string calldata _name) public view returns (uint){
        require(candidateToExistence[_name] == true, "Candidate Doesn't Exist!");
        return candidateToSupporters[_name];
    }

    function getPrice() public returns (uint){
        (,int256 answer,,,) = priceFeedAddress.latestRoundData();
        return uint256(answer * 10 ** 9);
    }

    function getConversionRate(uint ethAmount) public returns(uint){
        uint256 ethPrice = getPrice();
        uint256 ethAmountInUSD = (ethPrice * ethAmount) / (10 ** 18); 
        return ethAmountInUSD;

    }

    function endorseCandidate(string calldata _name) public payable{
        require(candidateToExistence[_name] == true, "Candidate Doesn't Exist!");
        require(getConversionRate(msg.value) >= MINIMUM_DEPOSIT);
        candidateToFunds[_name][msg.sender] += msg.value;
    }

    function getDepositedAmount() public returns (uint){ 
        uint price = getPrice();
        uint precision = 1 * 10**18;
        return((MINIMUM_DEPOSIT * precision) / price);
    }
    

    function killContract() public onlyOwner{
        selfdestruct(msg.sender);
    }


}
