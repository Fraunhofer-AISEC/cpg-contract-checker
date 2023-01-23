pragma solidity ^0.4.4;

import "./ERC223_interface.sol";
import "./SafeMath.sol";
import "./ERC223_receiving_contract.sol";
import "./ERC20_interface.sol";



contract MetaCoin is ERC20Interface, ERC223Interface { 
    using SafeMath for uint;

    string public constant symbol = "MC";
    string public constant name = "MetaCoin";
    uint256 public constant decimals = 18;

    uint256 private constant _totalSupply = 1000000;

    address private _owner;


    mapping(address => uint) private balances;

    mapping(address => mapping(address => uint)) private allowed;

    constructor() public{
        _owner = msg.sender;
        balances[_owner] = _totalSupply;
        emit Transfer(address(0), _owner, _totalSupply);
    }

    function totalSupply() public view returns (uint) {
        return _totalSupply;
    }

    function balanceOf(address takeOwner) public view returns (uint balance){
        return balances[takeOwner];

    }

    function allowance(address tokenOwner, address spender) public view returns (uint remaining) {
        return allowed[tokenOwner][spender];

    }

    function transfer(address to, uint tokens) public returns (bool success){
        if(tokens <= balanceOf(msg.sender) && tokens>0 && !checkContract(to)){
            balances[msg.sender] = balances[msg.sender].sub(tokens);
            balances[to] = balances[to].add(tokens);
            emit Transfer(msg.sender, to, tokens);
            return true;

        }

        return false;



    }

    function approve(address spender,uint tokens) public returns(bool success){
        allowed[msg.sender][spender] = tokens;
        emit Approval(msg.sender, spender, tokens);
        return true;

    }

    function transferFrom(address from, address to, uint tokens) public returns (bool success){
        if(allowed[from][msg.sender] > 0 &&
            tokens > 0 && 
            allowed[from][msg.sender] >= tokens && 
            balances[from]>=tokens){


            balances[from] = balances[from].sub(tokens);
            allowed[from][msg.sender] = allowed[from][msg.sender].sub(tokens);
            balances[to] = balances[to].add(tokens);
            emit Transfer(from, to, tokens);
            return true;


        }
        return false;

    }

    function transfer(address to, uint tokens, bytes data) public returns (bool){
        if(tokens <= balanceOf(msg.sender) && tokens>0 && checkContract(to)){
            balances[msg.sender] = balances[msg.sender].sub(tokens);
            balances[to] = balances[to].add(tokens);
            ERC223ReceivingContract _contract = ERC223ReceivingContract(to);
            _contract.tokenFallback(msg.sender,tokens,data);
            emit Transfer(msg.sender, to, tokens,data);
            return true;

        }

        return false;



    }

    function checkContract(address addr) private view returns(bool){
        uint size;
        assembly {
            size := extcodesize(addr)
        }
        return size > 0;

    }



    function () public payable {
        revert();
    }

}
