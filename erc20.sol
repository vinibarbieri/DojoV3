// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

/**
 * @title RewardToken
 * @dev Token ERC20 usado para recompensar participantes de um sistema de votação.
 */
contract RewardToken is ERC20 {
    address public votingContract;

    constructor(uint256 initialSupply) ERC20("Reward Token", "RWT") {
        _mint(msg.sender, initialSupply);
    }

    /**
     * @dev Define o endereço do contrato de votação autorizado a distribuir tokens.
     * @param _votingContract Endereço do contrato de votação.
     */
    function setVotingContract(address _votingContract) external {
        require(votingContract == address(0), "O contrato de votação já foi definido.");
        votingContract = _votingContract;
    }

    /**
     * @dev Função para permitir que o contrato de votação emita tokens de recompensa.
     * @param to Endereço do destinatário.
     * @param amount Quantidade de tokens a serem emitidos.
     */
    function mintReward(address to, uint256 amount) external {
        require(msg.sender == votingContract, "Somente o contrato de votação pode emitir recompensas.");
        _mint(to, amount);
    }
}
