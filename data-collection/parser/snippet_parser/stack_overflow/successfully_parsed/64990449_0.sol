    pragma solidity >=0.5.8 <0.6.0;
    
    contract Proxy
    {
    
        address  Owner ;
    
        address  VolAddr ;
         string  VolABI ;
    
    
       constructor() public
       {
            Owner=tx.origin ;
       }
    
       function SetVol(address VolAddr_, string memory VolABI_) public
       {
           if(tx.origin!=Owner)  require(false) ;
    
              VolAddr=VolAddr_ ;
              VolABI =VolABI_ ;
       }
    
       function GetVol() public view returns (address, string memory retVal)
       {
           return(VolAddr, VolABI) ;
       }
    
    }
    
    
    contract VolUser
    {
    
        Proxy  ProxyAddr ;
    
    
       constructor() public
       {
       }
    
       function CallVol() public
       {
              address           VolAddr ;
               string    memory VolABI ;
              bytes32[2] memory VolPars ;
                 bool           result ;
    
            (VolAddr, VolABI)=ProxyAddr.GetVol() ;
    
                     VolPars[0]=               "ABC" ;
                     VolPars[1]=bytes32(uint256(321)) ;
                 
            (result,)=address(VolAddr).call.gas(0x300000).value(0)(abi.encodeWithSignature(VolABI, VolPars)) ;
    
       }
    
    }
    
    contract Vol
    {
    
       constructor() public
       {
       }
    
       function AnyFunction(bytes32[] memory VolPars_) public
       {
    
       }
    
    }
