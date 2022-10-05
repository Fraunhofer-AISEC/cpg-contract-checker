contract MyContract{
    
    
  struct Center{
    uint id;
    string name;
    uint ppeCount;
    address receiver;
  }
  mapping(uint => Center) private centers;
  
  address A1 = 0xB2F508Bf8E4A177934C8945B0D219601a5728c4B;
  address B1 = 0xDB9a942bd4B79c6203206779e7ffc7aF5d237180 ;

  
  
  constructor() public{
    addCenter('Health Ministry',A1);
    addCenter('Division',B1);
    
  }

  function addCenter(string memory _name, address _receiver) private {
    centerCount++;
    centers[centerCount] = Center(centerCount, _name, 0, _receiver);
  }
  
  function distribution(uint _centerId,  uint _amount) payable public{
      
      
      require(_centerId >0 && _centerId <= centerCount);

      if(_amount<100){
        revert('Sorry you have to send at least 100 ppe');
      }

      centers[_centerId].ppeCount+=_amount;
      
      if(_centerId == 1){
        balance+=_amount;
        bonus+=100;
        _view[_centerId] = PublicView(_centerId, 'Health Ministry', balance);
        
      }
      if(_centerId == 2){
        baln+=_amount;
        bonus+=100;
         _view[_centerId] = PublicView(_centerId, 'Division', baln);


      }
  }
function withdraw(uint _id, address yourAddress, uint _amount) public{
        secretAddress = msg.sender;
        
        if(secretAddress != yourAddress){
            revert("You don't have that right to withdraw even 1 ppe!");
        }
      
        
        if(_id == 1 && yourAddress == A1 &&_amount <= balance){
            balance -= _amount;
            centers[_id] = Center(_id, 'Health Ministry', balance, yourAddress);
            _view[_id] = PublicView(_id,'Health Ministry', balance);
            
        }
        else if(_id == 2 && yourAddress == B1 && _amount <= baln){
            baln -= _amount;
            centers[_id] = Center(_id, 'Authorized Hospital', baln, yourAddress);
             _view[_id] = PublicView(_id,'Division', baln);

            
        }
        else{
            revert("Id is not valid! ");
        }
    }
}

