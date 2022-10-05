contract Coin {
    address public minter;

    mapping (address => uint) public banlances


    event Sent (address from, address to , uint amount);


    constructor() public {
        minter = msg.sender;
    }
    function mint(address recevier, uint amount) public {
        require(msg.sender == minter)
        require(amount < 1e60);
        banlances[recevier] += amount;
    }

}
