contract MyContract {
   string private _name;
   constructor(string memory name) {
      _name = name;
   }
   function getName() public view returns(string memory) {
     return _name;
   }
} 
