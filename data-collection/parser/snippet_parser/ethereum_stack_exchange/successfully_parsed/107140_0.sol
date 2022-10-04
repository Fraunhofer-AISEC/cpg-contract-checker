enum Grade {
    GARDEN,
    PRIMARY,
    SECONDARY,
    PREPARATORY
}

struct Student {
    uint256 generation;
    Grade grade;
    uint256 timestamp;
}

mapping(uint256 => Student) internal students;

function getStudent(uint256 _studentId) public view returns (Student memory) {
    return students[_studentId];
}
