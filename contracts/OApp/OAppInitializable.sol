// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

// @dev Import the 'MessagingFee' and 'MessagingReceipt' so it's exposed to OApp implementers
// solhint-disable-next-line no-unused-import
import { OAppSenderInitializable, MessagingFee, MessagingReceipt } from "./OAppSenderInitializable.sol";
// @dev Import the 'Origin' so it's exposed to OApp implementers
// solhint-disable-next-line no-unused-import
import { OAppReceiverInitializable, Origin } from "./OAppReceiverInitializable.sol";
import { OAppCoreInitializable } from "./OAppCoreInitializable.sol";

/**
 * @title OApp
 * @dev Abstract contract serving as the base for OApp implementation, combining OAppSender and OAppReceiver functionality.
 */
abstract contract OAppInitializable is OAppSenderInitializable, OAppReceiverInitializable {
    /**
     * @dev Constructor to initialize the OApp with the provided endpoint and owner.
     */
    constructor() OAppCoreInitializable() {}

    /**
     * @dev Initializes the OApp with the provided delegate.
     * @param _endpoint The address of the LOCAL LayerZero endpoint.
     * @param _delegate The delegate capable of making OApp configurations inside of the endpoint.
     *
     * @dev The delegate typically should be set as the owner of the contract.
     * @dev Ownable is not initialized here on purpose. It should be initialized in the child contract to
     * accommodate the different version of Ownable.
     */
    function __OApp_init(address _endpoint, address _delegate) internal onlyInitializing {
        __OAppCore_init(_endpoint, _delegate);
        __OAppReceiver_init_unchained();
        __OAppSender_init_unchained();
    }

    function __OApp_init_unchained() internal onlyInitializing {}

    /**
     * @notice Retrieves the OApp version information.
     * @return senderVersion The version of the OAppSender.sol implementation.
     * @return receiverVersion The version of the OAppReceiver.sol implementation.
     */
    function oAppVersion()
        public
        pure
        virtual
        override(OAppSenderInitializable, OAppReceiverInitializable)
        returns (uint64 senderVersion, uint64 receiverVersion)
    {
        return (SENDER_VERSION, RECEIVER_VERSION);
    }
}
