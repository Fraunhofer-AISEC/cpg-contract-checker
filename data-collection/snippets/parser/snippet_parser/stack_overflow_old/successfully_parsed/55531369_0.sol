pragma solidity ^0.5.7;

contract Consensus {

    struct PMU{
        string name;
        address pmu;
        uint256[] data;
        bool errorFlag;
        uint256 errorCount;
    }

    mapping (address => PMU) PMUS;

   address[]  accounts;
    uint256[] empty;
    function deployPmu(string memory _name) public{

        PMUS[msg.sender] = PMU(_name,msg.sender,empty,false,0);
        accounts.push(msg.sender);
    }

    function print() public view returns(string memory name, uint256[] memory data,bool errorFlag,uint256 errorCount){
        PMU memory instancePMU = PMUS[msg.sender];
        return (instancePMU.name,instancePMU.data,instancePMU.errorFlag,instancePMU.errorCount);
    }

    function log(uint256[] memory roc) public{
        for (uint i=0; i<roc.length;i++){
            PMUS[msg.sender].data.push(roc[i]);

            if(roc[i]<12){
                PMUS[msg.sender].errorFlag = false;
                errorFlags[msg.sender] = false;
                PMUS[msg.sender].errorCount=0;
            }

            if(roc[i]>12){
                PMUS[msg.sender].errorCount= PMUS[msg.sender].errorCount+1;
            }

            if( PMUS[msg.sender].errorCount >= 5){

                PMUS[msg.sender].errorFlag = true;
                errorFlags[msg.sender] = true;
                PMUS[msg.sender].errorCount = 0;
            }
        }

    }


    mapping (address => bool) errorFlags;
    bool GridFault=false;
    bool PMUfault=false;

    address[] tru;
    address[] falz;

    function faultStatus () public returns (address[] memory)
    {   
        address[] memory empty;
        tru = empty;
        falz =empty;
        GridFault = false;
        PMUfault = false;

            uint256 count =0;
            for(uint256 i =0; i<accounts.length; i++){
                if(errorFlags[accounts[i]] == true){
                    count = count + 1;
                    tru.push(accounts[i]);
                }
                else{
                    falz.push(accounts[i]);
                }

            }

            if(count > (accounts.length-1)/2){
                GridFault = true;
                if(falz.length != 0){
                    PMUfault = true;

                }    
            }
            else if(count == 0){
                GridFault = false;
                PMUfault = false;
            }
            else{
                PMUfault = true;
                return tru;
            }

    }

    function gridstatus() public view returns(address[] memory, bool, bool){

        if(GridFault == true){ 
            return (falz,GridFault, PMUfault);
        }
        else{
            return(tru,GridFault, PMUfault);
        }
    }
}
