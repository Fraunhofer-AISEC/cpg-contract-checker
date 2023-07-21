pragma solidity ^0.8.18;

    contract Object {
        bytes32 private UID;
        bytes private Desc;

        constructor(bytes32 _UID, bytes memory _Desc) {
            UID             = _UID;
            Desc            = _Desc;
            }

        function getUID() view public returns (bytes32) {
            return UID;
            }

        function getDesc() view public returns (bytes memory) {
            return Desc;
            }
    }
