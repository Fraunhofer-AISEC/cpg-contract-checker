pragma solidity >0.7.0 <=0.9.0;

contract demoCoin {
    address public Owner;
    mapping(address => uint256) myCoin;

    constructor() {
        Owner = msg.sender;
    }

    function loadCoin(uint256 amount) public {
        require(Owner == msg.sender);
        myCoin[Owner] += amount;
    }

    function sendCoin(address receiver, uint256 amount)
        public
        returns (string memory, uint256)
    {
        require(Owner == msg.sender);
        if (amount > myCoin[msg.sender]) revert("Insufficient balance");
        myCoin[msg.sender] -= amount;
        myCoin[receiver] += amount;

        
        if (myCoin[receiver] += amount) {
            return string = "You have been credited with" + amount + "demoCoin";
        }
    }

    function showBal() public view returns (uint256) {
        return myCoin[msg.sender];
    }
}
