pragma solidity 0.7.0;

contract NewEscrow {


enum State {AWAITING_FUNDS,AWAITING_CLAIM,CLAIM,COMPLETE}

State public currentState; 


address payable public buyer; 
address payable public seller; 
address payable public owner; 

uint256 public agreementDay; 

mapping (address => uint256) deposits;





modifier onlyBuyer (){
    require(msg.sender == buyer);
    _; 
}



modifier onlySeller(){
    require(msg.sender == seller);
    _; 
}


constructor (){
    owner = msg.sender; 
}


function setVariables (address payable _buyer, address payable _seller, uint256 _agreementDay) public {
    buyer = _buyer; 
    seller = _seller; 
    agreementDay = _agreementDay + 30 days; 
    currentState = State.AWAITING_FUNDS;
}



function deposit() public onlyBuyer payable {
    require(currentState == State.AWAITING_FUNDS);
    uint256 amount = msg.value;
    deposits[seller] = deposits[seller] + amount; 
    currentState = State.AWAITING_CLAIM;
}


function claim () public onlySeller {
    require(currentState == State.AWAITING_CLAIM);
    currentState = State.CLAIM;
}


function confirm () public onlyBuyer {
    uint256 payment = deposits[seller];
    deposits[seller] = 0; 
    seller.transfer(payment); 
    currentState = State.COMPLETE;
}



function cancelPayement () public onlySeller  {
    uint256 payment = deposits[seller];
    deposits[seller] = 0; 
    buyer.transfer(payment); 
    currentState = State.COMPLETE;
}


function release() public{
    
    
        
        require (agreementDay < block.timestamp);
        uint256 payment = deposits[seller];
        deposits[seller] = 0; 
        buyer.transfer(payment);
        revert('funds returned');
    }
}
