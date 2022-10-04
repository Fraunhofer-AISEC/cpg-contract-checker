import "./FirstContract.sol";

contract SecondContract {
    FirstContract firstContract;

    constructor(address _address) {
        firstContract = FirstContract(_address);
    }

    function increment() external {
        firstContract.incrementToken(); 
    }

    function transferValue(uint value) external {
        firstContract._admin.transfer(value); 
    }
}
