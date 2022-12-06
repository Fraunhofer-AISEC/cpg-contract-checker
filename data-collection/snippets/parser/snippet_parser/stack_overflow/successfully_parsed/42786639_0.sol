  contract m{


  struct Message{

    address sender;
    address receiver;
    uint msgContent;

                } 

 Message[] all; 

function get ( address from ) internal 
                                        returns ( Message[] subMsgs){


     for ( uint i=0; i<all.length ; i++)

      {
         if ( all[i].sender == from )
             { 
               subMsgs.push (all[i]);
             }
      }


          return subMsgs;  
          } 
       } 
