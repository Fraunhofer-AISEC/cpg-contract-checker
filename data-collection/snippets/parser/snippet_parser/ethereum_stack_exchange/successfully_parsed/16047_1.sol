   function getIndexReadFrom() constant returns ( uint ) {
    return clusterContract[msg.sender].getIndexReadFrom();
   }
