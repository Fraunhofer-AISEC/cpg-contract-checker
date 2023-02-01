
pragma solidity ^0.8.17;

interface InterfaceParentContract {

    function viewMyArr() external view returns(address[] memory);

} 

contract ParentContract {
    address[] public myArr;  

    constructor () {
        myArr.push(0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2);
        myArr.push(0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db);
        myArr.push(0x78731D3Ca6b7E34aC0F824c42a7cC18A495cabaB);
    } 

    function viewMyArr() external view returns(address[] memory) {
        return myArr; 
    }
}
