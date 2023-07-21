
pragma solidity ^0.8.6;

contract CommitteePrecompiled{
    function RegisterNode() public;                                     
    function QueryState()   public view returns(string memory, int );  
    function QueryGlobalModel()  public view returns(string memory, int );   
    function UploadLocalUpdate(string memory, int256 )  public;  
    function UploadScores(int256 , string memory)   public; 
    function QueryAllUpdates()  public view returns(string memory); 
}
