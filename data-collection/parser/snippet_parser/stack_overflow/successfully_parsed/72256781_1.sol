contract GetEtherPrice {    

    function getPrice() public pure returns(uint256){
        return getPriceMocked();
    }

    function getPriceMocked() public pure returns(uint256){
        return 10;
    }
}
