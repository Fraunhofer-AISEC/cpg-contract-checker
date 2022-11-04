contract storagetest8 {

    uint256 variable;

    function setCharacter(uint variable_) 
        external 
    {
        variable = variable_;        
    }


    function getVariables() 
        external view
    returns(uint64 variable1, uint64 variable2, uint64 variable3, uint64 variable4) {
        variable1 = uint64(variable);
        variable = uint64(variable>>64); 
        variable2 = uint64(variable);
        variable = uint64(variable>>64);
        variable3 = uint64(variable);
        variable4 = uint64(variable>>64) 
    }
}
