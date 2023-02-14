modifier onlyManagement {

    require( msg.sender == management || msg.sender == owner );
    _;

}

function someFunction() public onlyManagement{
  
}
