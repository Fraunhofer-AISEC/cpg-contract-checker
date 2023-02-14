
pragma solidity >=0.7.0 <0.9.0;
pragma experimental ABIEncoderV2;

contract Project2{

       
        
        struct Apple{
             string name;
             bool applepie;
             
        }
        
        Apple[] public applepies;
        Apple public newProject;
        
        constructor() {
            
             

             
             newProject = Apple("superApple", true);
             applepies.push(newProject);
        }

         function getNewProject() public view returns(string memory){
             return newProject.name;
        }

    }


contract Project1 is Project2{
        address public creator;

        constructor (address creator1){
            
             creator= creator1;
        }

        function getDetails(uint index) public view returns (string memory){
             Apple storage newv= applepies[index];
             
             return newv.name;
        }
}
