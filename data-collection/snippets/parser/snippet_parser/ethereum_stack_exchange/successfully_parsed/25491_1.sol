function getManager(uint index) constant returns (bytes32, address){
    ManagerStruct ms = Managers[managerIndex[index]];
    return (ms.firstname, managerIndex[index]);
}
