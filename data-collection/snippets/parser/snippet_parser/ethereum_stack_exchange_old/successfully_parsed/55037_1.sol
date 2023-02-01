pragma solidity ^0.4.0;





contract SafeMath {
    function safeAdd(uint a, uint b) internal pure returns (uint c) {
        c = a + b;
        require(c >= a);
    }
    function safeSub(uint a, uint b) internal pure returns (uint c) {
        require(b <= a);
        c = a - b;
    }
    function safeMul(uint a, uint b) internal pure returns (uint c) {
        c = a * b;
        require(a == 0 || c / a == b);
    }
    function safeDiv(uint a, uint b) internal pure returns (uint c) {
        require(b > 0);
        c = a / b;
    }
}


interface token {
    function transfer(address to, uint tokens) external;
    function balanceOf(address tokenOwner) external returns(uint balance);
}








contract Owned {
    address public owner;
    address public newOwner;

    event OwnershipTransferred(address indexed _from, address indexed _to);

    constructor() public {
        owner = msg.sender;
    }

    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }

    function transferOwnership(address _newOwner) public onlyOwner {
        newOwner = _newOwner;
        emit OwnershipTransferred(owner, _newOwner);
    }

}

contract CCTCSALE is  Owned, SafeMath {


    token public reward;
    uint public Ownerbalance;

    mapping(address => uint) balances;



    constructor() public {
        address CCTCTokenAddress = 0x5f9f9c3148ca875fc28b4075cc3195f7e040a1a4;

        reward = token(CCTCTokenAddress);

    }
    function getbalance() public returns(uint) {
        uint test = reward.balanceOf(this);
        return (test);
    }

    function () public payable {

        uint tokens;
        tokens = msg.value * 500;
        balances[msg.sender] = safeAdd(balances[msg.sender], tokens);
        reward.transfer(msg.sender, tokens);
    }

    function safeWithdrawal() public onlyOwner {
            uint amount = this.balance;
            owner.transfer(amount);
    }


    function withdrawTokens() public onlyOwner{
        Ownerbalance = reward.balanceOf(this);
        reward.transfer(owner, Ownerbalance);

    }

}
