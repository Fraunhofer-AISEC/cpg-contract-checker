pragma solidity ^0.4.15;

contract ECDS {

Computer[] public computer;

event gotComputers(string _msg);
event addedComputer(string _msg, uint _cores, uint _cache, uint _coresVM, bool _mining);

struct Computer {
    uint cores;
    uint cache;
    uint coresVM;
    bool mining;
}

function addComputer(uint _cores, uint _cache, uint _coresVM, bool _mining) returns (bool success){
    Computer memory newComputer;

    newComputer.cores = _cores;
    newComputer.cache = _cache;
    newComputer.coresVM = _coresVM;
    newComputer.mining = _mining;

    computer.push(newComputer);
    addedComputer("A computer was added", _cores, _cache, _coresVM, _mining);
    return true;   
}

function getComputer() constant returns (uint[],uint[],uint[],bool[]){
    uint length = computer.length;

    uint[] memory coresList = new uint[](length);
    uint[] memory cacheList = new uint[](length);
    uint[] memory coresVMList = new uint[](length);
    bool[] memory miningList = new bool[](length);

    for(uint i = 0; i < length; i++){
        Computer memory currentComputer;
        currentComputer = computer[i];

        coresList[i] = currentComputer.cores;
        cacheList[i] = currentComputer.cache;
        coresVMList[i] = currentComputer.coresVM;
        miningList[i] = currentComputer.mining;
    }

    gotComputers("Got the list of computers");
    return (coresList, cacheList, coresVMList, miningList);
}

function availableFreeCores() constant returns (uint[]){
    uint length = computer.length;

    uint[] memory freeCoresList = new uint[](length);
    for(uint i = 0; i < length; i++){
        Computer memory currentComputer;
        currentComputer = computer[i];

        uint freeCores = currentComputer.cores - (currentComputer.cache / 2);

        freeCoresList[i] = freeCores;
    }
    return freeCoresList;
}
}
