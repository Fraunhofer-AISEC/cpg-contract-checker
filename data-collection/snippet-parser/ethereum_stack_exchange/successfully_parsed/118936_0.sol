contract TimeHelpers {
   function getTimestamp() internal virtual view {
       return block.timestamp;
   }
}
