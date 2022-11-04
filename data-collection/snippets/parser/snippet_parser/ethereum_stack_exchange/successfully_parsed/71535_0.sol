    pragma solidity <=0.6.0;


    import "openzeppelin-solidity/contracts/math/SafeMath.sol";
    import "openzeppelin-solidity/contracts/token/ERC20/ERC20.sol";

    contract Token is ERC20 {

        string public name = "test";
        string public symbol = "TST";
        uint8 public decimals = 18;
        uint256 public initSup = 1000;

        constructor() public {
            _totalSupply = initSup;
            balances[msg.sender] = initSup;
        }


    }
