

pragma solidity ^0.8.4;
pragma abicoder v2;



contract testabi {

    struct DATA {
        address a1;
        uint256 num;
        bytes nom;
    }

    bytes32 constant public DATA_TYPEHASH = keccak256("DATA(address a1,uint256 num,bytes nom)");


    DATA data1 = DATA(0x782DDbeBcCA0aC1952e6f8CD525f707B4e2B3077, 100, "0x0000000000000000000000000000000000000000000000000000000000011170000000000000000000000000420000000000000000000000000000000000000600000000000000000000000000000000000000000000000000000000000000600000000000000000000000000000000000000000000000000000000000000000");

    function encodeDecode1() public view returns(bytes32 ) {
            return keccak256(abi.encode(
            DATA_TYPEHASH,
            data1
        ));
    }

    function encodeDecode2() public view returns(bytes32 ) {
            return keccak256(abi.encode(
            DATA_TYPEHASH,
            data1.a1,
            data1.num,
            keccak256(data1.nom)
        ));
    }

  
}

