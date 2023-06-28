pragma solidity >=0.4.22 <0.6.0;

contract blog {


struct Posting {
    string judul;
    string content;
    address penulis;
    uint256 timestamp;
}

mapping(address => Posting[]) public penulisPost;

Posting[] public artikel;



function addArtikel(string memory _judul, string memory _content) public {
   Posting memory post = Posting(_judul, _content,  msg.sender, now);
   penulisPost[msg.sender].push(post);
    artikel.push(post);
    }
}
