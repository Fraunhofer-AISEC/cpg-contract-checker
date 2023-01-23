
contract NumbersMarketContract is GetEtherPrice
....
function check() public pure returns (uint256){
        return getPrice();
    }
