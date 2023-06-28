contract pullother {

    function callFunctionInContractOne (address _address) returns (uint) {
        helloworld contractOne = helloworld(_address);
        return contractOne.returnint();
    }

}
