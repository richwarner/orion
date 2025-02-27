use orion::operators::tensor::core::{Tensor, ExtraParams};
use orion::numbers::fixed_point::core::{FixedType, FixedImpl};
use orion::operators::tensor::linalg::matmul::matmul_fp::fp8x23;
use orion::operators::tensor::linalg::matmul::matmul_fp::fp16x16;

/// Cf: TensorTrait::matmul docstring
fn matmul(self: @Tensor<FixedType>, other: @Tensor<FixedType>) -> Option<Tensor<FixedType>> {
    match *self.extra {
        Option::Some(extra_params) => match extra_params.fixed_point {
            Option::Some(fixed_point) => match fixed_point {
                FixedImpl::FP8x23(()) => Option::Some(fp8x23::matmul(self, other)),
                FixedImpl::FP16x16(()) => Option::Some(fp16x16::matmul(self, other)),
            },
            Option::None(_) => Option::Some((fp16x16::matmul(self, other))),
        },
        Option::None(_) => Option::Some((fp16x16::matmul(self, other))),
    }
}
