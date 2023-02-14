 import "./TitanToken.sol";

  
    function newToken(uint256 _initialSupply, bytes32 _name, bytes32 _symbol) 
    public
    returns(address, bytes32){
        TitanToken T = new TitanToken(_initialSupply,_name,_symbol);
        return (T, _name);
}
