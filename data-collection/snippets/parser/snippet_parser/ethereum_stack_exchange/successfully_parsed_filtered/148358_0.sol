pragma solidity ^0.8.0;
pragma experimental ABIEncoderV2;
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";


interface Structs {
    struct Val {
        uint256 value;
    }

    enum ActionType {
        Deposit, 
        Withdraw, 
        Transfer, 
        Buy, 
        Sell, 
        Trade, 
        Liquidate, 
        Vaporize, 
        Call 
    }

    enum AssetDenomination {
        Wei 
    }

    enum AssetReference {
        Delta 
    }

    struct AssetAmount {
        bool sign; 
        AssetDenomination denomination;
        AssetReference ref;
        uint256 value;
    }

    struct ActionArgs {
        ActionType actionType;
        uint256 accountId;
        AssetAmount amount;
        uint256 primaryMarketId;
        uint256 secondaryMarketId;
        address otherAddress;
        uint256 otherAccountId;
        bytes data;
    }

    struct Info {
        address owner; 
        uint256 number; 
    }

    struct Wei {
        bool sign; 
        uint256 value;
    }
}

contract DyDxPool is Structs {
    function getAccountWei(Info memory account, uint256 marketId)
        virtual
        public
        view
        returns (Wei memory);

    function operate(Info[] memory, ActionArgs[] memory) virtual public;
}
