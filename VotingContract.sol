// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/access/Ownable.sol";
import "./RewardToken.sol";
import "./RewardNFT.sol";

/**
 * @title VotingContract
 * @dev Sistema de votação para propostas de mensagens, com recompensas em tokens ERC20 e NFTs.
 */
contract VotingContract is Ownable {
    RewardToken public rewardToken;
    RewardNFT public rewardNFT;

    uint256 public voteReward = 10 * 10 ** 18; // Recompensa por voto
    uint256 public proposalReward = 100 * 10 ** 18; // Recompensa para a proposta vencedora

    struct Proposal {
        address proposer;
        string message;
        uint256 voteCount;
        bool rewarded;
    }

    Proposal[] public proposals;
    mapping(address => bool) public hasVoted;

    event ProposalCreated(uint256 proposalId, address indexed proposer, string message);
    event Voted(uint256 proposalId, address indexed voter);
    event ProposalWon(uint256 proposalId, string message, address indexed proposer);

    constructor(address _rewardToken, address _rewardNFT) {
        rewardToken = RewardToken(_rewardToken);
        rewardNFT = RewardNFT(_rewardNFT);
    }

    /**
     * @dev Permite que um usuário proponha uma nova mensagem.
     * @param newMessage Conteúdo da mensagem proposta.
     */
    function proposeMessage(string memory newMessage) external {
        proposals.push(Proposal(msg.sender, newMessage, 0, false));
        emit ProposalCreated(proposals.length - 1, msg.sender, newMessage);
    }

    /**
     * @dev Permite que um usuário vote em uma proposta.
     * @param proposalId ID da proposta a ser votada.
     */
    function vote(uint256 proposalId) external {
        require(!hasVoted[msg.sender], "Você já votou.");
        require(proposalId < proposals.length, "Proposta inválida.");

        proposals[proposalId].voteCount++;
        hasVoted[msg.sender] = true;

        rewardToken.mintReward(msg.sender, voteReward);
        emit Voted(proposalId, msg.sender);
    }

    /**
     * @dev Define a proposta vencedora e distribui recompensas ao proponente.
     */
    function finalizeVoting() external onlyOwner {
        uint256 winningVoteCount = 0;
        uint256 winningIndex = 0;

        for (uint256 i = 0; i < proposals.length; i++) {
            if (proposals[i].voteCount > winningVoteCount) {
                winningVoteCount = proposals[i].voteCount;
                winningIndex = i;
            }
        }

        Proposal storage winningProposal = proposals[winningIndex];
        require(!winningProposal.rewarded, "Proposta já recompensada.");

        rewardToken.mintReward(winningProposal.proposer, proposalReward);
        rewardNFT.mintNFT(winningProposal.proposer);

        winningProposal.rewarded = true;
        emit ProposalWon(winningIndex, winningProposal.message, winningProposal.proposer);

        delete proposals;
        for (uint256 i = 0; i < proposals.length; i++) {
            hasVoted[msg.sender] = false;
        }
    }
}
