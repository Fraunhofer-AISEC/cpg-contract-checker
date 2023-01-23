contract EternalStorage {

    mapping(bytes32 => uint) uIntStorage;

    function getUint(bytes32 _key) external view returns(uint) {
        return uIntStorage[_key];
    }

    function setUint(bytes32 _key, uint _value) external {
        uIntStorage[_key] = _value;
    }

    function deleteUint(bytes32 _key) external {
        delete uIntStorage[_key];
    }
}
