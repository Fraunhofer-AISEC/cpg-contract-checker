contract MyContract{

    using ABDKMathQuad for uint256;
    using ABDKMathQuad for int256;
    using ABDKMathQuad for bytes16;

    function get_float() public view returns(bytes16){
        uint256 int_numerator = 135335283236613;
        uint256 int_denominator = 1000000000000000;
        bytes16 float_numerator = int_numerator.fromUInt();
        bytes16 float_denominator = int_denominator.fromUInt();
        bytes16 float_result = float_numerator.div(float_denominator);
        return float_result; 
    }
}
