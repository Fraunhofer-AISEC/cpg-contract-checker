TypeError: Function has override specified but does not override anything.
--> contracts/testERC1155.sol:38:24:
38 | ) internal virtual override {
                      | ^^^^^^^^

TypeError: Member "_afterTokenTransfer" not found or not visible after argument-dependent lookup in type(contract super TestERC1155).
--> contracts/testERC1155.sol:39:9:
39 | super._afterTokenTransfer(operator,from,to,ids,amounts,data);
| ^^^^^^^^^^^^^^^^^^^^^^^^^
