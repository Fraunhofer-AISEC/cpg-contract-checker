{
    "ApplicationName": "Voting",
    "DisplayName": "Voting",
    "Description": "Test Voting App",
    "ApplicationRoles": [
      {
        "Name": "Admin",
        "Description": "Person who generates Candidate and Voter Lists"
      },
      {
        "Name": "Voter",
        "Description": "A person who votes"
      }
    ],
    "Workflows": [
      {
        "Name": "Voting",
        "DisplayName": "Vote Here",
        "Description": "A simple way to vote.",
        "Initiators": [ "Admin" ],
        "StartState": "Creation",
        "Properties": [
          {
            "Name": "State",
            "DisplayName": "State",
            "Description": "Holds the state of the contract.",
            "Type": {
              "Name": "state"
            }
          }
        ],
        "Constructor": {
          "Parameters": [
            {
              "Name": "candidateNames",
              "Description": "List of names of candidates",
              "DisplayName": "ListOfCandidates",
              "Type":
              {
                  "Name": "array",
                  "ElementType": {
                      "Name": "string"
                  }
              }
            },
            {
              "Name": "voterNames",
              "Description": "List of names of voters",
              "DisplayName": "ListOfVoters",
              "Type":{
                "Name": "array",
                "ElementType": {
                  "Name": "string"
                }
              }
            }
          ]
        },
        "Functions": [
          {
            "Name": "totalVotesFor",
            "DisplayName": "Get Votes for a Candidate",
            "Description": "...",
            "Parameters": [
              {
                "Name": "candidate",
                "Description": "...",
                "DisplayName": "Name of Candidate",
                "Type": {
                  "Name": "string"
                }
              }
            ]
          },
          {
            "Name": "voteForCandidate",
            "DisplayName": "Vote Function",
            "Description": "...",
            "Parameters": [
              {
                "Name": "voter",
                "Description": "...",
                "DisplayName": "Name of Voter",
                "Type": {
                  "Name": "string"
                }
              },
              {
                "Name": "candidate",
                "Description": "...",
                "DisplayName": "Name of Candidate",
                "Type": {
                  "Name": "string"
                }
              }
            ]
          }
        ],
        "States": [
          {
            "Name": "Creation",
            "DisplayName": "Ballot Creation",
            "Description": "...",
            "PercentComplete": 20,
            "Style": "Success",
            "Transitions": [
              {
                "AllowedRoles": ["Voter"],
                "AllowedInstanceRoles": [],
                "Description": "...",
                "Function": "voteForCandidate",
                "NextStates": [ "Voting" ],
                "DisplayName": "Give Vote"
              },
              {
                "AllowedRoles": ["Voter"],
                "AllowedInstanceRoles": [],
                "Description": "...",
                "Function": "totalVotesFor",
                "NextStates": [ "Voting" ],
                "DisplayName": "Get No of Votes"
              }
            ]
          },
          {
            "Name": "Voting",
            "DisplayName": "Voting Stage",
            "Description": "...",
            "PercentComplete": 20,
            "Style": "Success",
            "Transitions": [
              {
                "AllowedRoles": ["Voter"],
                "AllowedInstanceRoles": [],
                "Description": "...",
                "Function": "totalVotesFor",
                "NextStates": [ "Voting" ],
                "DisplayName": "Vote for a Candidate"
              }
            ]
          },
          {
            "Name": "BallotFinish",
            "DisplayName": "Voting Finished",
            "Description": "...",
            "PercentComplete": 100,
            "Style": "Success",
            "Transitions": []
          }
        ]
      }
    ]
  }
