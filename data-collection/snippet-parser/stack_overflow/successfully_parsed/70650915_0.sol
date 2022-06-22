function uploadImage(string memory _imgHASH,string memory _description ) public{
 
 require(bytes(_imgHASH).length > 0);
  
  require(bytes(_description).length > 0);

  require(msg.sender != address(0));

  
  imageCount ++;

  
  images[imageCount] = Image(imageCount,_imgHASH,_description,0,msg.sender);


  
  emit ImageCreated(imageCount, _imgHASH, _description, 0, msg.sender);
}
