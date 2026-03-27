// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/access/AccessControl.sol";

contract GuardianService is AccessControl {
    bytes32 public constant GUARDIAN_ROLE = keccak256("GUARDIAN_ROLE");

    event DisputeTriggered(bytes32 indexed assertionId, address indexed guardian);

    constructor() {
        _grantRole(DEFAULT_ADMIN_ROLE, msg.sender);
    }

    /**
     * @dev Triggered by the bot when a mismatch is found.
     * This contract acts as the authorized interface to the UMA Oracle.
     */
    function triggerDispute(address _optimisticOracle, bytes32 _assertionId) external onlyRole(GUARDIAN_ROLE) {
        // Interface call to UMA: 
        // IOptimisticOracleV3(_optimisticOracle).disputeAssertion(_assertionId, msg.sender);
        
        emit DisputeTriggered(_assertionId, msg.sender);
    }
}
