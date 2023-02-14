mapping(bytes32 => address) public reserved_names;

function create_artist(bytes32 username, string ipfs) {

   
   require(reserved_names[username] == 0x0)

   reserved_names[username] = msg.sender;

   ...
}
