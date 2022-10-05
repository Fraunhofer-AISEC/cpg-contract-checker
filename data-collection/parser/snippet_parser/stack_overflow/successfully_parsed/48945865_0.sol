contract MyContract{
    address[2048] public field;
    function getField() external view returns(address[2048]){
        return field;
    }
}
