bytes4 selector = bytes4(keccak256("MaximumContributionExceeded(uint256, uint256)"));
vm.expectRevert(abi.encodeWithSelector(selector, 1, 2));
ico.contribute{value: 1501 ether}();
