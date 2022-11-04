

pragma solidity 0.8.9;

contract Stack{

    uint public Count;
    uint[] public Storage;
    constructor(){
        Count = 0;
    }
    function Push(uint _value) public{
        Storage[Count] = _value;
        Count++;
    }
    function Pop() public{
        if(Count > 0){
            delete Storage[Count];
            Count--;
        }
    }
}
