pragma solidity ^0.4.8; 
contract token{ 
    struct video { address vidAddress; string title; uint initialSupply; } 
    mapping(address=>video)videos; 
    function add(address vidAddress,string title,uint initialSupply){ 
    video memory v; 
    v.vidAddress=vidAddress; 
    v.title=title; 
    v.initialSupply=initialSupply; 
    videos[vidAddress]=v; 
    } 
}
