pragma solidity ^0.8.11;

import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";

contract PurchaseAgreement {
    using SafeERC20 for IERC20;

    uint256 public immutable value;
    address public immutable token;
    address public immutable seller;
    address public buyer;
    
    enum State { Created, Locked, Release, Inactive }
    State public state;

    constructor(address _token, uint256 _value) {
        seller = msg.sender;
        token = _token;
        value = _value;

        IERC20(_token).safeTransferFrom(msg.sender, address(this), 2*_value);
    }

    
    error InvalidState();
    
    error OnlyBuyer();
    
    error OnlySeller();

    modifier inState(State state_) {
        if (state != state_) {
            revert InvalidState();
        }
        _;
    }

    modifier onlyBuyer() {
        if (msg.sender != buyer) {
            revert OnlyBuyer();
        }
        _;
    }

    modifier onlySeller() {
        if (msg.sender != seller) {
            revert OnlySeller();
        }
        _;
    }

    function confirmPurchase() external inState(State.Created) {
        IERC20(token).safeTransferFrom(msg.sender, address(this), 2*value);
        buyer = msg.sender;
        state = State.Locked;
    }

    function confirmReceived() external onlyBuyer inState(State.Locked) {
        state = State.Release;
        IERC20(token).safeTransfer(buyer, value);
    }

    function paySeller() external onlySeller inState(State.Release) {
        state = State.Inactive;
        IERC20(token).safeTransfer(seller, 3*value);
    }

    function abort() external onlySeller inState(State.Created) {
        state = State.Inactive;
        uint256 _balance = IERC20(token).balanceOf(address(this));
        IERC20(token).safeTransfer(seller, _balance);
    }
}
