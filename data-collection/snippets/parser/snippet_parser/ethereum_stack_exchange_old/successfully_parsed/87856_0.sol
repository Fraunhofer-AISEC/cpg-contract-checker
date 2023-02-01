pragma solidity ^0.4.24;

contract Caller {
    
    event AddedValuesByDelegateCall(address from, address to, uint256 value, bool resp, bool success);
    
    function addValuesWithDelegateCall(address addr, address to, uint256 value) public payable returns (bool) {
        IERC20 x = IERC20(addr);
        (bool resp) = address(x).delegatecall(abi.encodeWithSignature("approve(address, uint256)", msg.sender, value));
        (bool success) = address(x).delegatecall(abi.encodeWithSignature("transferFrom(address, address, uint256)", msg.sender, to, value));
        emit AddedValuesByDelegateCall(msg.sender, to, value, resp, success);
        return success;
    }
    
}





interface IERC20 {
    function transfer(address to, uint256 value) external returns (bool);
    function approve(address spender, uint256 value) external returns (bool);
    function transferFrom(address from, address to, uint256 value) external returns (bool);
    function totalSupply() external view returns (uint256);
    function balanceOf(address who) external view returns (uint256);
    function allowance(address owner, address spender) external view returns (uint256);
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);
}



contract tokenPS is IERC20{
    string public name = "tokenPS";
    string public symbol = "TPS";
    uint8 public decimals = 6;
    uint public supply;
    address public founder;
    mapping(address => uint) public balances;
    mapping(address => mapping(address => uint)) allowed;
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint value);
    
    
    
    constructor() public{
        supply = 1000000000000;
        founder = msg.sender;
        balances[founder] = supply;
    }
    
    
    
    
    function allowance(address owner, address spender) public view returns(uint){
        return allowed[owner][spender];
    }
    
    
    
    
    function approve(address spender, uint value) public returns(bool){
        allowed[msg.sender][spender] = value;
        emit Approval(msg.sender, spender, value);
        return true;
    }
    
    
    
    function transferFrom(address from, address to, uint value) public returns(bool){
        require(allowed[from][msg.sender] >= value);
        require(balances[from] >= value);

        balances[from] -= value;
        balances[to] += value;
        allowed[from][msg.sender] -= value;

        emit Transfer(from, to, value);

        return true;
    }
    
    
    
    function totalSupply() public view returns (uint){
        return supply;
    }
    
    
    
    function balanceOf(address tokenOwner) public view returns (uint balance){
        return balances[tokenOwner];
    }
    
    
    
    function transfer(address to, uint tokens) public returns (bool success){
        require(balances[msg.sender] >= tokens && tokens > 0);
        balances[to] += tokens;
        balances[msg.sender] -= tokens;
        emit Transfer(msg.sender, to, tokens);
        return true;
    }
    
    
    
    function () public payable {
        revert();
    }
}
