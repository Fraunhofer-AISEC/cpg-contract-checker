     function isContract(address _base) external pure returns(bool) {
    assembly {
        _r := gt(extcodesize(_base), 0)
     }
   }
 }
