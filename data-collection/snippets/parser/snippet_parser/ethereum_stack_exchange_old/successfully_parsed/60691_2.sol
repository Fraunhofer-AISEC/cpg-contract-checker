function init(uint256[]   _numbers) public{


   for (uint256 i = 0; i < _numbers.length; i++) {

       uint256[] memory arr=new uint256[](_numbers.length);

       arr[0]= _numbers[i];
      numbers.push(N("anything", arr));
    }
}
