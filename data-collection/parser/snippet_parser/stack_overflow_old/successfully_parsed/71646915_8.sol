function GasCost(string memory name, 
    function () internal returns (string memory) fun) 
    internal returns (string memory) 
{
    uint u0 = gasleft();
    string memory sm = fun();
    uint u1 = gasleft();
    uint diff = u0 - u1;
    return concat(name, " GasCost: ", stringOfUint(diff), 
                " returns(", sm, ")");
}
