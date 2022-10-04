TypeError: Operator & not compatible with types struct Notes.Student storage ref and struct Notes.Subject storage ref
--> notes.sol:71:17:
|
71 | assert (students[studentHash] & subjects[subjectHash] & teachers[msg.sender])

TypeError: Operator && not compatible with types struct Notes.Student storage ref and struct Notes.Teacher storage ref

TypeError: Invalid type for argument in function call. Invalid implicit conversion from struct Notes.Student storage ref to bool requested.
