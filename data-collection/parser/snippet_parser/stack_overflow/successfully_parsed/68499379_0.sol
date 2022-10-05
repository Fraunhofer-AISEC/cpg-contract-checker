function transferEther(address rec,uint _amount) public payable {
  address(rec).transfer(_amount);
    }
