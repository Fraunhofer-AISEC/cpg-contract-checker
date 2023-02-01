pragma solidity >=0.7.0 <0.9.0;
import "./Agent.sol";

    contract DAG {
    
        address[] agents;
    
        function createDAG() public returns (address) {
            
            address[] memory parentsOfRoot;
            address rootAddress = createAgent(parentsOfRoot);
    
    
            
            address[] memory parentsOfChild;
            parentsOfChild[0] = rootAddress;
            createAgent(parentsOfChild);
    
            return rootAddress;
            
        }
        function createAgent(address[] memory _parents) public returns(address) {
            Agent agent = new Agent(_parents);
            agents[agents.length - 1] = address(agent);
            return address(agent);        
        }
    }
