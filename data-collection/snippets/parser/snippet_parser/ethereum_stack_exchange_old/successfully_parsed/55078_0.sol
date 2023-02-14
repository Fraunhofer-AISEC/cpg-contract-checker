pragma solidity ^0.4.0;

contract People {
    Person[] public people;
    struct Person {

        bytes32 referral_type;
        bytes32 student_name;
        bytes32 grade;
        bytes32 iep_status;
        bytes32 staff_name;
        bytes32 reff_date;
        bytes32 reff_time;
        bytes32 location;
        bytes32 problem_behavier;
        bytes32 perceived_motivation;
        bytes32 others_involved ;
        bytes32 action_token;
        bytes32 notes;
        uint lastID;

        bytes32 notes1;
        bytes32 notes2;
        bytes32 notes3;
        bytes32 notes4;

   }

    function addPerson(bytes32 _referral_type,bytes32 _student_name,bytes32 _grade,bytes32 _iep_status,bytes32 _staff_name,bytes32 _reff_date,bytes32 _reff_time,bytes32 _location,bytes32 _problem_behavier,bytes32 _perceived_motivation,bytes32 _others_involved,bytes32 _action_token,bytes32 _notes,uint _lastID) public returns (bool success) {

      Person memory newPerson;
      newPerson.referral_type = _referral_type;
      newPerson.student_name = _student_name;
      newPerson.grade = _grade;
      newPerson.iep_status = _iep_status;
      newPerson.staff_name = _staff_name;
      newPerson.reff_date = _reff_date;
      newPerson.reff_time = _reff_time;
      newPerson.location = _location;
      newPerson.problem_behavier = _problem_behavier;
      newPerson.perceived_motivation = _perceived_motivation;
      newPerson.others_involved = _others_involved;
      newPerson.action_token = _action_token;
      newPerson.notes = _notes;
      newPerson.lastID = _lastID;

      people.push(newPerson);
      return true;
    }

    function getPeoples() public view returns (bytes32[],bytes32[],bytes32[],bytes32[],bytes32[],bytes32[],bytes32[])
    {
        uint length = people.length;

        bytes32[] memory referral_types = new bytes32[](length);
        bytes32[] memory student_names  = new bytes32[](length);
        bytes32[] memory grades         = new bytes32[](length);
        bytes32[] memory iep_statuss    = new bytes32[](length);
        bytes32[] memory staff_names    = new bytes32[](length);
        bytes32[] memory reff_dates     = new bytes32[](length);
        bytes32[] memory reff_times     = new bytes32[](length);

        for(uint i=0;i<people.length;i++)
        {
            referral_types[i] = people[i].referral_type;
            student_names[i]  = people[i].student_name;
            grades[i]         = people[i].grade;
            iep_statuss[i]    = people[i].iep_status;
            staff_names[i]    = people[i].staff_name;
            reff_dates[i]     = people[i].reff_date;
            reff_times[i]     = people[i].reff_time;
        }
        return (referral_types,student_names,grades,iep_statuss,staff_names,reff_dates,reff_times);
    }
   }
