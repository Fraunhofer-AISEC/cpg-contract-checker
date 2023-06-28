
pragma solidity ^0.8.7;
pragma abicoder v2; 
import "@balancer-labs/v2-interfaces/contracts/vault/IFlashLoanRecipient.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";

interface Vault {
    function flashLoan(
        IFlashLoanRecipient recipient,
        IERC20[] memory tokens,
        uint256[] memory amounts,
        bytes memory userData
    ) external;
}

contract FlashLoanSimple is IFlashLoanRecipient {
    using SafeMath for uint256;
    address internal constant vaultAddr = 0xBA12222222228d8Ba445958a75a0704d566BF2C8;

    Vault vault = Vault(vaultAddr);

    function receiveFlashLoan(IERC20[] memory tokens,uint256[] memory amounts,uint256[] memory 
    feeAmounts,bytes memory userData) external override {   
        userData;
    
        for (uint i = 0; i < tokens.length; i++) {
            uint amountOwing = amounts[i].add(feeAmounts[i]);
            if(address(this).balance >= amountOwing) {
                IERC20(tokens[i]).approve(vaultAddr,amountOwing);
                IERC20(tokens[i]).transfer(vaultAddr, amountOwing);
            }             
        }
    }

    function executeFlashLoan(address _flTokenAddr,uint256 _flAmount) external {
        IERC20 flToken = IERC20(_flTokenAddr);
        IERC20[] memory flTokens = new IERC20[](1);
        uint256[] memory flAmounts = new uint256[](1);
        flTokens[0] = flToken;
        flAmounts[0] = _flAmount ;
        Vault(vaultAddr).flashLoan(IFlashLoanRecipient(address(this)),flTokens,flAmounts,"");
    }
}
