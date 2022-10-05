    pragma solidity^0.4.2;

contract Test {
mapping (address => uint) content2view;
 address[] contents;
 

 function getStatistics() external view returns (address[], uint[]){
    address[] memory resAddr;
    uint[] memory views;
    for(uint i = 0; i<contents.length; i++){
        resAddr[i] = contents[i];
        views[i] = content2view[contents[i]];
    }
    return (resAddr, views);
}
}
