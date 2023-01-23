contract Picard {
    
    string public constant strFullName = "Jean Luc Picard";
    
    enum enuContractStates {Ready, Active, Paused}
    
    enuContractStates public state;

}
