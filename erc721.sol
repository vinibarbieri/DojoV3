// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

/**
 * @title RewardNFT
 * @dev Contrato ERC721 para recompensar usuários com NFTs únicos.
 */
contract RewardNFT is ERC721, Ownable {
    uint256 public nextTokenId;
    mapping(uint256 => string) public tokenMetadata;

    constructor() ERC721("Reward NFT", "RNFT") {}

    /**
     * @dev Função para mintar um novo NFT.
     * @param recipient Endereço do usuário que receberá o NFT.
     */
    function mintNFT(address recipient) external onlyOwner {
        _safeMint(recipient, nextTokenId);
        nextTokenId++;
    }

    /**
     * @dev Define metadados personalizados para cada NFT, opcional.
     * @param tokenId ID do token.
     * @param metadata URL dos metadados.
     */
    function setTokenMetadata(uint256 tokenId, string memory metadata) external onlyOwner {
        tokenMetadata[tokenId] = metadata;
    }
}
