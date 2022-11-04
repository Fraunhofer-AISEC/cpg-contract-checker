contract ImageInfo{
   mapping(address=>Image[]) private images;
   struct Image{
      string imageHash;
      string ipfsInfo;
   }
   function uploadImage(string hash, string ipfs) public{
       images[msg.sender].push(Image(hash,ipfs)); 
   }
}
