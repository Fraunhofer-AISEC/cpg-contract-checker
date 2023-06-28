
pragma solidity ^0.8.0;

abstract contract ERC20_STD{

    function name() public virtual returns (string memory);
    function symbol() public virtual returns (string memory);
    function decimals() public virtual returns (uint8);
    function totalSupply() public virtual returns (uint256);
    function balanceOf(address _owner) public virtual view returns (uint256 balance);
    function transfer(address _to, uint256 _value) public virtual returns (bool success);
    function transferFrom(address _from, address _to, uint256 _value) public virtual returns (bool success);
    function approve(address _spender, uint256 _value) public virtual returns (bool success);
    function allowance(address _owner, address _spender) public virtual view returns (uint256 remaining);

    event Transfer(address indexed _from, address indexed _to, uint256 _value);
    event Approval(address indexed _owner, address indexed _spender, uint256 _value);

}

contract Ownership{ 

    address public owner;
    address public newOwner;

    event TransferOwnership (address indexed from, address indexed to);

    constructor(){
        owner = msg.sender;
    }

    function changeOwner (address _to) public {
        require(msg.sender == owner, "Only allow owner");
        newOwner = _to;
    }

    function acceptOwner() public {
        require( msg.sender == newOwner, "Must be new owner");
        emit TransferOwnership(owner, newOwner);
        owner = newOwner;
        newOwner = address(0);

        
    }
}


contract ERC20_V1 is ERC20_STD, Ownership {

    string public _name;
    string public _symbol;
    uint8 public _decimals;
    uint256 public _totalSupply;

    address public _minter;

    mapping(address => uint256) tokenBalance;

    constructor( address minter_){
        _name = "Game World";
        _symbol = "GWD";
        _decimals = 18;
        _totalSupply = 100000000;
        _minter = minter_;

        tokenBalance[_minter] = _totalSupply;
    }

    function name() public override returns (string memory){
        _name = "Game World";
        return _name;
    }

    function symbol() public override returns (string memory){
        _symbol = "GWD";
        return _symbol;
    }

    function decimals() public override returns (uint8){
        _decimals = 18;
        return _decimals;
    }

    function totalSupply() public override returns (uint256){
        _totalSupply = 100000000;
        return _totalSupply;
    }

    function balanceOf(address _owner) public override view returns (uint256 balance) {
        
    }

    function transfer(address _to, uint256 _value) public override returns (bool success){
        
    }

    function transferFrom(address _from, address _to, uint256 _value) public override returns (bool success) {
        
    }

    function approve(address _spender, uint256 _value) public override returns (bool success){
        
    }

    function allowance(address _owner, address _spender) public override view returns (uint256 remaining){
        
    }
}
