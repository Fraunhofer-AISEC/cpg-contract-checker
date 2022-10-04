function createSLA(bytes32 _from, bytes32 _to)
    public
{
    bytes32 hash = keccak256(_from, _to);        
    listSlas.push(hash);
}
