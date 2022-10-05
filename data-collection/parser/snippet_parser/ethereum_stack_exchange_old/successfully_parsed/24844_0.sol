mapping(bytes32 => address) public reserved_names;

function create_artist(bytes32 username, string ipfs) {

   

   reserved_names[username] = msg.sender;
}