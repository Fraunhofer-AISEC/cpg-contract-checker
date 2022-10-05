pragma solidity 0.5.10;


contract ERC20 {
    function totalSupply() public view returns (uint supply);
    function balanceOf(address _owner) public view returns (uint balance);
    function transfer(address _to, uint _value) public returns (bool success);
    function transferFrom(address _from, address _to, uint _value) public returns (bool success);
    function approve(address _spender, uint _value) public returns (bool success);
    function allowance(address _owner, address _spender) public view returns (uint remaining);
    function decimals() public view returns(uint digits);
    event Approval(address indexed _owner, address indexed _spender, uint _value);
}

contract TestContract{


    address payable public owner;

    

    constructor() public {
        owner = msg.sender;
        
    }

   
    function depositToken(address _addr) external
    {
        ERC20 tokenContract = ERC20(0x722dd3F80BAC40c951b51BdD28Dd19d435762180);
        
        require(tokenContract.allowance(msg.sender,this)>0);
        
        uint tokenAmount = tokenContract.allowance(msg.sender, this);
        require(tokenContract.transferFrom(msg.sender, this, tokenAmount));
        
    }
}
