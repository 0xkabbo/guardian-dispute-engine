# Guardian Dispute Engine

The security of an optimistic system relies on the existence of "Watchers." This engine provides the logic for a Guardian to protect the DAO's treasury from "Governance Attacks" (e.g., a proposer asserting a transaction that was never voted for).

## The Dispute Lifecycle
1. **Monitor**: Scans for `ResultAsserted` events from the `OptimisticGovernor`.
2. **Verify**: Cross-references the `assertionId` and `payload` with the official Snapshot API.
3. **Dispute**: If the data doesn't match, the Guardian calls the `dispute()` function.
4. **Resolution**: The UMA Oracle (DVM) votes on the truth. If the Guardian is correct, the malicious proposer loses their bond, and the transaction is cancelled.

## Key Features
* **Automated Payload Comparison**: Deep-compares encoded hex data against Snapshot's `msg.proposal.execution`.
* **Oracle Integration**: Direct interface with UMA's `OptimisticOracleV3`.
