
pragma solidity ^0.4.21;

contract SaveData {
    uint a;
    function getA () public view returns (uint _a){
    }
    function setA () public{ 
        
    }
}

contract getData {
    uint b;
    function getAfrom () public view returns (uint){
        SaveData sd = SaveData(0x8c1eD7e19abAa9f23c476dA86Dc1577F1Ef401f5); 
        return sd.getA();
    }
}
