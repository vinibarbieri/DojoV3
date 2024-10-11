// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract MessageBoard {
    string public message;

    event MessageUpdated(address indexed sender, string newMessage);

    constructor(string memory initialMessage) {
        message = initialMessage;
        emit MessageUpdated(msg.sender, initialMessage);
    }

    function updateMessage(string memory newMessage) external {
        message = newMessage;
        emit MessageUpdated(msg.sender, newMessage);
    }

    function getMessage() external view returns (string memory) {
        return message;
    }
}
