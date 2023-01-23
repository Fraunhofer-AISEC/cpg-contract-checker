pragma solidity >=0.5.8 <0.6.0;
    
    contract Confirmation
    {

      struct Request
      {
          bytes32  Attr1 ;
           int256  Attr2 ;
           int256  VotesCnt ;
         mapping (address => bytes32) Votes ;
      }

    mapping (bytes32 => Request) Requests ;

       event VoteRequest(bytes32) ;

       constructor() public
       {
       }
    
       function SubmitRequest(bytes32  id_, bytes32  attr1, int256  attr2) public payable
       {
            Requests[id_]=Request({     Attr1: attr1,
                                        Attr2: attr2,
                                     VotesCnt:    0  }) ;
                
           emit  VoteRequest(id_) ;
       }

       function GetRequest(bytes32  id_) public view returns (bytes32, int256 retVal) 
       {
           return(Requests[id_].Attr1, Requests[id_].Attr2) ;
       }

       function AllowRequest(bytes32  id_) public
       {
           if(Requests[id_].Votes[tx.origin]=="Y")  return ;
           
              Requests[id_].Votes[tx.origin]="Y" ;
              Requests[id_].VotesCnt++ ;
           
           if(Requests[id_].VotesCnt==5)  {



                                          }
       }
    
    }   
