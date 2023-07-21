
pragma solidity 0.8.10;

import {FlashLoanSimpleReceiverBase} from "https://github.com/aave/aave-v3-core/blob/master/contracts/flashloan/base/FlashLoanSimpleReceiverBase.sol";
import {IPoolAddressesProvider} from "https://github.com/aave/aave-v3-core/blob/master/contracts/interfaces/IPoolAddressesProvider.sol";
import {IERC20} from "https://github.com/aave/aave-v3-core/blob/master/contracts/dependencies/openzeppelin/contracts/IERC20.sol";

contract FlashLoan is FlashLoanSimpleReceiverBase {
    address payable owner;

    constructor(address _addressProvider) FlashLoanSimpleReceiverBase(IPoolAddressesProvider(_addressProvider)) 
    {
        owner = payable(msg.sender);
    }

    function executeOperation(
        address asset,
        uint256 amount,
        uint256 premium,
        address initiator,
        bytes calldata params
    ) external override returns (bool) {
        
        uint256 amountOwned = amount + premium;
        IERC20(asset).approve(address(POOL), amountOwned);

        return true;
    }

    function requestFlashLoan(address _token, uint256 _amount) public {

        address recieverAddress = address(this);
        address asset = _token;
        uint256 amount = _amount;
        bytes memory params = '';
        uint16 referralCode = 0;


        POOL.flashLoanSimple(
            recieverAddress,
            asset,
            amount,
            params,
            referralCode
        );
    }

    function getBalance(address _tokenAddress) external view returns(uint256) {
        return IERC20(_tokenAddress).balanceOf(address(this));
    }

    function withdraw(address _tokenAddress) external onlyOwner {
        IERC20 token = IERC20(_tokenAddress);
        token.transfer(msg.sender, token.balanceOf(address(this)));
    }

    modifier onlyOwner {
        require(msg.sender == owner, 'Only the contract owner can call this function');
        _;
    }

    receive() external payable {}
}
