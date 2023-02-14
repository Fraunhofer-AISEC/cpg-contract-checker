contract ManagerDb {

    struct ManagerStruct {
        bytes32 firstname;
        bytes32 lastname;
        bytes32 email;
        uint index;
    }

    mapping ( address => ManagerStruct ) Managers;
    address[] public managerIndex; 

    function insertManager(
        address managerAddress,
        bytes32 firstName,
        bytes32 lastName,
        bytes32 email
    )
        returns (bool)
    {

        ManagerStruct memory newManager;
        newManager.firstname = firstName;
        newManager.lastname = lastName;
        newManager.email = email;
        newManager.index = managerIndex.push(managerAddress)-1;

        Managers[managerAddress] = newManager;
        return true;
    }

    
    function getArrayData() constant returns (bytes32[] _data1) {

        uint arrLength = managerIndex.length;
        bytes32[] memory arrData1 = new bytes32[](arrLength);
        for (uint i=0; i <= arrLength; i++){
            address addr = managerIndex[i];
            ManagerStruct ms = Managers[addr];
            arrData1[i] = ms.firstname;
        }

        return (arrData1);
    }
}
