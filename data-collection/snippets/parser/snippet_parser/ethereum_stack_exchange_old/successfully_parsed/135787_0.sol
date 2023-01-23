
pragma solidity >=0.7.1 <0.9.0;
contract myArray{
uint [][] ipadPriceRam =[[uint(1000),1200,1300],[uint(8),16,32]];
string [][] appleProduct=[["ipad","macbook","iphone"],["airpod","typec","headphone"]];
function getIpadPriceRam() public view returns(uint){
    return ipadPriceRam[0][1];
}
function appleProductAccess() public view returns(string memory){
    return appleProduct[1][1];
}

}
