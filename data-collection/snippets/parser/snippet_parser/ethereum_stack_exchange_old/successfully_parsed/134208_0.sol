
pragma solidity 0.8.10;
pragma experimental ABIEncoderV2;

import { SafeMath } from "https://github.com/aave/aave-v3-core/contracts/dependencies/openzeppelin/contracts/SafeMath.sol";

interface IFaucet {
    function mint(
        address _token,
        uint256 _amount
    ) external;
}




contract MySimpleFlashLoanV3  {
    using SafeMath for uint256;
    address payable owner;
    IFaucet FAUCET;

    constructor(IFaucet _faucet) {
        owner = payable(msg.sender);
        FAUCET= _faucet;
    }
    function widthdrawAmount() internal {
        
        owner.transfer(10);
    }
    function executeOperation(
        address asset,
        uint256 amount
    )
        public
        returns (bool)
    {

        FAUCET.mint(asset,10);
        widthdrawAmount();
        return true;
    }

}
