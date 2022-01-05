Optimized IR:
/*=====================================================*
 *                       WARNING                       *
 *  Solidity to Yul compilation is still EXPERIMENTAL  *
 *       It can result in LOSS OF FUNDS or worse       *
 *                !USE AT YOUR OWN RISK!               *
 *=====================================================*/

/// @use-src 0:"calldata_bytes_to_memory.sol"
object "C_17" {
    code {
        {
            /// @src 0:24:140  "contract C {..."
            mstore(64, 128)
            if callvalue() { revert(0, 0) }
        }
    }
    /// @use-src 0:"calldata_bytes_to_memory.sol"
    object "C_17_deployed" {
        code {
            {
                /// @src 0:24:140  "contract C {..."
                mstore(64, 128)
                if iszero(lt(calldatasize(), 4))
                {
                    let _1 := 0
                    if eq(0xd45754f8, shr(224, calldataload(_1)))
                    {
                        if slt(add(calldatasize(), not(3)), 32) { revert(_1, _1) }
                        let offset := calldataload(4)
                        let _2 := 0xffffffffffffffff
                        if gt(offset, _2) { revert(_1, _1) }
                        if iszero(slt(add(offset, 35), calldatasize())) { revert(_1, _1) }
                        let length := calldataload(add(4, offset))
                        if gt(length, _2) { revert(_1, _1) }
                        if gt(add(add(offset, length), 36), calldatasize()) { revert(_1, _1) }
                        let ret := fun_f(add(offset, 36), length)
                        let memPos := mload(64)
                        return(memPos, sub(abi_encode_bytes32(memPos, ret), memPos))
                    }
                }
                revert(0, 0)
            }
            function abi_encode_bytes32(headStart, value0) -> tail
            {
                tail := add(headStart, 32)
                mstore(headStart, value0)
            }
            function panic_error_0x41()
            {
                mstore(0, shl(224, 0x4e487b71))
                mstore(4, 0x41)
                revert(0, 0x24)
            }
            /// @ast-id 16 @src 0:39:138  "function f(bytes calldata data) external returns (bytes32) {..."
            function fun_f(var_data_offset, var_data_length) -> var
            {
                /// @src 0:24:140  "contract C {..."
                let _1 := 0xffffffffffffffff
                if gt(var_data_length, _1) { panic_error_0x41() }
                let _2 := not(31)
                let memPtr := mload(64)
                let newFreePtr := add(memPtr, and(add(and(add(var_data_length, 31), _2), 63), _2))
                if or(gt(newFreePtr, _1), lt(newFreePtr, memPtr)) { panic_error_0x41() }
                mstore(64, newFreePtr)
                mstore(memPtr, var_data_length)
                let dst := add(memPtr, 0x20)
                if gt(add(var_data_offset, var_data_length), calldatasize())
                {
                    revert(/** @src -1:-1:-1 */ 0, 0)
                }
                /// @src 0:24:140  "contract C {..."
                calldatacopy(dst, var_data_offset, var_data_length)
                mstore(add(add(memPtr, var_data_length), 0x20), /** @src -1:-1:-1 */ 0)
                /// @src 0:104:133  "return keccak256(bytes(data))"
                var := /** @src 0:111:133  "keccak256(bytes(data))" */ keccak256(/** @src 0:24:140  "contract C {..." */ dst, mload(/** @src 0:111:133  "keccak256(bytes(data))" */ memPtr))
            }
        }
        data ".metadata" hex"a3646970667358221220cc968844d7f418330f788cb6ccf1c6d5ad9f68daf67226cc16694a44174cab676c6578706572696d656e74616cf564736f6c637828302e382e392d646576656c6f702e323032312e31322e31342b636f6d6d69742e36653262646535370067"
    }
}

