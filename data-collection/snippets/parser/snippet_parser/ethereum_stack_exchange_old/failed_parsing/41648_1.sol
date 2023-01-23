contract Db {

    mapping (address => mapping (bytes32 => bytes32)) data;

    

    function getAge(address usr) public view returns (uint) {
        return getUint(usr, keccak256('age'));
    }

    function setAge(address usr, uint age) public {
        setUint(usr, keccak256('age'), age);
    }

    function getName(address usr) public view returns (string) {
        return getString(usr, keccak256('name'));
    }

    function setName(address usr, string name) public {
        setString(usr, keccak256('name'), name);
    }

    

    function getUint(address usr, bytes32 ky) internal view returns (uint) {
        return uint(data[usr][ky]);
    }

    function setUint(address usr, bytes32 ky, uint val) internal {
        data[usr][ky] = bytes32(val);
    }

    function getString(address usr, bytes32 ky) internal view returns (string) {
        return bytes32ToString(data[usr][ky]);
    }

    function setString(address usr, bytes32 ky, string val) internal {
        data[usr][ky] = stringToBytes32(val);
    }

    

    function bytes32ToString(bytes32) internal returns (string) {
         ..
    }

    function stringToBytes32(string) internal returns (bytes32) {
         ..
    }

}
