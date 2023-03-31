Error:
Compiler run failed
error[9515]: TypeError: Struct containing a (nested) mapping cannot be constructed.
  --> test/DAO.t.sol:98:37:
   |
98 |         Proposal storage proposal = Proposal(dao.proposals(proposalId));
   |                                     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

