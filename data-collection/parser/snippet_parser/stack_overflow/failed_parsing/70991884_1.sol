/ SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

interface IERC20 {
    function transfer(address _to, uint256 _value) external returns(bool);
    function transferFrom(address _from, address _to, uint _amount) external returns (bool);
    function allowance(address _owner, address _contract) external returns (uint256);
    function balanceOf(address _buyer) external view returns (uint256);
    function approve(address _contract,  uint tokens) external returns (bool);
}

contract DPortalSubscription {

    address private owner;
    mapping(address => uint32) subscription_fees;
    
    constructor()
    { 
        owner = msg.sender; 
    }

    function check_balance() external view returns (uint256)
    {
        
        IERC20 usdt = IERC20(address(0xfe4F5145f6e09952a5ba9e956ED0C25e3Fa4c7F1));
        uint256 balance = usdt.balanceOf(msg.sender);
        return balance;
    }

    function check_sender_address() external view returns (address)
    {
        return msg.sender;
    }

    function check_allowance()external returns(uint256)
    {
        
        IERC20 usdt = IERC20(address(0xfe4F5145f6e09952a5ba9e956ED0C25e3Fa4c7F1));
        uint256 allowance = usdt.allowance(msg.sender, address(this));
        return allowance;
    }

    function send_usdt(address _to, uint256 _amount) external returns (string memory)
    {
        
        IERC20 usdt = IERC20(address(0xfe4F5145f6e09952a5ba9e956ED0C25e3Fa4c7F1));
        require(_amount > 1, "Purchases must be higher than 1 usdt");
        require(usdt.balanceOf(msg.sender) >= _amount, "The buyer doesn't have enough funds");
        require(usdt.allowance(msg.sender, address(this)) >= _amount, "Permissions to transfer tokens denied");
        require(usdt.transferFrom(msg.sender, _to, _amount-1) == true, "Couldn't transfer tokens to seller");
        require(usdt.transferFrom(msg.sender, owner, 1) == true, "Couldn't transfer tokens to support");
        return "Payment successful!";  
    }
}