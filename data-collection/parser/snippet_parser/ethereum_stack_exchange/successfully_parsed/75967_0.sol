contract Puzzle {
     address payable public owner ;
     bool public locked ;
     uint public reward ;
     bytes32 public diff ;
     bytes public solution ;


     
     constructor ( ) payable public{
     owner = msg.sender ;
     reward = msg.value ;
     locked = false ;
      
     diff = bytes32 (uint256(11111));
  }

  function () payable external{ 
    if ( msg. sender == owner ){ 
       
       
       require(!locked);
       bool val=owner.send ( reward );
       reward = msg.value ;
    }
    else
    if ( msg . data . length > 0){ 
        require(!locked);
       
          if ( sha256 (msg. data ) < diff ){
             bool val=msg. sender . send ( reward ); 
             solution = msg. data ;
             locked = true ;
       }}}}
