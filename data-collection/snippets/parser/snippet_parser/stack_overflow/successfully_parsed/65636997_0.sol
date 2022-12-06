pragma solidity ^0.5.8;

contract Jokes
{

    struct Joke 
    {
         string                 text ;
        address                 sender ;
        bytes32                 author ;
        uint256                 votes ;
        mapping (bytes32=>bool) voters ;
    }

    mapping (bytes32 => Joke)  JokesList ;
                  bytes32[10]  Top10 ;

    event JokeCreated(bytes32 hash, string text, address sender, bytes32  author) ; 
    event JokeVoted  (bytes32 hash, bytes32 voter) ; 

    constructor() public
    {
    }

   function NewJoke(string  memory text_, bytes32  author_) public 
   {
       bytes32  hash ;
    
            hash=keccak256(abi.encodePacked(text_)) ;

       if(JokesList[hash].author!=0x00)  require(false) ;

         JokesList[hash] =Joke({   text: text_, 
                                 sender: tx.origin,
                                 author: author_,
                                  votes: 0         }) ;

      emit JokeCreated(hash, text_, tx.origin, author_) ; 
   }


   function VotesForJoke(bytes32  hash_, bytes32  voter_) public 
   {
      uint256  votes ;
      uint256  i ;


       if(JokesList[hash_].author==0x00)  require(false) ;

       if(JokesList[hash_].voters[voter_]==true)  require(false) ;

          JokesList[hash_].voters[voter_]=true ;
          JokesList[hash_].votes++ ;


            votes=JokesList[hash_].votes ;

        for(i=9 ; i>=0 ; i--)
          if(votes>=JokesList[Top10[i]].votes)
          {
              if(i!=9 && Top10[i]!=hash_)  Top10[i+1]=Top10[i] ;
          }
          else
          {
               break ;  
          }

          if(i!=9)  Top10[i+1]=hash_ ;


      emit JokeVoted(hash_, voter_) ; 
   }

   function GetJoke(bytes32  hash_) public view returns (string memory, address, bytes32,uint256 retVal)
   {
        return(JokesList[hash_].text, JokesList[hash_].sender, JokesList[hash_].author, JokesList[hash_].votes) ;
   }

   function GetTop10() public view returns (bytes32[10] memory retVal)
   {
       return(Top10) ;
   }
    
}

