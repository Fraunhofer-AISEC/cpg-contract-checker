struct Interval { 
  uint32 num;  
  uint32 next; 
}

prevNode     = self.list[self.head]; 
currentNode  = self.list[prevNode.next];
while( true ) {
  if( s > currentNode.num ){ 
    
    
    return prevNode.next; 

  }
  prevNode         = currentNode;
  currentNode      = self.list[currentNode.next];
}
