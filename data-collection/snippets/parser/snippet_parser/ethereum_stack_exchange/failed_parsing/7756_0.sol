mapping ( uint256 => mapping (bytes32 => bytes32)) public users;

function add( uint256 id, bytes32[] list, mapping ( uint256 => mapping (bytes32 => bytes32) table){
    for( var i=0; i< list.length; i++ ){
        table[id][list[i]] = list[i];
    }
}
