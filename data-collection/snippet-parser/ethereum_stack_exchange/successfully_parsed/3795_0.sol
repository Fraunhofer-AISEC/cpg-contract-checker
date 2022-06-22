contract TestGas {
    string constant statictext = "Hello World";
    bytes11 constant byteText11 = "Hello World";
    bytes32 constant byteText32 = "Hello World";

    function  getString() payable public  returns(string){
        return statictext;
    }

    function  getByte11() payable public returns(bytes11){
        return byteText11;
    }

    function  getByte32() payable public returns(bytes32){
        return byteText32;
    }
}
