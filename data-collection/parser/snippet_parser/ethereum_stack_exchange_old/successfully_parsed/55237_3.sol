contract Mycontract {

    uint256[10] public barLengthToBarAmtForSale;

    function test() public {
        uint16 _length = 5;
        barLengthToBarAmtForSale[_length]++;
    }


}
