pragma solidity ^0.4.16;

import "./BulkyChunky.sol";
import "./BCSchema.sol";

contract Callee is BulkyChunky, BCSchema {

DefinitionV1 Definition;

function getData() public view returns (uint16 version,address adrs, uint8   id, string  name, string description, string bytecode){
    version = Definition.version;
    adrs    = Definition.adrs;
    id      = Definition.id;
    name    = Definition.name;
    bytecode= Definition.bytecode;
    description = Definition.description;
}

 function serialize() public {

    Definition.version  = 1;
    Definition.adrs     = 0xcab77b4b9bf9b92a53572091c5798c570051be8f;
    Definition.id       = 123;
    Definition.name     = new string(32);
    Definition.bytecode = new string(128);
    Definition.description = new string(128);

    Definition.name  = "BulkyChunky";

    Definition.description = "BulkyChunky is a contract aims to facilitate transffering big amount of data between the Solidity smart contracts ";

    Definition.bytecode = "0x60606040526110cc806100136000396000f30060606040526004361061008e\
                            576000357c010000000000000000000000000000000000000000000000000000";



    Buffer.size = sizeOfString(Definition.bytecode) +
                  sizeOfString(Definition.description) +
                  sizeOfString(Definition.name) +
                  sizeOfUint(16) +
                  sizeOfInt(8) + 
                  sizeOfAddress();

    if(Buffer.size % 32 > 0) 
        Buffer.size +=  (Buffer.size % 32);                     

    bytes memory buffer = new bytes (Buffer.size);

    Buffer.chunk_count = Buffer.size / 32;

    if(Buffer.size % CHUNK_BYTES_SIZE > 0 ) {
        Buffer.chunk_count++;
    }

    
    uint offset = Buffer.size;

    uintToBytes(offset,Definition.version, buffer);
    offset -= sizeOfUint(16);

    addressToBytes(offset,Definition.adrs, buffer);
    offset -= sizeOfAddress();

    uintToBytes(offset, Definition.id, buffer);
    offset -= sizeOfInt(8); 

    stringToBytes(offset,  bytes(Definition.name), buffer);
    offset -= sizeOfString(Definition.name);

    stringToBytes(offset,  bytes(Definition.description), buffer);
    offset -= sizeOfString(Definition.description);

    stringToBytes(offset,  bytes(Definition.bytecode), buffer);
    offset -= sizeOfString(Definition.bytecode);

    Buffer.data = buffer;
} 


function deserialize() public {

}

function fetchBulk()   public {

}
}
