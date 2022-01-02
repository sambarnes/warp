%lang starknet
%builtins pedersen range_check bitwise

from evm.array import validate_array
from evm.calls import calldataload, calldatasize
from evm.exec_env import ExecutionEnvironment
from evm.hashing import uint256_pedersen, uint256_sha
from evm.memory import uint256_mload, uint256_mstore
from evm.uint256 import is_eq, is_lt, is_zero, slt, u256_add, u256_shl, u256_shr
from evm.yul_api import warp_return
from starkware.cairo.common.cairo_builtins import BitwiseBuiltin, HashBuiltin
from starkware.cairo.common.default_dict import default_dict_finalize, default_dict_new
from starkware.cairo.common.dict_access import DictAccess
from starkware.cairo.common.registers import get_fp_and_pc
from starkware.cairo.common.uint256 import Uint256, uint256_and, uint256_sub

func __warp_constant_0() -> (res : Uint256):
    return (Uint256(low=0, high=0))
end

func sload{pedersen_ptr : HashBuiltin*, range_check_ptr, syscall_ptr : felt*}(key : Uint256) -> (
        value : Uint256):
    let (value) = evm_storage.read(key)
    return (value)
end

func sstore{pedersen_ptr : HashBuiltin*, range_check_ptr, syscall_ptr : felt*}(
        key : Uint256, value : Uint256):
    evm_storage.write(key, value)
    return ()
end

@storage_var
func evm_storage(arg0 : Uint256) -> (res : Uint256):
end

@constructor
func constructor{range_check_ptr}(calldata_size, calldata_len, calldata : felt*):
    alloc_locals
    validate_array(calldata_size, calldata_len, calldata)
    let (memory_dict) = default_dict_new(0)
    let memory_dict_start = memory_dict
    let msize = 0
    with memory_dict, msize:
        __constructor_meat()
    end
    default_dict_finalize(memory_dict_start, memory_dict, 0)
    return ()
end

@external
func __main{
        bitwise_ptr : BitwiseBuiltin*, pedersen_ptr : HashBuiltin*, range_check_ptr,
        syscall_ptr : felt*}(calldata_size, calldata_len, calldata : felt*) -> (
        returndata_size, returndata_len, returndata : felt*):
    alloc_locals
    validate_array(calldata_size, calldata_len, calldata)
    let (__fp__, _) = get_fp_and_pc()
    local exec_env_ : ExecutionEnvironment = ExecutionEnvironment(calldata_size=calldata_size, calldata_len=calldata_len, calldata=calldata, returndata_size=0, returndata_len=0, returndata=cast(0, felt*), to_returndata_size=0, to_returndata_len=0, to_returndata=cast(0, felt*))
    let exec_env : ExecutionEnvironment* = &exec_env_
    let (memory_dict) = default_dict_new(0)
    let memory_dict_start = memory_dict
    let msize = 0
    let termination_token = 0
    with exec_env, memory_dict, msize, termination_token:
        __main_meat()
    end
    default_dict_finalize(memory_dict_start, memory_dict, 0)
    return (exec_env.to_returndata_size, exec_env.to_returndata_len, exec_env.to_returndata)
end

func __constructor_meat{memory_dict : DictAccess*, msize, range_check_ptr}() -> ():
    alloc_locals
    uint256_mstore(offset=Uint256(low=64, high=0), value=Uint256(low=128, high=0))
    let (__warp_subexpr_0 : Uint256) = __warp_constant_0()
    if __warp_subexpr_0.low + __warp_subexpr_0.high != 0:
        assert 0 = 1
        jmp rel 0
    else:
        return ()
    end
end

func storage_array_index_access_uint8_dyn_ptr{
        bitwise_ptr : BitwiseBuiltin*, memory_dict : DictAccess*, msize,
        pedersen_ptr : HashBuiltin*, range_check_ptr, syscall_ptr : felt*}(index : Uint256) -> (
        slot : Uint256, offset : Uint256):
    alloc_locals
    let (__warp_subexpr_2 : Uint256) = sload(Uint256(low=0, high=0))
    let (__warp_subexpr_1 : Uint256) = is_lt(index, __warp_subexpr_2)
    let (__warp_subexpr_0 : Uint256) = is_zero(__warp_subexpr_1)
    if __warp_subexpr_0.low + __warp_subexpr_0.high != 0:
        assert 0 = 1
        jmp rel 0
    end
    uint256_mstore(offset=Uint256(low=0, high=0), value=Uint256(low=0, high=0))
    let (data : Uint256) = uint256_pedersen(Uint256(low=0, high=0), Uint256(low=32, high=0))
    let (__warp_subexpr_3 : Uint256) = u256_shr(Uint256(low=5, high=0), index)
    let (slot : Uint256) = u256_add(data, __warp_subexpr_3)
    let (offset : Uint256) = uint256_and(index, Uint256(low=31, high=0))
    return (slot, offset)
end

func storage_array_index_access_uint8_dyn__ptr{
        bitwise_ptr : BitwiseBuiltin*, memory_dict : DictAccess*, msize,
        pedersen_ptr : HashBuiltin*, range_check_ptr, syscall_ptr : felt*}() -> (
        slot : Uint256, offset : Uint256):
    alloc_locals
    let (__warp_subexpr_1 : Uint256) = sload(Uint256(low=0, high=0))
    let (__warp_subexpr_0 : Uint256) = is_zero(__warp_subexpr_1)
    if __warp_subexpr_0.low + __warp_subexpr_0.high != 0:
        assert 0 = 1
        jmp rel 0
    end
    uint256_mstore(offset=Uint256(low=0, high=0), value=Uint256(low=0, high=0))
    let (slot : Uint256) = uint256_pedersen(Uint256(low=0, high=0), Uint256(low=32, high=0))
    let offset : Uint256 = Uint256(low=0, high=0)
    return (slot, offset)
end

func abi_encode_bool{memory_dict : DictAccess*, msize, range_check_ptr}(
        headStart : Uint256, value0 : Uint256) -> (tail : Uint256):
    alloc_locals
    let (tail : Uint256) = u256_add(headStart, Uint256(low=32, high=0))
    let (__warp_subexpr_1 : Uint256) = is_zero(value0)
    let (__warp_subexpr_0 : Uint256) = is_zero(__warp_subexpr_1)
    uint256_mstore(offset=headStart, value=__warp_subexpr_0)
    return (tail)
end

func __warp_block_2{bitwise_ptr : BitwiseBuiltin*, range_check_ptr}(_3 : Uint256, _4 : Uint256) -> (
        expr : Uint256):
    alloc_locals
    let (__warp_subexpr_2 : Uint256) = u256_shl(Uint256(low=3, high=0), _3)
    let (__warp_subexpr_1 : Uint256) = u256_shr(__warp_subexpr_2, _4)
    let (__warp_subexpr_0 : Uint256) = uint256_and(__warp_subexpr_1, Uint256(low=255, high=0))
    let (expr : Uint256) = is_eq(__warp_subexpr_0, Uint256(low=1, high=0))
    return (expr)
end

func __warp_if_2{bitwise_ptr : BitwiseBuiltin*, range_check_ptr}(
        _3 : Uint256, _4 : Uint256, expr : Uint256) -> (expr : Uint256):
    alloc_locals
    if expr.low + expr.high != 0:
        let (expr : Uint256) = __warp_block_2(_3, _4)
        return (expr)
    else:
        return (expr)
    end
end

func __warp_block_1{
        bitwise_ptr : BitwiseBuiltin*, exec_env : ExecutionEnvironment*, memory_dict : DictAccess*,
        msize, pedersen_ptr : HashBuiltin*, range_check_ptr, syscall_ptr : felt*,
        termination_token}() -> ():
    alloc_locals
    let (__warp_subexpr_2 : Uint256) = calldatasize()
    let (__warp_subexpr_1 : Uint256) = u256_add(
        __warp_subexpr_2,
        Uint256(low=340282366920938463463374607431768211452, high=340282366920938463463374607431768211455))
    let (__warp_subexpr_0 : Uint256) = slt(__warp_subexpr_1, Uint256(low=0, high=0))
    if __warp_subexpr_0.low + __warp_subexpr_0.high != 0:
        assert 0 = 1
        jmp rel 0
    end
    let (oldLen : Uint256) = sload(Uint256(low=0, high=0))
    let (__warp_subexpr_4 : Uint256) = is_lt(oldLen, Uint256(low=18446744073709551616, high=0))
    let (__warp_subexpr_3 : Uint256) = is_zero(__warp_subexpr_4)
    if __warp_subexpr_3.low + __warp_subexpr_3.high != 0:
        assert 0 = 1
        jmp rel 0
    end
    let (__warp_subexpr_5 : Uint256) = u256_add(oldLen, Uint256(low=1, high=0))
    sstore(key=Uint256(low=0, high=0), value=__warp_subexpr_5)
    let (slot : Uint256, offset : Uint256) = storage_array_index_access_uint8_dyn_ptr(oldLen)
    uint256_mstore(offset=Uint256(low=0, high=0), value=Uint256(low=0, high=0))
    let (__warp_subexpr_6 : Uint256) = uint256_sha(Uint256(low=0, high=0), Uint256(low=32, high=0))
    sstore(key=__warp_subexpr_6, value=Uint256(low=257, high=0))
    let (_2 : Uint256, _3 : Uint256) = storage_array_index_access_uint8_dyn__ptr()
    let (_4 : Uint256) = sload(_2)
    let (_5 : Uint256, _6 : Uint256) = storage_array_index_access_uint8_dyn__ptr()
    let (__warp_subexpr_10 : Uint256) = sload(_5)
    let (__warp_subexpr_9 : Uint256) = u256_shl(Uint256(low=3, high=0), _6)
    let (__warp_subexpr_8 : Uint256) = u256_shr(__warp_subexpr_9, __warp_subexpr_10)
    let (__warp_subexpr_7 : Uint256) = uint256_and(__warp_subexpr_8, Uint256(low=255, high=0))
    let (expr : Uint256) = is_eq(__warp_subexpr_7, Uint256(low=1, high=0))
    let (expr : Uint256) = __warp_if_2(_3, _4, expr)
    let (memPos : Uint256) = uint256_mload(Uint256(low=64, high=0))
    let (__warp_subexpr_12 : Uint256) = abi_encode_bool(memPos, expr)
    let (__warp_subexpr_11 : Uint256) = uint256_sub(__warp_subexpr_12, memPos)
    warp_return(memPos, __warp_subexpr_11)
    return ()
end

func __warp_if_1{
        bitwise_ptr : BitwiseBuiltin*, exec_env : ExecutionEnvironment*, memory_dict : DictAccess*,
        msize, pedersen_ptr : HashBuiltin*, range_check_ptr, syscall_ptr : felt*,
        termination_token}(__warp_subexpr_0 : Uint256) -> ():
    alloc_locals
    if __warp_subexpr_0.low + __warp_subexpr_0.high != 0:
        __warp_block_1()
        return ()
    else:
        return ()
    end
end

func __warp_block_0{
        bitwise_ptr : BitwiseBuiltin*, exec_env : ExecutionEnvironment*, memory_dict : DictAccess*,
        msize, pedersen_ptr : HashBuiltin*, range_check_ptr, syscall_ptr : felt*,
        termination_token}() -> ():
    alloc_locals
    let (__warp_subexpr_2 : Uint256) = calldataload(Uint256(low=0, high=0))
    let (__warp_subexpr_1 : Uint256) = u256_shr(Uint256(low=224, high=0), __warp_subexpr_2)
    let (__warp_subexpr_0 : Uint256) = is_eq(Uint256(low=638722032, high=0), __warp_subexpr_1)
    __warp_if_1(__warp_subexpr_0)
    return ()
end

func __warp_if_0{
        bitwise_ptr : BitwiseBuiltin*, exec_env : ExecutionEnvironment*, memory_dict : DictAccess*,
        msize, pedersen_ptr : HashBuiltin*, range_check_ptr, syscall_ptr : felt*,
        termination_token}(__warp_subexpr_0 : Uint256) -> ():
    alloc_locals
    if __warp_subexpr_0.low + __warp_subexpr_0.high != 0:
        __warp_block_0()
        return ()
    else:
        return ()
    end
end

func __main_meat{
        bitwise_ptr : BitwiseBuiltin*, exec_env : ExecutionEnvironment*, memory_dict : DictAccess*,
        msize, pedersen_ptr : HashBuiltin*, range_check_ptr, syscall_ptr : felt*,
        termination_token}() -> ():
    alloc_locals
    uint256_mstore(offset=Uint256(low=64, high=0), value=Uint256(low=128, high=0))
    let (__warp_subexpr_2 : Uint256) = calldatasize()
    let (__warp_subexpr_1 : Uint256) = is_lt(__warp_subexpr_2, Uint256(low=4, high=0))
    let (__warp_subexpr_0 : Uint256) = is_zero(__warp_subexpr_1)
    __warp_if_0(__warp_subexpr_0)
    if termination_token == 1:
        return ()
    end
    assert 0 = 1
    jmp rel 0
end

