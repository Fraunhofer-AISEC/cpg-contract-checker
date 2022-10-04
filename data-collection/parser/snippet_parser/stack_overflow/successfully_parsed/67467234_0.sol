

pragma solidity ^0.8.2;






contract SampleTaken {
    
    
    mapping(address => uint) public balances;
    
    uint public totalSupply = 1000000 * 10 ** 18;
    string public name ="Sample Token";
    string public symbol ="KJA";
    uint public decimals = 18;
    
    
    
    event Transfer(address indexed _from, address indexed _to, uint256 _value);
    
    constructor(){
        balances[msg.sender] = totalSupply;
    }
    
    function balanceOf(address _ownerAddress) public view returns (uint){
        return balances[_ownerAddress];
    }
    
    function transfer(address _toAddress, uint _noOfTokens) public view returns (bool){
    require(balanceOf(msg.sender) >= _noOfTokens, "Total balance is less than the number of Tokens asked for !!!");
    balances[_toAddress] +=_noOfTokens;
    balances[msg.sender] -= _noOfTokens;
    emit Transfer(msg.sender,_toAddress, _noOfTokens);
    return true;
    }
    
    function transferFrom(address _from, address _to, uint _value) public returns (bool){
     require(balanceOf(_from) >= _value, "Balance is less than the number of Tokens asked for !!!");
    
     balances[_to] += _value;
     balances[_from] -= _value;   
     
     emit Transfer (_from, _to, _value);
     return true;
     
     }    
}
