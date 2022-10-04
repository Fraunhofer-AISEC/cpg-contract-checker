pragma solidity ^0.4.11;


library SafeMath {

    function mul(uint256 a, uint256 b) internal constant returns (uint256) {
        uint256 c = a * b;
        assert(a == 0 || c / a == b);
        return c;
    }

    function div(uint256 a, uint256 b) internal constant returns (uint256) {
        
        uint256 c = a / b;
        
        return c;
    }

    function sub(uint256 a, uint256 b) internal constant returns (uint256) {
        assert(b <= a);
        return a - b;
    }

    function add(uint256 a, uint256 b) internal constant returns (uint256) {
        uint256 c = a + b;
        assert(c >= a);
        return c;
    }
}

contract Token { 
    function issue(address _recipient, uint256 _value) returns (bool success);
    function totalSupply() constant returns (uint256 supply);
    function unlock() returns (bool success);
}

contract SMPCrowdsale {

    using SafeMath for uint;

    
    address public beneficiary;                     
    address public creator;                         
    address public confirmedBy;                     
    uint256 public minAmount = 2000 ether;          
    uint256 public maxSupply = 90000000 * 10**8;    
    uint256 public minAcceptedAmount = 10 finney;   

    
    uint256 public lastWeekEnd = 51 days;

    
    uint256 public rateICO = 1500 * 10**8;

    enum Stages {
        InProgress,
        Ended,
        Withdrawn
    }

    Stages public stage = Stages.InProgress;

    
    uint256 public start;
    uint256 public end;
    uint256 public raised;

    
    Token public smpToken;

    
    mapping (address => uint256) balances;

    
    modifier atStage(Stages _stage) {
        require(stage == _stage);
        _;
    }

    
    modifier onlyBeneficiary() {
        require(beneficiary == msg.sender);
        _;
    }

    
    function balanceOf(address _investor) constant returns (uint256 balance) {
        return balances[_investor];
    }

    
    function SMPCrowdsale(address _tokenAddress, address _beneficiary, address _creator, uint256 _start) {
        smpToken = Token(_tokenAddress);
        beneficiary = _beneficiary;
        creator = _creator;
        start = _start;
        end = start + lastWeekEnd;
    }

    
    function confirmBeneficiary() onlyBeneficiary {
        confirmedBy = msg.sender;
    }

    
    function endCrowdsale() atStage(Stages.InProgress) {

        
        require (now >= end);

        stage = Stages.Ended;
    }

    
    function withdraw() onlyBeneficiary atStage(Stages.Ended) {

        
        require(raised >= minAmount);

        uint256 ethBalance = this.balance;

        beneficiary.transfer(ethBalance);

        stage = Stages.Withdrawn;
    }

    
    function refund() atStage(Stages.Ended) {

        
        assert(raised < minAmount);

        address investor = msg.sender;

        uint256 receivedAmount = balances[investor];
        balances[investor] = 0;
        require(receivedAmount > 0);
        investor.transfer(receivedAmount);        
    }

    
    function () payable atStage(Stages.InProgress) {
        
        require(now >= start);

        
        require(now <= end);

        address investor = msg.sender;
        uint256 received = msg.value; 

        
        require(received >= minAcceptedAmount);
        uint256 tokens = received * rateICO;

        require(tokens > 0);

        require(smpToken.issue(investor, tokens));

        balances[investor] = balances[investor].add(received);
        raised += received;

        
        if (smpToken.totalSupply() >= maxSupply) {
            stage = Stages.Ended;
        }
    }
}
