// Simple Voting Contract
pragma solidity ^0.8.0;

// Contract declaration
contract SimpleVoting {
    // Mapping to store votes received for each candidate
    mapping (bytes32 => uint256) public votesReceived;
    // Array to store list of candidates
    bytes32[] public candidateList;

    // Constructor to initialize the list of candidates
    constructor(bytes32[] memory candidateNames) {
        candidateList = candidateNames;
    }

    // Function to vote for a candidate
    function voteForCandidate(bytes32 candidate) public {
        // Ensure candidate is valid
        require(validCandidate(candidate));
        // Increment vote count for the candidate
        votesReceived[candidate] += 1;
    }

    // Function to get total votes for a candidate
    function totalVotesFor(bytes32 candidate) public view returns (uint256) {
        // Ensure candidate is valid
        require(validCandidate(candidate));
        return votesReceived[candidate];
    }

    // Function to check if candidate is valid
    function validCandidate(bytes32 candidate) public view returns (bool) {
        for(uint i = 0; i < candidateList.length; i++) {
            if (candidateList[i] == candidate) {
                return true;
            }
        }
        return false;
    }
}
