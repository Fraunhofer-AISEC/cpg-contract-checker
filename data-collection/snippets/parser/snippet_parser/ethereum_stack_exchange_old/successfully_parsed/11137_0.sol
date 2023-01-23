library ObjectHistoryLib {

    event SerialObjEvent(
        bytes32 description,
        bytes32 repair,
        uint indexed serialIndex
    );

    function setObj(address _storageContract, uint serialId, bytes32 description, bytes32 repair) {
        SerialObjEvent(description, repair, serialId);
    }
}
