pragma solidity ^0.4.7;

contract abc{
    struct Owner{
        bool exist;
        address owner;
        uint share;
        bool sub;
    } 

    mapping (address => Owner) public Owners;
    uint public no_owners; 
    uint public no_sub;


    function abc(){ 
        
    }

    function transfer(address to,uint amount){
        
    }
}

contract cde{
    mapping (uint => abc) all_cde;
    uint public f;


    function ask_subdivise(abc a){
        
        
        if (a.Owners[msg.sender].sub = false){
            a.Owners[msg.sender].sub=true;
            a.no_sub+=1;

        }
    }
}   
