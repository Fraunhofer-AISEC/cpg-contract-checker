  struct Interval { 
    uint32 num;
    int32  core;
    uint32 next; 
  } 

  Interval[] list;
  function createList(){
      for(int i; i < 100; i++)
         list.push(Interval( { num: 10, core: 10, next: 10 }) );
  
      }
  }

  function iterateList(){
     for(int i; i < 100; i++){
         list[i]; 
  
     }
  }

  function singlePush(){ 
      list.push(Interval( { num: 30, core: 10, next: 10 }) );         
  }

  function singleRead(){ 
      list[0];         
  }

  function emptyCall(){ 
  }
