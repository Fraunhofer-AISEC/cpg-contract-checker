pragma solidity ^0.4.0;

contract SimpleToken {
    address client;
    uint256 public totalSupply;
    uint remaining;
    uint price;

uint ethval;

mapping (address => uint) investors;
event testDebug(string _msg,address client,uint256 totalSupply,uint receivedValue);
function SimpleToken(uint _totalSupply) 
{
    client = msg.sender;
    totalSupply = _totalSupply;
    remaining = 0;
}

function setEthValue(uint _value){
    ethval = _value;
}

function sendToken() payable 
{
    testDebug("Before",client,totalSupply,investors[msg.sender]);
    assert(remaining < totalSupply);
    uint noOfTokens = ethval/price;
    assert(noOfTokens < totalSupply-remaining); 
    investors[msg.sender] = noOfTokens;
    remaining = remaining+noOfTokens;

    testDebug("After",client,remaining,noOfTokens);

    client.transfer(noOfTokens);

}

function setTokenPrice(uint _price)
{ 
    price = _price;
}

function getEthVal() constant returns(uint){
    return ethval;
}
}
