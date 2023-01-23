pragma solidity ^0.4.11;

contract MyContractA {
    uint[] public myArray;

    function MyContractA() {
        myArray.length = 1;
    }

}

contract MyContractB {

    function test() returns (uint ret) {
        address instanceAddress = new MyContractA();
        MyContractA instance = MyContractA(instanceAddress);
        
        return instance.myArray(0); 
        
        
        
        
        

        
        

        
        
    }
}
