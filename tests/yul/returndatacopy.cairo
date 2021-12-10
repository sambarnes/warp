%lang starknet
%builtins pedersen range_check bitwise

from evm.calls import calldata_load, calldatasize_, returndata_copy, returndata_write, warp_call
from evm.exec_env import ExecutionEnvironment
from evm.memory import mload_, mstore_
from evm.uint256 import is_eq, is_gt, is_lt, is_zero, slt, u256_add, u256_shl, u256_shr
from starkware.cairo.common.alloc import alloc
from starkware.cairo.common.cairo_builtins import BitwiseBuiltin, HashBuiltin
from starkware.cairo.common.default_dict import default_dict_finalize, default_dict_new
from starkware.cairo.common.dict_access import DictAccess
from starkware.cairo.common.registers import get_fp_and_pc
from starkware.cairo.common.uint256 import Uint256, uint256_and, uint256_not, uint256_sub

func returndata_size{exec_env : ExecutionEnvironment*}() -> (res : Uint256):
    return (Uint256(low=exec_env.returndata_size, high=0))
end

func __warp_constant_10000000000000000000000000000000000000000() -> (res : Uint256):
    return (Uint256(low=131811359292784559562136384478721867776, high=29))
end

@storage_var
func this_address() -> (res : felt):
end

@storage_var
func address_initialized() -> (res : felt):
end

func initialize_address{range_check_ptr, syscall_ptr : felt*, pedersen_ptr : HashBuiltin*}(
        self_address : felt):
    let (address_init) = address_initialized.read()
    if address_init == 1:
        return ()
    end
    this_address.write(self_address)
    address_initialized.write(1)
    return ()
end

func __warp_cond_revert(_3_3 : Uint256) -> ():
    alloc_locals
    if _3_3.low + _3_3.high != 0:
        assert 0 = 1
        jmp rel 0
    else:
        return ()
    end
end

func abi_decode_address{exec_env : ExecutionEnvironment*, range_check_ptr}(
        headStart : Uint256, dataEnd : Uint256) -> (value0 : Uint256):
    alloc_locals
    local _1_1 : Uint256 = Uint256(low=32, high=0)
    let (local _2_2 : Uint256) = uint256_sub(dataEnd, headStart)
    local range_check_ptr = range_check_ptr
    let (local _3_3 : Uint256) = slt(_2_2, _1_1)
    local range_check_ptr = range_check_ptr
    __warp_cond_revert(_3_3)
    let (local value0 : Uint256) = calldata_load(headStart.low)
    local range_check_ptr = range_check_ptr
    local exec_env : ExecutionEnvironment* = exec_env
    return (value0)
end

func finalize_allocation{memory_dict : DictAccess*, msize, range_check_ptr}(
        memPtr : Uint256, size : Uint256) -> ():
    alloc_locals
    let (local _1_10 : Uint256) = uint256_not(Uint256(low=31, high=0))
    local range_check_ptr = range_check_ptr
    local _2_11 : Uint256 = Uint256(low=31, high=0)
    let (local _3_12 : Uint256) = u256_add(size, _2_11)
    local range_check_ptr = range_check_ptr
    let (local _4_13 : Uint256) = uint256_and(_3_12, _1_10)
    local range_check_ptr = range_check_ptr
    let (local newFreePtr : Uint256) = u256_add(memPtr, _4_13)
    local range_check_ptr = range_check_ptr
    let (local _5_14 : Uint256) = is_lt(newFreePtr, memPtr)
    local range_check_ptr = range_check_ptr
    let (local __warp_subexpr_0 : Uint256) = u256_shl(
        Uint256(low=64, high=0), Uint256(low=1, high=0))
    local range_check_ptr = range_check_ptr
    let (local _6_15 : Uint256) = uint256_sub(__warp_subexpr_0, Uint256(low=1, high=0))
    local range_check_ptr = range_check_ptr
    let (local _7_16 : Uint256) = is_gt(newFreePtr, _6_15)
    local range_check_ptr = range_check_ptr
    let (local _8_17 : Uint256) = uint256_sub(_7_16, _5_14)
    local range_check_ptr = range_check_ptr
    __warp_cond_revert(_8_17)
    local _9_18 : Uint256 = Uint256(low=64, high=0)
    mstore_(offset=_9_18.low, value=newFreePtr)
    local memory_dict : DictAccess* = memory_dict
    local msize = msize
    local range_check_ptr = range_check_ptr
    return ()
end

func validator_revert_bool{range_check_ptr}(value_51 : Uint256) -> ():
    alloc_locals
    let (local _1_52 : Uint256) = is_zero(value_51)
    local range_check_ptr = range_check_ptr
    let (local _2_53 : Uint256) = is_zero(_1_52)
    local range_check_ptr = range_check_ptr
    let (local _3_54 : Uint256) = is_eq(value_51, _2_53)
    local range_check_ptr = range_check_ptr
    let (local _4_55 : Uint256) = is_zero(_3_54)
    local range_check_ptr = range_check_ptr
    __warp_cond_revert(_4_55)
    return ()
end

func abi_decode_t_bool_fromMemory{memory_dict : DictAccess*, msize, range_check_ptr}(
        offset : Uint256) -> (value : Uint256):
    alloc_locals
    let (local value : Uint256) = mload_(offset.low)
    local memory_dict : DictAccess* = memory_dict
    local msize = msize
    local range_check_ptr = range_check_ptr
    validator_revert_bool(value)
    local range_check_ptr = range_check_ptr
    return (value)
end

func abi_decode_bool_fromMemory{memory_dict : DictAccess*, msize, range_check_ptr}(
        headStart_4 : Uint256, dataEnd_5 : Uint256) -> (value0_6 : Uint256):
    alloc_locals
    local _1_7 : Uint256 = Uint256(low=32, high=0)
    let (local _2_8 : Uint256) = uint256_sub(dataEnd_5, headStart_4)
    local range_check_ptr = range_check_ptr
    let (local _3_9 : Uint256) = slt(_2_8, _1_7)
    local range_check_ptr = range_check_ptr
    __warp_cond_revert(_3_9)
    let (local value0_6 : Uint256) = abi_decode_t_bool_fromMemory(headStart_4)
    local memory_dict : DictAccess* = memory_dict
    local msize = msize
    local range_check_ptr = range_check_ptr
    return (value0_6)
end

func __warp_block_0{
        exec_env : ExecutionEnvironment*, memory_dict : DictAccess*, msize, range_check_ptr}(
        _4_20 : Uint256) -> ():
    alloc_locals
    let (local _12_28 : Uint256) = returndata_size()
    local exec_env : ExecutionEnvironment* = exec_env
    finalize_allocation(_4_20, _12_28)
    local memory_dict : DictAccess* = memory_dict
    local msize = msize
    local range_check_ptr = range_check_ptr
    let (local _13_29 : Uint256) = returndata_size()
    local exec_env : ExecutionEnvironment* = exec_env
    let (local _14_30 : Uint256) = u256_add(_4_20, _13_29)
    local range_check_ptr = range_check_ptr
    let (local _15_31 : Uint256) = abi_decode_bool_fromMemory(_4_20, _14_30)
    local memory_dict : DictAccess* = memory_dict
    local msize = msize
    local range_check_ptr = range_check_ptr

    return ()
end

func __warp_if_0{
        exec_env : ExecutionEnvironment*, memory_dict : DictAccess*, msize, range_check_ptr}(
        _10_26 : Uint256, _4_20 : Uint256) -> ():
    alloc_locals
    if _10_26.low + _10_26.high != 0:
        __warp_block_0(_4_20)
        local exec_env : ExecutionEnvironment* = exec_env
        local memory_dict : DictAccess* = memory_dict
        local msize = msize
        local range_check_ptr = range_check_ptr
        return ()
    else:
        return ()
    end
end

func fun_callMe{
        bitwise_ptr : BitwiseBuiltin*, exec_env : ExecutionEnvironment*, memory_dict : DictAccess*,
        msize, range_check_ptr, syscall_ptr : felt*}(var_add : Uint256) -> ():
    alloc_locals
    local _3_19 : Uint256 = Uint256(low=64, high=0)
    let (local _4_20 : Uint256) = mload_(_3_19.low)
    local memory_dict : DictAccess* = memory_dict
    local msize = msize
    local range_check_ptr = range_check_ptr
    let (local _5_21 : Uint256) = u256_shl(Uint256(low=225, high=0), Uint256(low=633173243, high=0))
    local range_check_ptr = range_check_ptr
    mstore_(offset=_4_20.low, value=_5_21)
    local memory_dict : DictAccess* = memory_dict
    local msize = msize
    local range_check_ptr = range_check_ptr
    local _6_22 : Uint256 = Uint256(low=0, high=0)
    local _7_23 : Uint256 = Uint256(low=32, high=0)
    local _8_24 : Uint256 = Uint256(low=4, high=0)
    let (local _9_25 : Uint256) = __warp_constant_10000000000000000000000000000000000000000()
    let (local _10_26 : Uint256) = warp_call(_9_25, var_add, _6_22, _4_20, _8_24, _4_20, _7_23)
    local syscall_ptr : felt* = syscall_ptr
    local exec_env : ExecutionEnvironment* = exec_env
    local memory_dict : DictAccess* = memory_dict
    local range_check_ptr = range_check_ptr
    local bitwise_ptr : BitwiseBuiltin* = bitwise_ptr
    let (local _11_27 : Uint256) = is_zero(_10_26)
    local range_check_ptr = range_check_ptr
    __warp_cond_revert(_11_27)
    __warp_if_0(_10_26, _4_20)
    local exec_env : ExecutionEnvironment* = exec_env
    local memory_dict : DictAccess* = memory_dict
    local msize = msize
    local range_check_ptr = range_check_ptr
    local _16_32 : Uint256 = _7_23
    returndata_copy(_6_22, _6_22, _7_23)
    local range_check_ptr = range_check_ptr
    local exec_env : ExecutionEnvironment* = exec_env
    local memory_dict : DictAccess* = memory_dict
    local _17_33 : Uint256 = Uint256(low=1, high=0)
    let (local _18_34 : Uint256) = mload_(_6_22.low)
    local memory_dict : DictAccess* = memory_dict
    local msize = msize
    local range_check_ptr = range_check_ptr
    let (local _19 : Uint256) = is_eq(_18_34, _17_33)
    local range_check_ptr = range_check_ptr
    let (local _20 : Uint256) = is_zero(_19)
    local range_check_ptr = range_check_ptr
    __warp_cond_revert(_20)
    return ()
end

func __warp_block_2{
        bitwise_ptr : BitwiseBuiltin*, exec_env : ExecutionEnvironment*, memory_dict : DictAccess*,
        msize, range_check_ptr, syscall_ptr : felt*}(
        _2 : Uint256, _3 : Uint256, _4 : Uint256, _7 : Uint256) -> ():
    alloc_locals
    local _13 : Uint256 = _4
    local _14 : Uint256 = _3
    let (local _15 : Uint256) = abi_decode_address(_3, _4)
    local exec_env : ExecutionEnvironment* = exec_env
    local range_check_ptr = range_check_ptr
    fun_callMe(_15)
    local bitwise_ptr : BitwiseBuiltin* = bitwise_ptr
    local exec_env : ExecutionEnvironment* = exec_env
    local memory_dict : DictAccess* = memory_dict
    local msize = msize
    local range_check_ptr = range_check_ptr
    local syscall_ptr : felt* = syscall_ptr
    local _16 : Uint256 = _7
    local _17 : Uint256 = _2
    let (local _18 : Uint256) = mload_(_2.low)
    local memory_dict : DictAccess* = memory_dict
    local msize = msize
    local range_check_ptr = range_check_ptr
    returndata_write(_18, _7)
    local exec_env : ExecutionEnvironment* = exec_env
    return ()
end

func __warp_if_2{
        bitwise_ptr : BitwiseBuiltin*, exec_env : ExecutionEnvironment*, memory_dict : DictAccess*,
        msize, range_check_ptr, syscall_ptr : felt*}(
        _12 : Uint256, _2 : Uint256, _3 : Uint256, _4 : Uint256, _7 : Uint256) -> ():
    alloc_locals
    if _12.low + _12.high != 0:
        __warp_block_2(_2, _3, _4, _7)
        local bitwise_ptr : BitwiseBuiltin* = bitwise_ptr
        local exec_env : ExecutionEnvironment* = exec_env
        local memory_dict : DictAccess* = memory_dict
        local msize = msize
        local range_check_ptr = range_check_ptr
        local syscall_ptr : felt* = syscall_ptr
        return ()
    else:
        return ()
    end
end

func __warp_block_1{
        bitwise_ptr : BitwiseBuiltin*, exec_env : ExecutionEnvironment*, memory_dict : DictAccess*,
        msize, range_check_ptr, syscall_ptr : felt*}(_2 : Uint256, _3 : Uint256, _4 : Uint256) -> (
        ):
    alloc_locals
    local _7 : Uint256 = Uint256(low=0, high=0)
    let (local _8 : Uint256) = calldata_load(_7.low)
    local range_check_ptr = range_check_ptr
    local exec_env : ExecutionEnvironment* = exec_env
    local _9 : Uint256 = Uint256(low=224, high=0)
    let (local _10 : Uint256) = u256_shr(_9, _8)
    local range_check_ptr = range_check_ptr
    local _11 : Uint256 = Uint256(low=2994440196, high=0)
    let (local _12 : Uint256) = is_eq(_11, _10)
    local range_check_ptr = range_check_ptr
    __warp_if_2(_12, _2, _3, _4, _7)
    local bitwise_ptr : BitwiseBuiltin* = bitwise_ptr
    local exec_env : ExecutionEnvironment* = exec_env
    local memory_dict : DictAccess* = memory_dict
    local msize = msize
    local range_check_ptr = range_check_ptr
    local syscall_ptr : felt* = syscall_ptr
    return ()
end

func __warp_if_1{
        bitwise_ptr : BitwiseBuiltin*, exec_env : ExecutionEnvironment*, memory_dict : DictAccess*,
        msize, range_check_ptr, syscall_ptr : felt*}(
        _2 : Uint256, _3 : Uint256, _4 : Uint256, _6 : Uint256) -> ():
    alloc_locals
    if _6.low + _6.high != 0:
        __warp_block_1(_2, _3, _4)
        local bitwise_ptr : BitwiseBuiltin* = bitwise_ptr
        local exec_env : ExecutionEnvironment* = exec_env
        local memory_dict : DictAccess* = memory_dict
        local msize = msize
        local range_check_ptr = range_check_ptr
        local syscall_ptr : felt* = syscall_ptr
        return ()
    else:
        return ()
    end
end

@external
func fun_ENTRY_POINT{
        pedersen_ptr : HashBuiltin*, range_check_ptr, syscall_ptr : felt*,
        bitwise_ptr : BitwiseBuiltin*}(
        calldata_size, calldata_len, calldata : felt*, self_address : felt) -> (
        success : felt, returndata_size : felt, returndata_len : felt, returndata : felt*):
    alloc_locals
    let (local __fp__, _) = get_fp_and_pc()
    initialize_address{
        range_check_ptr=range_check_ptr, syscall_ptr=syscall_ptr, pedersen_ptr=pedersen_ptr}(
        self_address)
    local pedersen_ptr : HashBuiltin* = pedersen_ptr
    local range_check_ptr = range_check_ptr
    local syscall_ptr : felt* = syscall_ptr
    let (returndata_ptr : felt*) = alloc()
    local exec_env_ : ExecutionEnvironment = ExecutionEnvironment(calldata_size=calldata_size, calldata_len=calldata_len, calldata=calldata, returndata_size=0, returndata_len=0, returndata=returndata_ptr, to_returndata_size=0, to_returndata_len=0, to_returndata=returndata_ptr)
    let exec_env : ExecutionEnvironment* = &exec_env_
    let (local memory_dict) = default_dict_new(0)
    local memory_dict_start : DictAccess* = memory_dict
    let msize = 0
    with exec_env, msize, memory_dict:
        local _1 : Uint256 = Uint256(low=128, high=0)
        local _2 : Uint256 = Uint256(low=64, high=0)
        with memory_dict, msize, range_check_ptr:
            mstore_(offset=_2.low, value=_1)
        end

        local memory_dict : DictAccess* = memory_dict
        local msize = msize
        local range_check_ptr = range_check_ptr
        local _3 : Uint256 = Uint256(low=4, high=0)
        let (local _4 : Uint256) = calldatasize_()
        local range_check_ptr = range_check_ptr
        local exec_env : ExecutionEnvironment* = exec_env
        let (local _5 : Uint256) = is_lt(_4, _3)
        local range_check_ptr = range_check_ptr
        let (local _6 : Uint256) = is_zero(_5)
        local range_check_ptr = range_check_ptr
        with exec_env, memory_dict, msize, pedersen_ptr, range_check_ptr, syscall_ptr:
            __warp_if_1(_2, _3, _4, _6)
        end

        local bitwise_ptr : BitwiseBuiltin* = bitwise_ptr
        local exec_env : ExecutionEnvironment* = exec_env
        local memory_dict : DictAccess* = memory_dict
        local msize = msize
        local range_check_ptr = range_check_ptr
        local syscall_ptr : felt* = syscall_ptr
    end
    default_dict_finalize(memory_dict_start, memory_dict, 0)
    return (1, exec_env.to_returndata_size, exec_env.to_returndata_len, exec_env.to_returndata)
end
