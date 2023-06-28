contract ContractB is ContractA {
    function getNum2() public view returns(uint) {
        return s.num2; 
    }
}
