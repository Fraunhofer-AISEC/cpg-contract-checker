pragma solidity >=0.7.1 <0.9.0;
contract myArray{
    uint[] public ipadProPrice =[1000,1100,1200,1300,1400,1500];

    function addToPrice(uint _addToPrice) public{
       ipadProPrice.push(_addToPrice);
    }
}
