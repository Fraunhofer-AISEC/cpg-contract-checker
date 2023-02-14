contract Mycontract {

    uint256[] public barLengthToBarAmtForSale;

    constructor() public {
        uint16 counter = uint16(0);
        while(counter <= 10) {
            barLengthToBarAmtForSale.push(uint256(0));
            counter++;
        }
    }

    function test() public {
        uint16 _length = 5;
        barLengthToBarAmtForSale[_length]++;
    }


}
