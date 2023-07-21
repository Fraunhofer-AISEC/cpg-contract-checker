
pragma solidity ^0.8.6;

abstract contract CommitteePrecompiled{
    function RegisterNode() virtual public;                                     
    function QueryState()   virtual public view returns(string memory, int );  
    function QueryGlobalModel()  virtual public view returns(string memory, int );   
    function UploadLocalUpdate(string memory, int256 )  virtual public;  
    function UploadScores(int256 , string memory)   virtual public; 
    function QueryAllUpdates()  
}
