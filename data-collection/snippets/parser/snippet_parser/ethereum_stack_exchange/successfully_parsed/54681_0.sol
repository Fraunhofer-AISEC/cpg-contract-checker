struct arrayy{
    uint256[] arrayvalue;
}
mapping(address => arrayy) arraymapping;

event logg(
    uint256 z,
    address sender
);

function get(uint256 y, address _owner) internal{
   arraymapping[_owner].arrayvalue.push(y);
   emit logg(y,_owner);
}

function getarray(address _owner) internal returns(uint256[]){

    return(arraymapping[_owner].arrayvalue);
}
