contract vulnerable{

    mapping (address => uint256) balance;
    uint256 _amount;

    function() external payable{
    }

    function deposit() payable public{
        address(this).transfer(_amount);
    }
}
