pragma solidity ^ 0.5.0;
contract Royalties {
  string public name = "RoyaltiesContract";

  uint public nextArtistId = 1;
  uint public nextSongId = 0;
  uint public nextCollabId = 0;

  mapping(uint => Artist) public Artists;
  
  struct Artist {
    uint id;
    string ArtistName;
    address ArtistAddress;
  }

  function createArtist(string memory ArtistName,address Artistaddress) public returns(uint id, string memory Name, address Address) {
      Artists[nextArtistId] = Artist(nextArtistId,ArtistName, Artistaddress);
      nextArtistId++;
       return(nextArtistId,ArtistName, Artistaddress);
  }

function getArtist(uint id) view public returns(uint, string memory , address){
            return(Artists[id].id,Artists[id].ArtistName, Artists[id].ArtistAddress);
    }

}
