   
   
   

   function fillOrder(uint256 _id) public {
    
    require(_id > 0 && _id <= orderCount , 'order does not exist');
    
    require(!orderFilled[_id]); 
    
    require(!orderCancelled[_id]); 



    
    _Order storage _order = orders[_id] ;

   

   _trade(
    _order.id,
    _order.user,
    _order.tokenGet,
    _order.amountGet,
    _order.tokenGive,
    _order.amountGive
   );

   
   orderFilled[_order.id] = true ;
   

   }

   function _trade(
    uint256 _orderId,
    address _user,
    address _tokenGet,
    uint256 _amountGet,
    address _tokenGive,
    uint256 _amountGive
   ) internal {

    
    
    uint256 _feeAmount = (_amountGet * feePercent) / 100 ;
   

    

    
    

    tokens[_tokenGet][msg.sender] = tokens[_tokenGet][msg.sender] - (_amountGet + _feeAmount);
    tokens[_tokenGet][_user] = tokens[_tokenGet][_user] + _amountGet ;

    
    tokens[_tokenGet][feeAccount] = tokens[_tokenGet][feeAccount] + _feeAmount ;


    

    tokens[_tokenGive][_user] = tokens[_tokenGive][_user] - _amountGive ;
    tokens[_tokenGive][msg.sender] = tokens [_tokenGive][msg.sender] + _amountGive ;

    
    emit Trade (
     _orderId,
     msg.sender,
     _tokenGet,
     _amountGet,
     _tokenGive,
     _amountGive,
     _user,
     block.timestamp
    );


   }
