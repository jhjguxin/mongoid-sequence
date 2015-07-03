## 0.4.0

* `activesupport` dependence change as `[">= 3.0.0","< 4.2.0"]`
* `mongoid` dependence change as `[">= 3.0.0","<= 3.1"]` # mongoid 4 _id been protected, and consistency test failure

## 0.3.1

* fix dependence error on `0.3.0`

## 0.3.0.yanked

* `activesupport` dependence change as `[">= 3.0.0","< 4.0.0"]`
* now support rails 4, and still compatible with rails 3
* define `activesupport` and `mongoid` error

## 0.2.5

* #1 Add `next_sequence` which allows to have any per model sequence, without need to create given model's objects. ([dawid-sklodowski](https://github.com/dawid-sklodowski))
* `next_sequence` support give an special step value, but only work with no `auto_increment` field

## 0.2.4

* fix call `sequence` with `nil` error, usually just `include Mongoid::Sequence` and no `sequence` been called will throw `undefined method `each' for nil:NilClas`

## 0.2.3

* allow configuring Mongoid::Sequence2, now provide the specific custom default storage options for `Mongoid::Sequences`
* some mistake amend

## 0.2.0

* support to mongoid 3.0 - 4.0. and unit-test is passed

## 0.1.0

* fork from [goncalossilva/mongoid-sequence](https://github.com/goncalossilva/mongoid-sequence)
