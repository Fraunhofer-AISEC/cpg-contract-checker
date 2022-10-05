       pragma solidity ^0.5.1;

        contract EternalStorage {

            function setString (
                bytes32 h,
                string memory v
                ) public;

            function getString (
                bytes32 h
                ) public view returns (
                    string memory
                );
function setAddress (
        bytes32 h,
        address v
        ) public;

    function getAddress (
        bytes32 h
        ) public view returns (
            address
        );


        }

        contract Contract(A){

              EternalStorage s;

constructor(address _mySign) public {

         s = EternalStorage(_mySign);
    }

    struct Agreement {
        bytes32  id;
        address owner;
        string hash;
}            

function createData(
             bytes _id,
             address _owner,
             string memory _hash) public returns (bool success) {

            Data[_id].id = _id;
            Data[_id].owner = _owner;
            Data[_id]._hash = _hash;

    s.setAddress(keccak256(abi.encodePacked("Agreement - Owner",_id)), agreements[_id].owner);
            s.setString(keccak256(abi.encodePacked("Agreement - FileHash",_id)), agreements[_id].fileHash);

    }
