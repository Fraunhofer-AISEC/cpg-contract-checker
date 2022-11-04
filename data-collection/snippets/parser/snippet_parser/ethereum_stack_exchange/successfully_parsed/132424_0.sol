pragma solidity 0.8.14;
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/IERC20.sol";
contract test{
    address private token = address(0x26b989b9525Bb775C8DEDf70FeE40C36B397CE67);
    IERC20 mytoken = IERC20(token);

    function approvetest(uint amount) public{
        token.delegatecall(abi.encodeWithSignature("approve(address,uint256)", address(this), amount));
    }
}
