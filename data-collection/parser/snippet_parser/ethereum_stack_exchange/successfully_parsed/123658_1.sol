function getOverview(uint index) public view returns(uint,address){
YOUR_STRUCT storage your_str = your_struct[index] ;
return (you_str.id,your_str.owner);
}
