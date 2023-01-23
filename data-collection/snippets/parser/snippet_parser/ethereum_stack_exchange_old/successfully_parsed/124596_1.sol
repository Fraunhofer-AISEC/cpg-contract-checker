
pragma solidity ^0.8.4;

contract Test {
    event ProjectCreated(uint id, string name);
    event UserWhitelisted(uint indexed id, address user, uint signupDate);



    struct Whitelist {
        uint signupDate;
        address userAddress;
    }

    
    string[] public projects;

    
    mapping(uint => Whitelist[]) projectsWhitelist;


    
    function createProject(string calldata projectName) external {
        projects.push(projectName);

        emit ProjectCreated(projects.length - 1, projectName);
    }

    function whitelistUsers(uint projectId, address[] calldata users) external {
        for (uint i; i < users.length; i++) {
            projectsWhitelist[projectId].push(
                Whitelist({
                    userAddress: users[i],
                    signupDate: block.timestamp
                })
            );
            emit UserWhitelisted(projectId, users[i], block.timestamp);
        }
    }

    function getProjects() external view returns (string[] memory) {
        return projects;
    }

    function getProjectUsers(uint projectId)
        external
        view
        returns (Whitelist[] memory)
    {
        return projectsWhitelist[projectId];
    }
}
