pragma solidity ^0.4.16;

import "./BulkyChunky.sol";
import "./Callee.sol";
import "./BCSchema.sol";

contract Caller is BulkyChunky, BCSchema {

DefinitionV1 Definition;

function getData() public view returns (uint16 ,address , uint8   , string, string, string ){

    return(Definition.version, Definition.adrs, Definition.id, Definition.name, Definition.description, Definition.bytecode);
}

function createBuffere() public {

    Callee callee = Callee(0x610033b6dd5a08004e46f2097ca09b693d744118);

    callee.serialize();
    uint buffer_size = callee.getBufferSize();

    initializeBuffer(buffer_size);         
 }

function fetchBulk() public  {

    require(Buffer.size > 0);
    uint bulk_size = Buffer.size / BULK_BYTES_SIZE;
    if(Buffer.size % BULK_BYTES_SIZE > 0)
        bulk_size++;

    Callee callee = Callee(0x610033b6dd5a08004e46f2097ca09b693d744118);
    bytes memory buffer = Buffer.data;
    for(uint16 j=0 ; j < bulk_size ; j++){

        uint[BULK_CHUNK_SIZE] memory bulk = callee.getBulk(j+1);

        for(uint i = 1 ; i<= BULK_CHUNK_SIZE; i++)
           uintToBytes((i * 32) + (j * BULK_BYTES_SIZE), bulk[i-1], buffer);   
    }

   Buffer.data = buffer;
}


function deserialize() public {

    require(Buffer.size > 0);
    bytes memory buffer = Buffer.data;
    uint offset = Buffer.size;
    uint string_size;
    Definition.version = bytesToUint16(offset, buffer);
    offset -= sizeOfUint(16);

    Definition.adrs = bytesToAddress(offset, buffer);
    offset -= sizeOfAddress();

    Definition.id = bytesToUint8(offset, buffer);
    offset -= sizeOfInt(8); 

    string_size = getStringSize(offset, buffer);
    string memory name = new string(string_size);
    bytesToString(offset, buffer, bytes(name));
    offset -= sizeOfString(name);

    string_size = getStringSize(offset, buffer);
    string memory description = new string(string_size);
    bytesToString(offset, buffer, bytes(description));
    offset -= sizeOfString(description);

    string_size = getStringSize(offset, buffer);
    string memory bytecode = new string(string_size);
    bytesToString(offset, buffer, bytes(bytecode));
    offset -= sizeOfString(bytecode);

    Definition.name = name;
    Definition.description = description;
    Definition.bytecode = bytecode;
}

function serialize() public {
 }
}
