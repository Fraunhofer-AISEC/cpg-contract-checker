contract Flags {
   string public flag = unicode"🇦🇩";

   function setFlag(string memory _flag) public {
       flag = _flag;
   }
}
