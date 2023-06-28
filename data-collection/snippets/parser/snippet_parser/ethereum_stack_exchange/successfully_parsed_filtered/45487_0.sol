function addEntry(string _cloudID, address _gatewayID, string _serviceProducerID, string _serviceProducerMetadata, string _serviceConsumerMetaAttr, string _accessControlModel) public returns (uint)
{
require(msg.sender==_gatewayID);
sls.cloudID = _cloudID;
sls.gatewayID = _gatewayID;
sls.serviceProducerID = _serviceProducerID;
sls.serviceConsumerMetaAttr = _serviceConsumerMetaAttr;
sls.accessControlModel = _accessControlModel;

string memory s1;
string memory s2 = _serviceProducerMetadata;
string  memory s3;
bytes memory s2bytes = bytes(_serviceProducerMetadata);
while(s2bytes.length != 0)
{
   (s1,s2) = splitString(s2,";");
   (s1,s3) = splitString(s1,":");
   sls.serviceProducerMetadata[s1] =s3;
   s2bytes = bytes(s2);
}
BCServiceList.push(sls);
return 1;
}
