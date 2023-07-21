contract ContractB  {
    address contractAddress = 0x9D7f74d0C41E726EC95884E0e97Fa6129e3b5E99;
    function total(uint[] memory numbers) public view returns (uint) {
        uint tot=0;
        for (uint i=0;i<numbers.length;i++){
            tot+=numbers[i];
        }
        return tot;
    }
}
