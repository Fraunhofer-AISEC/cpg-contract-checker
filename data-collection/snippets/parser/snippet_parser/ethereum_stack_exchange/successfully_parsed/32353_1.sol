contract Example{
    function(uint256) returns (uint256) varName;

    function simpleFunction(uint256 parameter) returns (uint256){
        return parameter;
    }

    function test(){
        varName = simpleFunction;
    }
}
