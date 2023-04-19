function make_secure(string _pass) internal notRegistered
{
    bytes memory _arg1 =  bytes(_pass);
    bytes memory _arg2 =  new bytes(20);
    address x=msg.sender;
    for (uint i = 0; i < 20; i++)
       _arg2[i] = byte(uint8(uint(x) / (2**(8*(19 - i)))));
    string memory _temps = new string( _arg1.length + _arg2.length );
    bytes memory _target_s = bytes(_temps);
    uint k=0;
    for(i=0;i<_arg1.length;i++) _target_s[k++]=_arg1[i++];
    for(i=0;i<_arg2.length;i++) _target_s[k++]=_arg2[i++];
    bytes32 _sha256;
    _sha256=keccak256(_target_s);

    _key_value[msg.sender]=_sha256;
}
