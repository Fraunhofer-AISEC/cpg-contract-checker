pragma solidity ^0.4.13;

contract ForeignToken {
    function balanceOf(address _owner) constant returns (uint256);
    function transfer(address _to, uint256 _value) returns (bool);
}

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

contract TokenCrowdsale {

    using SafeMath for uint256;

    
    address public beneficiary;                     
    address public creator;                         
    address public confirmedBy;                     
    uint256 public maxSupply = 15000000e8;    
    uint256 public minAcceptedAmount = 10 finney;   
    bool public purchasingAllowed = false;


    
    uint256 public rate = 2000;

    enum Stages {
        PreSale,
        InProgress,
        Ended,
        Withdrawn
    }

    Stages public stage = Stages.PreSale;

    
    Token public deplToken;

    
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


    function enablePurchasing() onlyBeneficiary atStage(Stages.PreSale) {
        purchasingAllowed = true;
        stage = Stages.InProgress;
    }

    function disablePurchasing() onlyBeneficiary atStage(Stages.InProgress) {
        purchasingAllowed = false;
        stage = Stages.Ended;
    }

    function enableNewPurchasing() onlyBeneficiary atStage(Stages.Withdrawn) {
        purchasingAllowed = true;
        stage = Stages.InProgress;
    }

    
    function TokenCrowdsale(address _tokenAddress, address _beneficiary, address _creator) {
        deplToken = Token(_tokenAddress);
        beneficiary = _beneficiary;
        creator = _creator;
    }

    
    function confirmBeneficiary() onlyBeneficiary {
        confirmedBy = msg.sender;
    }


    
    function withdraw() onlyBeneficiary atStage(Stages.Ended) {
        uint256 ethBalance = this.balance;
        beneficiary.transfer(ethBalance);
        stage = Stages.Withdrawn;
    }

    
    function () payable atStage(Stages.InProgress) {

        require(purchasingAllowed);

        address investor = msg.sender;
        uint256 received = (msg.value).div(10e8);

        
        require(received >= minAcceptedAmount);
        uint256 tokens = (received).mul(rate);

        require(tokens > 0);

        require(deplToken.issue(investor, tokens));

        balances[investor] = balances[investor].add(received);
        

        
        if (deplToken.totalSupply() >= maxSupply) {
            stage = Stages.Ended;
        }
    }

    function withdrawForeignTokens(address _tokenContract) onlyBeneficiary public returns (bool) {
        ForeignToken token = ForeignToken(_tokenContract);
        uint256 amount = token.balanceOf(address(this));
        return token.transfer(beneficiary, amount);
    }
}
