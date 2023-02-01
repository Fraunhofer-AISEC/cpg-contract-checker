pragma solidity >=0.4.16 <0.7.0;

contract Swap {
    address owner;
    address constant tokenAddress = address(
        0x14eb2ab8e6d09000a98e3166b3cc994375071f69 
    );
    uint8[] validTokenAmounts = [2, 16, 32];
    uint256 constant tokenPrice = 75000000000000;

    function isTokenAmountValid(uint8 tokenAmount) private view returns (bool) {
        for (uint8 i; i < validTokenAmounts.length; i++) {
            if (tokenAmount == validTokenAmounts[i]) {
                return true;
            }
        }
        return false;
    }

    function swap(uint8 amount) public payable {
        require(
            msg.value >= amount * tokenPrice,
            "You sent incorrect amount of Ether"
        );

        ??transfer()?? 
    }
}
