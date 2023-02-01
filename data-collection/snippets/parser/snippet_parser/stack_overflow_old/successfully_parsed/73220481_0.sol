
pragma solidity ^0.8.4;

contract purchase {

    uint public value;
    struct Users {
        address payable seller;
        address payable buyer;
    }
   Users public users;
    uint256 public contractID;

    enum State{Created, Locked, Release, Inactive}
    State public state;

    constructor() payable {
        users.seller = payable(msg.sender);
        value = msg.value / 2;
    }
    
    
    error InvalidState();
    
    error Onlybuyer();
    
    error OnlySeller();

    modifier inState(State state_){
        if (state != state_) {
            revert InvalidState();
        }
        _;
    }

    modifier onlybuyer(){
        if (msg.sender != users.buyer) {
            revert Onlybuyer();
        }
        _;
    }

     modifier onlySeller(){
        if (msg.sender != users.seller) {
            revert OnlySeller();
        }
        _;
    }

    mapping(uint => Users) public contractUsers;
    mapping(uint => State) public contractState;

    function confirmPurchase() external inState(State.Created) payable {
        contractID ++;
        require(msg.value == (2*value), "Please send in 2X the purchase amount");
        users.buyer = payable(msg.sender);
        state = State.Locked;
    }

    function confirmRecieved() external onlybuyer inState(State.Locked) {
        state = State.Release;
        users.buyer.transfer(value);
    }

    function paySeller() external onlySeller inState(State.Release){
        state = State.Inactive;
        users.seller.transfer(3 * value);
    }

    function abort() external onlySeller inState(State.Created){
        state = State.Inactive;
        users.seller.transfer(address(this).balance);
    }
}
