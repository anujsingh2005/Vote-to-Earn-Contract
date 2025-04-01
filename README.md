Vote-to-Earn Contract
A Solidity smart contract for a blockchain-based voting system that rewards participants with tokens. Voters can choose from predefined candidates (Alice, Bob, Charlie) and receive 10 tokens per vote. The contract ensures one vote per address and tracks both votes and rewards.

Contract Address
📌 Deployed Address: [0x9E0271EF4a65dD268Af8f7edaF442FE6144fAa85]

Features
✅ Predefined candidate list
✅ One vote per address enforcement
✅ Token rewards (10 tokens per vote)
✅ View votes per candidate
✅ Check voter reward balance

Smart Contract Code

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
How to Use
Deploy the Contract – Use an Ethereum-compatible blockchain.

Cast a Vote – Call vote(candidateIndex).

Check Votes – Use getVotes(candidateIndex).

View Rewards – Call getRewardBalance().

Requirements
Solidity ^0.8.0

Ethereum-compatible environment (Remix, Hardhat, Truffle, etc.)

License
This project is open-source under the MIT License.

🚀 A simple, reward-driven voting system on Ethereum! 🚀
