pragma solidity ^0.4.16;

interface tokenRecipient { function receiveApproval(address_from, uint256 _value, address _token, bytes _extraData) public; }

contract tokenERC20 {

    string public name;
    string public symbol;
    unint public decimals = 18;
    unit256 public totalSupply;

    mapping(address=>unit256) balanceof;
    mapping(address=> mapping(address => uint256)) public allowance;

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Burn( address indexed from, uint256 value);



}
