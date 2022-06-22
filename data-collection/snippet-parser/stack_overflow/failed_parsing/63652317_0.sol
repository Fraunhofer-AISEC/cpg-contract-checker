function Gamer_List()public payable{
   for(uint256 i = 0 ; i < members ; i++){
       emit event_list(i,player[i]);
   }
}
event event_list(address num_id , string player_name);
