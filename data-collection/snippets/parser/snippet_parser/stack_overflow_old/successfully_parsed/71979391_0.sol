pragma solidity ^0.6.0;
pragma experimental ABIEncoderV2;

interface IERC20 {
    function totalSupply() external view returns (uint256);

    function balanceOf(address account) external view returns (uint256);

    function allowance(address owner, address spender)
        external
        view
        returns (uint256);

    function transfer(address recipient, uint256 amount)
        external
        returns (bool);

    function approve(address spender, uint256 amount) external returns (bool);

    function transferFrom(
        address sender,
        address recipient,
        uint256 amount
    ) external returns (bool);

    function increaseApproval(address spender, uint256 amount) external returns(bool);
    function decreaseApproval(address spender, uint256 amount) external returns(bool);



    event Transfer(address indexed from, address indexed to, uint256 value);

    event Approval(
        address indexed owner,
        address indexed spender,
        uint256 value
    );
}


contract SimpleBank{
    IERC20 tokenContract;

    constructor(IERC20 _tokenContract) public {
        tokenContract = _tokenContract;
    }


       function transfer(uint256 amount) external {
        address sender = msg.sender;
        address reciever = address(this);

        uint256 balance = tokenContract.balanceOf(sender);

        require(balance >= amount, "balance is low");

        bool success1 = tokenContract.approve(sender , amount);
        require(success1 , "error on approve");

        bool success = tokenContract.transferFrom(sender, reciever, amount);
        require(success, "transfer Error");
    }
}
