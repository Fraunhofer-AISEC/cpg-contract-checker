interface IUnknownContract {
    function unknownName() external view returns (uint); 
}

contract Explorer {
    address constant target = 0x1333333333333333333333333333333333333337;
    
    function getUnknown() external view returns (uint) {
        return IUnknownContract(target).unknownName();
    }
    
    function getUnknownWithCall() external view returns (uint) {
        (bool success, bytes memory data) = target.staticcall(abi.encodeWithSelector(0xbabababa));
        

        return abi.decode(data, (uint));
    }
}
