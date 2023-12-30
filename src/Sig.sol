pragma solidity ^0.7.6;

import "@openzeppelin/contracts/cryptography/ECDSA.sol";

contract Sig {
    function  validateAttestation(
        bytes calldata message,
        bytes calldata signature
    ) public view returns (address) {

        require(
            signature.length == 65,
            "Signature length is not 65 bytes"
        );

        bytes32 digest = keccak256(message);

         address recoveredAttester =_recoverAttesterSignature(
                digest,
                signature
            );

        return recoveredAttester;

    }

    function computeHash(
        bytes calldata message
    ) public pure returns (bytes32) {

        bytes32 digest = keccak256(message);

        return digest;

    }   

    function _recoverAttesterSignature(bytes32 _digest, bytes memory _signature)
        internal
        pure
        returns (address)
    {
        return (ECDSA.recover(_digest, _signature));
    }


}