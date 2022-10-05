pragma solidity ^0.5.0;
pragma experimental ABIEncoderV2;

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
    function getAccountWei(Info memory account, uint256 marketId) public view returns (Wei memory);
    function operate(Info[] memory, ActionArgs[] memory) public;
}


interface IERC20 {
    function balanceOf(address account) external view returns (uint256);

    function approve(address spender, uint256 amount) external returns (bool);
}

contract DyDxFlashLoan is Structs {
    DyDxPool pool = DyDxPool(0x1E0447b19BB6EcFdAe1e4AE1694b0C3659614e4e);

    address public WETH = 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2;
    mapping(address => uint256) public currencies;

    constructor() public {
        currencies[WETH] = 1;
    }

    modifier onlyPool() {
        require(
            msg.sender == address(pool),
            "FlashLoan: could be called by DyDx pool only"
        );
        _;
    }

    function tokenToMarketId(address token) public view returns (uint256) {
        uint256 marketId = currencies[token];
        require(marketId != 0, "FlashLoan: Unsupported token");
        return marketId - 1;
    }

    
    function flashloan(address token, uint256 amount, bytes memory data)
        internal
    {
        IERC20(token).approve(address(pool), amount + 1);
        Info[] memory infos = new Info[](1);
        ActionArgs[] memory args = new ActionArgs[](3);

        infos[0] = Info(address(this), 0);

        AssetAmount memory wamt = AssetAmount(
            false,
            AssetDenomination.Wei,
            AssetReference.Delta,
            amount
        );
        ActionArgs memory withdraw;
        withdraw.actionType = ActionType.Withdraw;
        withdraw.accountId = 0;
        withdraw.amount = wamt;
        withdraw.primaryMarketId = tokenToMarketId(token);
        withdraw.otherAddress = address(this);

        args[0] = withdraw;

        ActionArgs memory call;
        call.actionType = ActionType.Call;
        call.accountId = 0;
        call.otherAddress = address(this);
        call.data = data;

        args[1] = call;

        ActionArgs memory deposit;
        AssetAmount memory damt = AssetAmount(
            true,
            AssetDenomination.Wei,
            AssetReference.Delta,
            amount + 1
        );
        deposit.actionType = ActionType.Deposit;
        deposit.accountId = 0;
        deposit.amount = damt;
        deposit.primaryMarketId = tokenToMarketId(token);
        deposit.otherAddress = address(this);

        args[2] = deposit;

        pool.operate(infos, args);
    }
}

contract Flashloan is DyDxFlashLoan {
    uint256 public loan;

    constructor() public payable {
        (bool success, ) = WETH.call.value(msg.value)("");
        require(success, "fail to get weth");
    }

    function getFlashloan(address flashToken, uint256 flashAmount) external {
        uint256 balanceBefore = IERC20(flashToken).balanceOf(address(this));
        bytes memory data = abi.encode(flashToken, flashAmount, balanceBefore);
        flashloan(flashToken, flashAmount, data); 
    }

    function callFunction(
        address, 
        Info calldata, 
        bytes calldata data
    ) external onlyPool {
        (address flashToken, uint256 flashAmount, uint256 balanceBefore) = abi
            .decode(data, (address, uint256, uint256));
        uint256 balanceAfter = IERC20(flashToken).balanceOf(address(this));
        require(
            balanceAfter - balanceBefore == flashAmount,
            "contract did not get the loan"
        );
        loan = balanceAfter;

        
    }
}
