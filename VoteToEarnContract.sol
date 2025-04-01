pragma solidity ^0.8.0;

contract VotingWithRewards {
    mapping(address => bool) voters;
    mapping(bytes32 => uint256) votes;
    mapping(address => uint256) rewards;
    bytes32[3] candidates = [bytes32("Alice"), bytes32("Bob"), bytes32("Charlie")];

    function vote(uint256 candidateIndex) public {
        if (candidateIndex >= 3 || voters[msg.sender]) {
            return;
        }
        voters[msg.sender] = true;
        votes[candidates[candidateIndex]] += 1;
        rewards[msg.sender] += 10;
    }

    function getVotes(uint256 candidateIndex) public view returns (uint256) {
        if (candidateIndex >= 3) {
            return 0;
        }
        return votes[candidates[candidateIndex]];
    }

    function getRewardBalance() public view returns (uint256) {
        return rewards[msg.sender];
    }
}
