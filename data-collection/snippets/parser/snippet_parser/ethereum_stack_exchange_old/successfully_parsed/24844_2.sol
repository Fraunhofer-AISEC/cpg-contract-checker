mapping(bytes32 => address) public reserved_names;
mapping(bytes32 => bool) public namesInUse;

function create_artist(bytes32 username, string ipfs) {
    require(!namesInUse[username]);
    reserved_names[username] = msg.sender;
    namesInUse[username] = true;
    
}
