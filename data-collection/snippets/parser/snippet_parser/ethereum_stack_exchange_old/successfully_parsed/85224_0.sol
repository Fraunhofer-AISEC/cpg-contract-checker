
pragma solidity >=0.5.0 <0.8.0;

contract myContract {
    uint index;

    function myFunction() public {
        ( , , uint256 standardDepositAmount, , ) = returnTuple();
        require(standardDepositAmount == 3);
        
    }
    
    function returnTuple() public pure returns (uint, uint, uint, uint, uint) {
        return (1, 2, 3, 4, 5);
    }
}
