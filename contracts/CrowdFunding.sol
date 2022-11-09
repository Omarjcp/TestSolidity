// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

//status = 0 is "Open", status = 1 is "Closed"

contract CrowdProject {
    enum Status {
        Open,
        Closed
    }

    struct Contribution {
        address contributor;
        uint256 value;
    }

    struct Project {
        string id;
        uint256 goal;
        string name;
        string description;
        Status status;
        uint256 currentAmount;
        address payable ownerAddress;
    }

    Project[] public projects;
    mapping(string => Contribution[]) public contributions;

    event ProjectCreated(
        string projectId,
        string name,
        string description,
        uint256 goal
    );

    event ProjectFunded(string idProject, uint256 newCollaboration);

    event ProjectStateChange(string idProject, Status status);

    modifier isOwner(uint256 projectIndex) {
        require(
            projects[projectIndex].ownerAddress == msg.sender,
            "Only owner can change the status project."
        );
        _;
    }

    modifier isNotOwner(uint256 projectIndex) {
        require(
            projects[projectIndex].ownerAddress != msg.sender,
            "You are an author. You cann't contribute with the project."
        );
        _;
    }

    function createProject(
        string calldata id,
        string calldata name,
        string calldata description,
        uint256 goal
    ) public {
        require(goal > 0, "Goal of project must to be greater than 0");
        Project memory project = Project(
            id,
            goal,
            name,
            description,
            Status.Open,
            0,
            payable(msg.sender)
        );
        projects.push(project);
        emit ProjectCreated(id, name, description, goal);
    }

    function fundProject(uint256 projectIndex)
        public
        payable
        isNotOwner(projectIndex)
    {
        Project memory project = projects[projectIndex];

        require(
            project.status == Status.Open &&
                project.goal > project.currentAmount,
            "The goal is ready, thank you for try."
        );
        require(msg.value > 0, "You colaboration must be greater than 0.");

        project.ownerAddress.transfer(msg.value);
        project.currentAmount += msg.value;
        projects[projectIndex] = project;

        contributions[project.id].push(Contribution(msg.sender, msg.value));

        emit ProjectFunded(project.id, msg.value);
    }

    function changeProjectStatus(Status newStatus, uint256 projectIndex)
        public
        isOwner(projectIndex)
    {
        Project memory project = projects[projectIndex];

        require(
            project.status != newStatus,
            "The new status has to be different from the current status."
        );

        project.status = newStatus;
        projects[projectIndex] = project;

        emit ProjectStateChange(project.id, newStatus);
    }
}
