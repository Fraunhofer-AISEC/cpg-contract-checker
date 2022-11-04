pragma solidity ^0.8.0;

contract Pharm {
    struct Presc {
        uint id;
        uint ref;
        uint nbOfDrugs;
        string Pname;
        Drug[] drugs; 
    }

    struct Drug {
        uint id; 
        string name;
        uint Qtt;
    }

    Drug[] drugss;
    mapping(uint=> Presc) public mapPresc;
    mapping(uint=> Drug) public mapDrug;
        
    function addDrugs(uint _id, string memory _name, uint _Qtt) public { 
        _id=1;
        Drug storage drgs= mapDrug[_id];
        drgs.id=_id;
        drgs.name=_name;
        drgs.Qtt=_Qtt;
        _id++;
    }

    function addPresc(uint _ref, uint _nbOfDrugs, string memory _Pname, Drug memory _list) public { 
        uint _id = 1;
        Presc storage presc = mapPresc[_id];

        for(_id=1; _id <= _nbOfDrugs; _id++){
            addDrugs(_id, Drug[_id].name, Drug[_id].Qtt);
        }

        presc.id=_id; 
        presc.ref=_ref;
        presc.nbOfDrugs=_nbOfDrugs;
        presc.Pname=_Pname;
    }
}
