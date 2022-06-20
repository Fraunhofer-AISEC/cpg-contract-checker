mapping(bytes32 => address) public reserved_names;
bytes32[] public namesInUse;

function create_artist(bytes32 username, string ipfs) {
    for (uint i = 0; i < namesInUse.length; i++) {
        require(namesInUse[i] != username);
    }
    reserved_names[username] = msg.sender;
    
}
