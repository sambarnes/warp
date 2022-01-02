object "C_41" {
    code {
        {
            mstore(64, 128)
            if callvalue() { revert(0, 0) }
        }
    }
    object "C_41_deployed" {
        code {
            {
                mstore(64, 128)
                if iszero(lt(calldatasize(), 4))
                {
                    let _1 := 0
                    if eq(0x26121ff0, shr(224, calldataload(_1)))
                    {
                        if slt(add(calldatasize(), not(3)), _1) { revert(_1, _1) }
                        let oldLen := sload(_1)
                        if iszero(lt(oldLen, 18446744073709551616))
                        {
                            mstore(_1, shl(224, 0x4e487b71))
                            mstore(4, 0x41)
                            revert(_1, 0x24)
                        }
                        sstore(_1, add(oldLen, 1))
                        let slot, offset := storage_array_index_access_uint8_dyn_ptr(oldLen)
                        mstore( _1, _1)
                        sstore(18569430475105882587588266137607568536673111973893317399460219858819262702947, 257)
                        let _2, _3 := storage_array_index_access_uint8_dyn__ptr()
                        let _4 := sload( _2)
                        let _5, _6 := storage_array_index_access_uint8_dyn__ptr()
                        let expr :=  eq( and(shr(shl(3, _6), sload( _5)),  0xff), 1)
                        if expr
                        {
                            expr :=  eq( and(shr(shl(3, _3), _4), 0xff), 1)
                        }
                        let memPos := mload(64)
                        return(memPos, sub(abi_encode_bool(memPos, expr), memPos))
                    }
                }
                revert(0, 0)
            }
            function abi_encode_bool(headStart, value0) -> tail
            {
                tail := add(headStart, 32)
                mstore(headStart, iszero(iszero(value0)))
            }
            function panic_error_0x32()
            {
                mstore(0, shl(224, 0x4e487b71))
                mstore(4, 0x32)
                revert(0, 0x24)
            }
            function storage_array_index_access_uint8_dyn_ptr(index) -> slot, offset
            {
                if iszero(lt(index, sload(0))) { panic_error_0x32() }
                mstore(0, 0)
                let data := pedersen(0, 0x20)
                slot := add(data, shr(5, index))
                offset := and(index, 31)
            }
            function storage_array_index_access_uint8_dyn__ptr() -> slot, offset
            {
                if iszero(sload(0)) { panic_error_0x32() }
                mstore(0, 0)
                slot := pedersen(0, 0x20)
                offset := 0
            }
        }
        data ".metadata" hex"a364697066735822122056d8caf73359c402ebbfcadb6e5df0a3c92767495efc608a91a5809f1512cd966c6578706572696d656e74616cf564736f6c637828302e382e392d646576656c6f702e323032312e31322e31342b636f6d6d69742e36653262646535370067"
    }
}

