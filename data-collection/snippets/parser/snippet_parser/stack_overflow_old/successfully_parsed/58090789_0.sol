pragma solidity ^0.4.3;

contract owned {
    address public owner;

    
    function owned() public {
        owner = msg.sender;
    }

    
      modifier onlyOwner {
        require(owner == msg.sender);
        _;
    }

    
    function transferOwnership(address newOwner) public onlyOwner() {
        owner = newOwner;
    }
}


contract AsnScRegistry is owned{
  struct IPAddress {
    uint128 ip;
    uint8 mask;
    }

  struct MemberAddresses {
    address contractAddress;
    address walletAddress;
    uint index;
  }

  mapping (uint => IPAddress[]) managedIps;
  mapping (uint => MemberAddresses) ethAddresses;

  uint[] private registeredAsn;

  function getManagedIpByAsn(uint _asn) view public returns (uint128[] _ip, uint8[] _mask){
    IPAddress[] memory addresses = managedIps[_asn];
    uint128[] memory ips = new uint128[](addresses.length);
    uint8[] memory mask = new uint8[](addresses.length);

    for (uint i = 0; i < addresses.length; i++) {
            ips[i] = addresses[i].ip;
            mask[i] = addresses[i].mask;
        }
    return (ips, mask);
  }

  function getMemberAddressesByAsn(uint _asn) view public returns (address _contractAddress, address _walletAddress){
    MemberAddresses memory memberAddresses = ethAddresses[_asn];
    return (memberAddresses.contractAddress, memberAddresses.walletAddress);
  }

  function addMember(uint _asn, uint128[] _ip, uint8[] _mask, address _contractAddress, address _walletAddress) public {
    MemberAddresses memory member = ethAddresses[_asn];
    
    assert(member.contractAddress != 0);
    for(uint i=0; i<_ip.length; i++){
      managedIps[_asn].push(IPAddress({ip:_ip[i], mask:_mask[i]}));
    }
    uint idx = registeredAsn.push(_asn)-1;
    ethAddresses[_asn] = MemberAddresses({contractAddress:_contractAddress, walletAddress:_walletAddress, index:idx});
  }

  function removeMember(uint _asn) public returns (uint[] _registeredAsn){
    

    if (ethAddresses[_asn].index >= registeredAsn.length) return;

    for (uint i = ethAddresses[_asn].index; i<registeredAsn.length - 1; i++){
      registeredAsn[i] = registeredAsn[i+1];
    }
        registeredAsn.length--;
        delete managedIps[_asn];
        delete ethAddresses[_asn];

        return registeredAsn;
  }

  function getTotalMembers() view public returns (uint _totalMembers) {
    return (registeredAsn.length);
  }

  function getRegisteredAsn() view public returns (uint[] _asn){
    return (registeredAsn);
  }

}
