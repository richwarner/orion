use array::ArrayTrait;
use array::SpanTrait;
use option::OptionTrait;
use traits::Into;

use orion::numbers::fixed_point::core::{FixedTrait, FixedType};
use orion::operators::tensor::core::{Tensor, TensorTrait};
use orion::numbers::signed_integer::i32::i32;
use orion::operators::tensor::implementations::impl_tensor_fp::Tensor_fp;

use orion::numbers::fixed_point::implementations::impl_16x16::FP16x16Impl;


/// Cf: TensorTrait::ln docstring
fn ln(self: @Tensor<u32>) -> Tensor<FixedType> {
    let mut result = ArrayTrait::new();
    let mut data = *self.data;

    loop {
        let ele = FixedTrait::from_unscaled_felt((*data.pop_front().unwrap()).into());

        result.append(FixedTrait::ln(ele));

        if (data.len() == 0) {
            break ();
        };
    };

    return TensorTrait::<FixedType>::new(*self.shape, result.span(), *self.extra);
}
