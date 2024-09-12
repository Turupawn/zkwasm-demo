// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;

interface ICircomVerifier {
    function verifyProof(uint[2] calldata _pA, uint[2][2] calldata _pB, uint[2] calldata _pC, uint[1] calldata _pubSignals) external view returns (bool);
}

contract CircomCustomLogic {
    ICircomVerifier circomVerifier;
    uint public publicInput;

    constructor(address circomVeriferAddress) {
        circomVerifier = ICircomVerifier(circomVeriferAddress);
    }

    function sendProof(uint[2] calldata _pA, uint[2][2] calldata _pB, uint[2] calldata _pC, uint[1] calldata _pubSignals) public {
        // ZK verification
        circomVerifier.verifyProof(_pA, _pB, _pC, _pubSignals);

        // Your custom logic
        publicInput = _pubSignals[0];
    }
}