
pragma solidity ^0.8.17;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@uniswap/v3-periphery/contracts/interfaces/ISwapRouter.sol";
import "@uniswap/v3-periphery/contracts/libraries/TransferHelper.sol";

interface IWrapped {
    function withdraw(uint256 wad) external;
}
interface Gas {
    function getPrice() external;
}

contract gasTestContract {
    uint public gasprice;
    uint public basefee;
    uint public gas;

    address constant WCOIN = 0xB4FBF271143F4FBf7B91A5ded31805e42b2208d6;
    ISwapRouter public constant swapRouter =
        ISwapRouter(0xE592427A0AEce92De3Edee1F18E0157C05861564);

    uint public lastRefund;
    mapping(address=>uint256) balanceOf;

    function getPrice() external {
        gasprice = tx.gasprice;
    }

    function getFee() external {
        basefee = block.basefee;
    }

    function getGas() external{
        gas = gasleft();
    }

    function getAll() external {
        gas = gasleft();
        basefee = block.basefee;
        gasprice = tx.gasprice;
    }

    fallback() external payable {}

    function refundBack() external {
        gas = gasleft() + 22000;
        lastRefund = gas * tx.gasprice;
        payable(msg.sender).transfer(lastRefund);
    }

    function refundTest(address _contract) external {
        gas = gasleft() + 22000;
        lastRefund = gas * tx.gasprice;
        Gas(_contract).getPrice();
    }

    function refund(uint amountInMaximum, IERC20 chosenToken) external payable{
        
        gas = gasleft() + 22000;

        lastRefund = gas * tx.gasprice;

        TransferHelper.safeApprove(
            address(chosenToken),
            address(swapRouter),
            amountInMaximum
        );

        ISwapRouter.ExactOutputSingleParams memory params = ISwapRouter
            .ExactOutputSingleParams({
                tokenIn: address(chosenToken),
                tokenOut: WCOIN,
                fee: 3000,
                recipient: address(this),
                deadline: block.timestamp,
                amountOut: lastRefund,
                amountInMaximum: amountInMaximum,
                sqrtPriceLimitX96: 0
            });

        swapRouter.exactOutputSingle(params);


        IWrapped(WCOIN).withdraw(lastRefund);

        
        

        payable(msg.sender).transfer(lastRefund);


    }
}
