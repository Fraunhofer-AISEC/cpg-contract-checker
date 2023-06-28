function destroy(id) internal

{
   delete clusterContract[msg.sender].my_status[storedIDs[id]]; 
}
