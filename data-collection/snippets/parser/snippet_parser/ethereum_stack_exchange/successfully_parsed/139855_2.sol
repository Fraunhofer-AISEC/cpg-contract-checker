contract StringArrayContract {
 string[] public blob= ["joe","joel","janine"];

  function stringArrayFunc() public view returns(string[] memory){
    return blob;
  }
} 

 contract callReceiver {

  function callAndReturn(address _add) external view returns (string[] memory){
     string[] memory temp;
     (bool success, bytes memory retVal) = _add.staticcall(abi.encodeWithSignature("stringArrayFunc()"));
     if(success){ temp = abi.decode(retVal, (string[]));}
     return temp;
    }
   } 
