contract Oracle is Ownable {
    uint256 priceTKN1 = 0.01 ether;
    uint256 priceTKN2 = 0.001 ether;
    uint256 constant private DECIMALS = 8;

    function updatePriceTKN1(uint256 _newPrice) public onlyOwner {
        priceTKN1 = _newPrice;
    }

    function updatePriceTKN2(uint256 _newPrice) public onlyOwner {
        priceTKN2 = _newPrice;
    }

    function getPriceTKN1() public view returns (uint256) {
        return priceTKN1;
    }

    function getPriceTKN2() public view returns (uint256) {
        return priceTKN2;
    }

    function getConversionTKN1toTKN2() external view returns (uint256) {
        return (priceTKN1*(10**DECIMALS) / priceTKN2);
    }

    function getConversionTKN2toTKN1() external view returns (uint256) {
        return (priceTKN2*(10**DECIMALS) / priceTKN1);
    }

    function decimals() external view returns (uint256) {
        return DECIMALS;
    }
}
