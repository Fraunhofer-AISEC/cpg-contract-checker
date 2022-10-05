  struct Interval { 
    uint32 num;
    int32  core;
    uint32 next; 
  } 

  mapping(int32 => Interval) list;
  function createList(){
      for(int i; i < 100; i++)
          list[i] = Interval( { num: 10, core: 10, next: 10 });
   
      }
  }

  function iterateList(){
     for(int i; i < 100; i++){
         list[i];
  
     }
  }

  function singlePush(){ 
      list[0] = Interval( { num: 10, core: 10, next: 10 });        
  }

  function emptyCall(){ 
  }
