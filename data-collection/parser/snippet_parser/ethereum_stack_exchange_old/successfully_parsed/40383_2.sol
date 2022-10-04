struct Test {
    uint256 rank;
}
mapping(bytes32 => Test) public store;

function setStore(uint256 _unt) returns(bytes32){
    bytes32 aux = sha3("i");
    store[aux].rank = _unt;
    return aux;
}
function minusYolo(bytes32 _key) returns(uint256){
    store[_key].rank--;
    return store[_key].rank;

}
