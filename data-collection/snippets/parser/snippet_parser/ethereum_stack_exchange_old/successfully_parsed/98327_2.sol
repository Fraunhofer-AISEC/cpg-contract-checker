pragma solidity >=0.7.0 <0.9.0;

contract Project2{

        Apple[] public applepies;
        
        struct Apple{
             string name;
             mapping (address => bool) applepie;
        }

        function createProject() external{
            
             address newProject1Address =address(new Project1(msg.sender));

             uint idx = applepies.length;
             applepies.push();
             Apple storage newProject = applepies[idx];
        }

        

    }


contract Project1 is Project2{
        address public creator;

        constructor (address creator1){
            
             creator= creator1;
        }

        function getDetails(uint index) public{
             Apple storage newv= applepies[index];
             
        }
}
