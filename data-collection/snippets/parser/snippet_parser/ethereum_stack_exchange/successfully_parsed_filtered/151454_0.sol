
pragma solidity 0.8.10;

import {FlashLoanSimpleReceiverBase} from "https://github.com/aave/aave-v3-core/blob/master/contracts/flashloan/base/FlashLoanSimpleReceiverBase.sol";
import {IPoolAddressesProvider} from "https://github.com/aave/aave-v3-core/blob/master/contracts/interfaces/IPoolAddressesProvider.sol";
import {IERC20} from "https://github.com/aave/aave-v3-core/blob/master/contracts/dependencies/openzeppelin/contracts/IERC20.sol";

interface IDex {
    function depositUSDC(uint256 _amount) external;
    function depostDAI(uint256 _amount) external;
    function buyDAI() external;
    function sellDAI() external;
}

contract FlashLoanArbitrage is FlashLoanSimpleReceiverBase {
    address payable owner;

    address private immutable daiAddress = 0x75Ab5AB1Eef154C0352Fc31D2428Cef80C7F8B33;
    address private immutable usdcAddress = 0x65aFADD39029741B3b8f0756952C74678c9cEC93;
    address private immutable dexContractAddress = 0x4A96CEEc9eF026921A836211830E47203D6bB4A3;

    IERC20 private dai;
    IERC20 private usdc;
    IDex private dexContract;

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
        

        dexContract.depositUSDC(1000000000); 
        dexContract.buyDAI();
        dexContract.depostDAI(dai.balanceOf(address(this)));
        dexContract.sellDAI();
        
        


        
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

    
    
    function approveUSDC(uint256 _amount) external returns (bool) {
        return usdc.approve(dexContractAddress, _amount);
    }

    function allowanceUSDC() external view returns (uint256) {
        return usdc.allowance(address(this), dexContractAddress);
    }

    function approveDAI(uint256 _amount) external returns (bool) {
        return dai.approve(dexContractAddress, _amount);
    }

    function allowanceDAI() external view returns (uint256) {
        return dai.allowance(address(this), dexContractAddress);
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
