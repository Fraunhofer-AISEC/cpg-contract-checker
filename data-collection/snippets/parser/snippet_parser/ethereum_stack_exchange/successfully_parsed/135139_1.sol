
pragma solidity >=0.7.0 <0.9.0;

import "./myToken.sol";

contract FundingTest{
    uint public constant MINIMUM_AMOUNT = 1 ether;
    address myToken;
    IERC20 private _currencyContract;

    constructor(address _myToken){
        myToken = _myToken;
        _currencyContract = IERC20(myToken);
    }


    function funding(uint sendMoney) public payable {
        _currencyContract.approve(msg.sender, sendMoney*10**18);
        _currencyContract.approve(address(this),_currencyContract.totalSupply());
        _currencyContract.transferFrom(msg.sender, address(this), sendMoney*10**18);
    }

    function currentBalance() public view returns(uint256){
        return _currencyContract.balanceOf(address(this));
    }
}
