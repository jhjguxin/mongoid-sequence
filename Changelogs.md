## 0.2.4

* fix call `sequence` with `nil` error, usually just `include Mongoid::Sequence` and no `sequence` been called will throw `undefined method `each' for nil:NilClas`

## 0.2.3

* allow configuring Mongoid::Sequence2, now provide the specific custom default storage options for `Mongoid::Sequences`
* some mistake amend

## 0.2.0

* support to mongoid 3.0 - 4.0. and unit-test is passed

## 0.1.0

* fork from [goncalossilva/mongoid-sequence](https://github.com/goncalossilva/mongoid-sequence)
