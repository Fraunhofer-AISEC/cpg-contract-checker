    function getBarLengthToBarIndexForSaleLength(uint16 _length) external view returns (uint) {
    return barLengthToBarIndexForSale[_length].length;
}
