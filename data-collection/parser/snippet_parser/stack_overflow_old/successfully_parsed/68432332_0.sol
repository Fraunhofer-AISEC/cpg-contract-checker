contract SubA {
    uint256 vara;
}
contract SubB {
    uint256 varb;
}
contract SubA_V1 is SubA {
    function getVar(){ return vara; }
}
contract SubB_V1 is SubB {
    function calculateVar(){ return varb * 10; }
}
contract ParentContract {
    function getVars(){
        SubA.getvar(); 
       SubB.calculateVar(); 
    }
}
