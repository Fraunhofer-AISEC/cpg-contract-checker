mapping (bytes32 => bytes) public simpleDB;

function set(bytes32 key, bytes data)
    onlyOwner
{
    simpleDB[key] = data;
}
