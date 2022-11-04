pragma solidity ^0.8.0;

interface IBEP20 {
    function balanceOf(address account) external view returns (uint256);
    function transfer(address recipient, uint256 amount) external returns (bool);
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);
    function approve(address spender, uint256 amount) external returns (bool);
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);
}


interface ISyrup {
    function deposit(uint256 _amount) external;
    function withdraw(uint256 _amount) external;
    function pendingReward(address _user) external view returns (uint256);
}


contract dummyContract {
    address contractAddress = address(this);
    address public owner;


    mapping(uint => uint ) public dummyCounter;

    
    constructor() public {
        owner = msg.sender;
    }
  
    function dummy(uint asd1, uint asd2) public{
        dummyCounter[asd1]=asd2;
    }
}

