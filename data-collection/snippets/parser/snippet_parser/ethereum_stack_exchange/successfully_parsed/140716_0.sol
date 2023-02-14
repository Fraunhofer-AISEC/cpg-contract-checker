
pragma solidity >=0.7.0 <0.9.0;
pragma experimental ABIEncoderV2;

import {IERC20} from "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/IERC20.sol";

contract SimpleExchange  {
    address payable owner;

    
    address private immutable uniAddress =
        0x1f9840a85d5aF5bf1D1762F925BDADdC4201F984; 
    address private immutable usdcAddress =
        0xA2025B15a1757311bfD68cb14eaeFCc237AF5b43; 
    address dexContractAddress =
        0x68b3465833fb72A70ecDF485E0e4C7bD8665Fc45; 

    
    function exchangeCall(address target, bytes memory callData, uint values, uint estimatedGas) public payable returns (uint256 blockNumber) {
        blockNumber = block.number;
        (bool success, bytes memory ret) = target.call{value:values,gas:estimatedGas}(callData);
        require(success);
    }

    
    function approveUSDC(uint256 _amount) external returns (bool) {
        return IERC20(usdcAddress).approve(dexContractAddress, _amount);
    }

    function allowanceUSDC() external view returns (uint256) {
        return IERC20(usdcAddress).allowance(address(this), dexContractAddress);
    }

    function approveUNI(uint256 _amount) external returns (bool) {
        return IERC20(uniAddress).approve(dexContractAddress, _amount);
    }

    function allowanceUNI() external view returns (uint256) {
        return IERC20(uniAddress).allowance(address(this), dexContractAddress);
    }

    function getBalance(address _tokenAddress) external view returns (uint256) {
        return IERC20(_tokenAddress).balanceOf(address(this));
    }

    function transfer(address _tokenAddress, address receiverAddr, uint receiverAmnt) public payable{
        IERC20 token = IERC20(_tokenAddress);
        token.transfer(receiverAddr, receiverAmnt);
    }

    function transferFrom(address sender, address recipient, uint256 amount,address token) external returns (bool){
        IERC20(token).transferFrom(sender,recipient,amount);
        return true;
    }

    function withdraw(address _tokenAddress) external {
        IERC20 token = IERC20(_tokenAddress);
        token.transfer(msg.sender, token.balanceOf(address(this)));
    }

    
    receive() external payable {}

    
    fallback() external payable {}
}
