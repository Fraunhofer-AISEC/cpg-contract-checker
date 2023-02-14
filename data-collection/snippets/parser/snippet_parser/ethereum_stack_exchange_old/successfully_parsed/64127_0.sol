contract Storage {

   mapping(bytes32 => uint256)    private uIntStorage;
   mapping(bytes32 => string)     private stringStorage;
   mapping(bytes32 => address)    private addressStorage;
   mapping(bytes32 => bytes)      private bytesStorage;
   mapping(bytes32 => bool)       private boolStorage;
   mapping(bytes32 => int256)     private intStorage;

   function getAddress(bytes32 _key) public view returns (address) {
       return addressStorage[_key];
   }

   function getUint(bytes32 _key) public view returns (uint) {
       return uIntStorage[_key];
   }

   function getString(bytes32 _key) public view returns (string) {
       return stringStorage[_key];
   }

   function getBytes(bytes32 _key) public view returns (bytes) {
       return bytesStorage[_key];
   }

   function getBool(bytes32 _key) public view returns (bool) {
       return boolStorage[_key];
   }

   function getInt(bytes32 _key) public view returns (int) {
       return intStorage[_key];
   }


   function setAddress(bytes32 _key, address _value) public {
       addressStorage[_key] = _value;
   }

   function setUint(bytes32 _key, uint _value) public {
       uIntStorage[_key] = _value;
   }

   function setString(bytes32 _key, string _value) public {
       stringStorage[_key] = _value;
   }

   function setBytes(bytes32 _key, bytes _value) public {
       bytesStorage[_key] = _value;
   }

   function setBool(bytes32 _key, bool _value) public {
       boolStorage[_key] = _value;
   }

   function setInt(bytes32 _key, int _value) public {
       intStorage[_key] = _value;
   }
 }
