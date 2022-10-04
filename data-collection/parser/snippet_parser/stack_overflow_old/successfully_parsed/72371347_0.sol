uint256[] public tokens; 
address[] public clients; 
string[] public uris;  
function getNftUri() public {
         for (uint256 i = 0; i < tokens.length; i++){
             uint256 t = tokens[i];
             for (uint256 j = 0; j < clients.length; j++){
                 address client = clients[j];
                 if (client == msg.sender){
                     uris.push(nftCollection2[t][client]);
                 }
             }
         }
         
}
