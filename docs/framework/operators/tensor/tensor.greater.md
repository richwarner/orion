#tensor.greater

```rust
    fn greater(self: @Tensor<T>, other: @Tensor<T>) -> Tensor<usize>;
```

Check if each element of the first tensor is greater than the corresponding element of the second tensor.
The input tensors must have either:
* Exactly the same shape
* The same number of dimensions and the length of each dimension is either a common length or 1.

## Args

* `self`(`@Tensor<T>`) - The first tensor to be compared
* `other`(`@Tensor<T>`) - The second tensor to be compared

## Panics

* Panics if the shapes are not equal or broadcastable

## Returns

A new `Tensor<usize>` of booleans (0 or 1) with the same shape as the broadcasted inputs.

## Examples

Case 1: Compare tensors with same shape

```rust
fn greater_example() -> Tensor<usize> {
    // We instantiate two 3D Tensor here.
    // tensor_y = [[0,1,2],[3,4,5],[6,7,8]]
    // tensor_z = [[0,1,2],[3,4,5],[9,1,5]]
    let tensor_y = u32_tensor_2x2x2_helper();
    let tensor_z = u32_tensor_2x2x2_helper();
    let result = tensor_y.greater(@tensor_z);
    return result;
}
>>> [0,0,0,0,0,0,0,1,1]
```

Case 2: Compare tensors with different shapes

```rust
fn greater_example() -> Tensor<usize> {
    // tensor_y = [[0,1,2],[3,4,5],[6,7,8]]
    // tensor_z = [[0,1,2]]
    let tensor_y = u32_tensor_3x3_helper();
    let tensor_z = u32_tensor_3x1_helper();
    let result = tensor_y.greater(@tensor_z);
    // We could equally do something like:
    // let result = tensor_z.greater(@tensor_y);
    return result;
}
>>> [0,0,0,1,1,1,1,1,1]
```
