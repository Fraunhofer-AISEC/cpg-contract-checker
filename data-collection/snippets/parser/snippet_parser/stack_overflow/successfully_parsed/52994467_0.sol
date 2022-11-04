
pragma solidity >=0.7.0 <0.9.0;
contract ImgStorage {
    uint i=0;
    mapping(uint => string[]) public base64_images;
    function push(string memory  base64_img) public {
        base64_images[i].push(base64_img);
        i++;        
    }
    function returnImage(uint n) public view returns(string[] memory){
        return base64_images[n];
    }
}
