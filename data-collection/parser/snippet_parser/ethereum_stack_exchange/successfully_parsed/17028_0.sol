import "./Lib.sol"
contract Example{
   using Lib for Lib.data;
   function insert( string key, byte folderType ){
     uint currentIndex = cluster.jobStatus[jobKey].length;
     cluster.submittedJobs.push( Lib.job({hash: key, index: 
   currentIndex, folderType: folderType }) );
  }
}
