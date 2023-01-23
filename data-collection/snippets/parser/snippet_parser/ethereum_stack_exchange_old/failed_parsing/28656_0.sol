struct StoredData { 
    int a; 
    uint256 b;
    uint256 c; 
    uint256 d; 
    uint256 e; 
    uint256 f; 
}

mapping (uint256 => StoredData) private data; 
mapping (address => bool) public allowedToView; 

modifier onlyViewer() { 
  require(allowedToView[msg.sender]); 
  _; 
}


function getStoredData(_index) onlyViewer constant public 
returns (int, uint256, uint256, uint256, uint256, uint256) 
   { 
     return (data[_index].a, data[_index].b, data[_index].c, data[_index].d, data[_index].e, data[_index].f); 
   }
