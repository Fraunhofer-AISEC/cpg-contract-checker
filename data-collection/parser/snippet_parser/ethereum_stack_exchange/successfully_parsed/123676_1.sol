   interface ITestPayable {
        function payableFunction() payable external;
    }
    
    contract CallPayable {

    receive() payable external {
        
    }

    function callPayableFunction(address contractAddress) external {
        IPayable(contractAddress).payableFunction{value: 1 ether}();
    }

    function getBalance() external view returns(uint) {
           return address(this).balance;
    }
}
