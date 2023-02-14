pragma solidity ^0.4.0;
contract PaperCopyright {
  struct Paper{
    string author;
    string fileHash;
    string title;
    uint date;
  }

  address public creator;

  Paper[] public papers;

  function PaperCopyright() {
    creator = msg.sender;
  }

  function add(string author,string file,string title) returns(bool) {
    if(msg.sender != creator) throw;
    papers.push(Paper({
        author: author,
        fileHash: file,
        title: title,
        date: now
    }));
    return true;
  }

  function edit(uint index,string author,string file,string title,uint  date) returns(bool) {
    if(msg.sender != creator) throw;
    papers[index] = Paper({
        author: author,
        fileHash: file,
        title: title,
        date: date
    });
    return true;
  }

  function (){
    throw;
  }
}
