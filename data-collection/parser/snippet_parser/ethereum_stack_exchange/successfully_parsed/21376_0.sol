pragma solidity ^0.4.13;

contract SampleContract {
struct ChildStruct {
    bool isPresent;
    bytes32 name;
}

struct ParentStruct {
    bool isPresent;
    bytes32 name;
    
}

mapping(bytes32 => ParentStruct) sampleStructs;

function insertData(bytes32 parentAddress, bytes32 parentName
                       
                       )
public returns(bool success)
{
    ParentStruct storage c = sampleStructs[parentAddress];
    c.isPresent = true;
    c.name = parentName;
    
    return true;
}

function validate(bytes32 parentAddress)
public returns(bool isPresent, string name) 
{
    return 
    (sampleStructs[parentAddress].isPresent,
    bytes32ToString(sampleStructs[parentAddress].name)
    );
}

function bytes32ToString(bytes32 x) constant returns (string) 
{
    bytes memory bytesString = new bytes(32);
    uint charCount = 0;
    for (uint j = 0; j < 32; j++) {
        byte char = byte(bytes32(uint(x) * 2 ** (8 * j)));
        if (char != 0) {
            bytesString[charCount] = char;
            charCount++;
        }
    }
    bytes memory bytesStringTrimmed = new bytes(charCount);
    for (j = 0; j < charCount; j++) {
        bytesStringTrimmed[j] = bytesString[j];
    }
    return string(bytesStringTrimmed);
}
}
