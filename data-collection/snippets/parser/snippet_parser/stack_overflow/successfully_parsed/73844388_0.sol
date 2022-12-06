pragma solidity ^0.5.16;
pragma experimental ABIEncoderV2 ;
contract Users {
    struct Drug {  
         string name;
        uint Qt;
        uint Qs;
        uint Qr;
    }
 

    event DrugAdded(
        string name,
      uint Qt,
      uint Qs,
      uint Qr
    );
    Drug[] public drugs;
 uint counter=0;
    function addDrug(string memory _name, uint _Qt, uint _Qs, uint _Qr) public {
       drugs.push(
            Drug(_name, _Qt,_Qs,_Qr)
        );
        emit DrugAdded(_name, _Qt,_Qs,_Qr);
        counter++;
    }

    function getdrugs(string memory _name) public view returns (Drug[] memory) {
        for(uint i=0;i<counter;i++){
            if (keccak256(abi.encodePacked((drugs[i].name))) == keccak256(abi.encodePacked((_name)))){
                return drugs[i];
            }
        }
       
    }
}