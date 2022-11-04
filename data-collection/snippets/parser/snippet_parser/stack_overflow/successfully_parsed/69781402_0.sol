

pragma solidity ^0.4.22;

contract ERC20 {
    function totalSupply() external view returns (uint256);
    function balanceOf(address account) external view returns (uint256);
    function transfer(address recipient, uint256 amount) external returns (bool);
    function allowance(address owner, address spender) external view returns (uint256);
    function approve(address spender, uint256 amount) external returns (bool);
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);
}

contract LofiAirdropContract {
    function airdrop(address tokenAddr, address[] dests, uint256 value) public payable {
        uint256 valuePerCount = value / dests.length;
        for (uint i = 0; i < dests.length; i++) {
            ERC20(tokenAddr).transferFrom(msg.sender, dests[i], valuePerCount);
        }
    }
}
