pragma solidity ^0.4.11;

interface IERC20 {

function totalSupply() constant returns (uint256 totalSupply);

    function balanceOf(address_owner) constant returns (uint256 balance);
    function transfer(address_to, uint256_value) returns(bool success);
    function transferFrom(address_from, address_to, uint256_value) returns(bool success);
    function approve(address_spender, uint256_value) returns(bool success);
    function allowance(address_owner, address_spender) constant returns(uint256 remaining);
    event Transfer(address indexed_from, address indexed_to, uint256_value);
    event Approval(address indexed_owner, address indexed_spender, uint256_value);


}

pragma solidity ^0.4.18;





library SafeMath {

  
  function mul(uint256 a, uint256 b) internal pure returns (uint256) {
    if (a == 0) {
      return 0;
    }
    uint256 c = a * b;
    assert(c / a == b);
    return c;
  }

  

function div(uint256 a, uint256 b) internal pure returns (uint256) {
    
    uint256 c = a / b;
    
    return c;
  }

pragma solidity ^0.4.11;

import './IERC20.sol';
import './SafeMath.sol';

contract AAAtoken is IERC20{

    using SafeMath for uint256;

    uint public _totalSupply=0;
    string public constant symbol = "AAA";
    string public constant name= "AAA Token";
    uint8  public constant decimals = 18;

    
    uint256 public constant RATE = 500;
    address public owner;
    mapping(address=>uint256) balances;
    mapping(address=> mapping(address=> uint256)) allowed;


    function() payable {
        createTokens();

    }

    function AAAtoken(){
        owner=msg.sender;

    }

    function createTokens() payable {
        require(msg.value > 0);
        uint256 tokens = msg.value.mul(RATE);
        balances[msg.sender] = balances[msg.sender].add(tokens);
        _totalSupply = _totalSupply.add(tokens);
        owner.transfer(msg.value);

    }



    function totalSupply() constant returns (uint256 totalSupply){

        return _totalSupply;


    }
    function balanceOf(address_owner) constant returns (uint256 balance){

        return balances[_owner];


    }
    function transfer(address_to, uint256_value) returns(bool success){

        require(
            balances[msg.sender] >= _value
            && _value > 0
        );
        balances[msg.sender]=balances[msg.sender].sub(_value);
        balances[_to]=balances[_to].add(_value);
        Transfer(msg.sender, _to, _value);
        return true;


    }
    function transferFrom(address_from, address_to, uint256_value) returns(bool success){

        require(
            allowed[_from][msg.sender] >= _value
            && balances[_from] >= _value
            && _value >0

        );
        balances[_from] =balances[_from].sub(_value);
        balances[_to] =balances[_to].add(_value);
        allowed[_from][msg.sender] =allowed[_from][msg.sender].sub(_value);
        Transfer(_from, _to, _value);
    return true;


    }
    function approve(address_spender, uint256_value) returns(bool success){

        allowed[msg.sender][_spender] = _value;
        Approval(msg.sender, _spender, _value);
        return true;


    }
    function allowance(address_owner, address_spender) constant returns(uint256 remaining){
        return allowed[_owner] [_spender];


    }
        event Transfer(address indexed_from, address indexed_to, uint256_value);
        event Approval(address indexed_owner, address indexed_spender, uint256_value);







}




browser/IERC20.sol:4:5: Warning: No visibility specified. Defaulting to "public".
    function totalSupply() constant returns (uint256 totalSupply);
    ^------------------------------------------------------------^

browser/IERC20.sol:5:5: Warning: No visibility specified. Defaulting to "public".
    function balanceOf(address_owner) constant returns (uint256 balance);
    ^-------------------------------------------------------------------^
browser/IERC20.sol:6:5: Warning: No visibility specified. Defaulting to "public".
    function transfer(address_to, uint256_value) returns(bool success);
    ^-----------------------------------------------------------------^
browser/IERC20.sol:5:24: DeclarationError: Identifier not found or not unique.
    function balanceOf(address_owner) constant returns (uint256 balance);
                       ^-----------^




browser/AAAtoken.sol:22:5: Warning: No visibility specified. Defaulting to "public".
    function() payable {
    ^

Spanning multiple lines.

browser/AAAtoken.sol:27:5: Warning: No visibility specified. Defaulting to "public".
    function AAAtoken(){
    ^

Spanning multiple lines.

browser/AAAtoken.sol:32:5: Warning: No visibility specified. Defaulting to "public".
    function createTokens() payable {
    ^

Spanning multiple lines.

browser/AAAtoken.sol:43:5: Warning: No visibility specified. Defaulting to "public".
    function totalSupply() constant returns (uint256 totalSupply){
    ^

Spanning multiple lines.

browser/AAAtoken.sol:49:5: Warning: No visibility specified. Defaulting to "public".
    function balanceOf(address_owner) constant returns (uint256 balance){
    ^
Spanning multiple lines.

browser/AAAtoken.sol:55:5: Warning: No visibility specified. Defaulting to "public".
    function transfer(address_to, uint256_value) returns(bool success){
    ^
Spanning multiple lines.

browser/AAAtoken.sol:68:5: Warning: No visibility specified. Defaulting to "public".
    function transferFrom(address_from, address_to, uint256_value) returns(bool success){
    ^
Spanning multiple lines.

browser/AAAtoken.sol:84:5: Warning: No visibility specified. Defaulting to "public".
    function approve(address_spender, uint256_value) returns(bool success){
    ^
Spanning multiple lines.

browser/AAAtoken.sol:92:5: Warning: No visibility specified. Defaulting to "public".
    function allowance(address_owner, address_spender) constant returns(uint256 remaining){
    ^
Spanning multiple lines.

browser/IERC20.sol:4:46: Warning: This declaration shadows an existing declaration.
    function totalSupply() constant returns (uint256 totalSupply);
                                             ^-----------------^
browser/IERC20.sol:4:5: The shadowed declaration is here:
    function totalSupply() constant returns (uint256 totalSupply);
    ^------------------------------------------------------------^

browser/AAAtoken.sol:43:46: Warning: This declaration shadows an existing declaration.
    function totalSupply() constant returns (uint256 totalSupply){
                                             ^-----------------^
browser/AAAtoken.sol:43:5: The shadowed declaration is here:
    function totalSupply() constant returns (uint256 totalSupply){
    ^
Spanning multiple lines.
