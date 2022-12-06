
pragma solidity 0.8.15;

contract test {

    mapping (address => uint) num;

    modifier entier(uint _uint){
        
        require(_uint > 0,'ca ne peut pas etre egal a 0');
        _;
    }

    uint public Setblocknumber;

    modifier blockSet() {
        require(uint(block.number) != Setblocknumber,'the user has already modified the num on this block');
        _;
    }

    function getSetBlocknumber() view public returns(uint){
        return Setblocknumber;
    }

    function getNum() view public returns(uint){
        return num[msg.sender];
    }

    function setNum(uint _uint) public entier(_uint) blockSet(){
        num[msg.sender] += _uint;
        Setblocknumber = uint(block.number);   
    }
}
