// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MessageBoard {
    // Variável que armazena a mensagem
    string private message;

    function setMessage(string memory _message) public {
        message = _message;
    }

    function getMessage() public view returns (string memory) {
        return message;
    }
}
