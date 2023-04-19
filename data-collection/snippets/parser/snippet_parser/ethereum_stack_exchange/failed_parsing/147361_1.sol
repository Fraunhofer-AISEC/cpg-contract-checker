Error:
Compiler run failed
error[9582]: TypeError: Member "proposer" not found or not visible after argument-dependent lookup in tuple(uint256,address,uint256,uint256,uint256,bool,bool).
  --> test/DAO.t.sol:94:28:
   |
94 |         address proposer = dao.proposals(proposalId).proposer;
   |                            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^


