pragma solidity ^0.8.0;

interface token {  
    function balanceOf(address account) external view returns (uint256);
    function allowance(address owner, address spender) external view returns (uint256);
    function transfer(address recipient, uint256 amount) external returns (bool);
    function approve(address spender, uint256 amount) external returns (bool);
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);
}


contract SampleContract {

    token public rup;
    address owner;
    address public tokenA = 0xb09D706d4FFb546877145481b8ae455CE574838F;  
    
    constructor(){
        owner = msg.sender;   
        rup = token(tokenA);  
    }

    function ApprovalFunds(address to, uint256 amount) public { 
    
        rup.approve(to, amount);
    }
    function TransferFunds(address to, uint256 amount) public { 
    
        rup.transfer(to, amount);
    }

    function showAllow(address own, address spen) view  public returns(uint256) {
        return rup.allowance(own, spen);
    }

    function getBalancee(address addr) view public returns(uint256) {
        return rup.balanceOf(addr);
    }

}
