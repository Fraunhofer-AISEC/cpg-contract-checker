
pragma solidity ^0.8.7;


contract Library
{


enum Book  {WingsOfFire, RichDadPoorDad,DoItToday,AtomicHabits,TheArtOfSuccess}


struct StudentStruct
{
    string name;
    bool isStudent;
    uint rollNo;
    Book [] books;


}


mapping (address => StudentStruct) public studentStructs;
 address [] public students ;

 modifier OnlyIfRegistered ()
 {

   require (studentStructs[msg.sender].isStudent);
   _;

 }

function Register(  )public returns (bool success)
{
   require(!studentStructs[msg.sender].isStudent);
   students.push(msg.sender);
   studentStructs[msg.sender].isStudent=true;
   return true;


}


function Addbook ( Book B) public OnlyIfRegistered returns(bool success)
{
   studentStructs[msg.sender].books.push(B);
   return true;
     
}

function remove(uint index) public OnlyIfRegistered returns (bool success)
{

        

       delete studentStructs[msg.sender].books[index]; 
       return true;

}


 function getBook(address user,uint256 raw ) public view returns (string memory  )
  {

      
     studentStructs[user].books[raw]; 
   

  }

 
}
