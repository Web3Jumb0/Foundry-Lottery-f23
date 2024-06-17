// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

/**
 * @title A sample Raffle Contract
 * @author Jumb0
 * @notice This contract is for creating a smample raffle
 * @dev Implements Chainlink VRF for random number generation
 */

contract Raffle {
    error Raffle_NotEnoughEthToEnterRaffle();

    uint256 private i_entranceFee;
    // @dev Duration of the lottery in seconds
    uint256 private i_invterval;
    address payable[] private s_players;
    uint256 private s_lastTimeStamep;

    /** Events */
    event EnteredRaffle(address indexed player);

    constructor(uint256 entranceFee, uint256 interval) {
        i_entranceFee = entranceFee;
        i_invterval = interval;
        s_lastTimeStamep = block.timestamp;
    }

    function enterRaffle() external payable {
        // Enter the raffle
        // require(msg.value >= i_entranceFee,"Not enough ETH to enter the raffle");
        if (msg.value < i_entranceFee) {
            revert Raffle_NotEnoughEthToEnterRaffle();
        }
        s_players.push(payable(msg.sender));
        // 1. Makes migration easier
        // 2. Makes front end "indexing" easier
        emit EnteredRaffle(msg.sender);
    }

    // 1.gGet a random number
    // 2. Use the random numbe to pick a winner
    // 3. Be automatically called
    function pickWinner() public {
        // Pick the winner
        if (block.timestamp - s_lastTimeStamep < i_invterval) {
            revert();
        }
    }

    /** Getter Function */
    function getEntranceFee() public view returns (uint256) {
        return i_entranceFee;
    }
}
// Layout of Contract:
// version
// imports
// errors
// interfaces, libraries, contracts
// Type declarations
// State variables
// Events
// Modifiers
// Functions

// Layout of Functions:
// constructor
// receive function (if exists)
// fallback function (if exists)
// external
// public
// internal
// private
// view & pure functions
