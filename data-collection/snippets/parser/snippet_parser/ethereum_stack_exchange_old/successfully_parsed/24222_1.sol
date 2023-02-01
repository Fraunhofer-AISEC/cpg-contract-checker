contract FirstContract {

    address creator; 

    function FirstContract() {
        creator = msg.sender; 
    }

    modifier onlyCreator() {
        require(msg.sender == creator); 
        _;                              
    } 

    function anyFunction() onlyCreator {} 

}
