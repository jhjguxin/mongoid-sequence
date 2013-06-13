# Mongoid Sequence

Mongoid Sequence allows you to specify fields to behave like a sequence number (exactly like the "id" column in conventional SQL flavors).

## Credits

This gem was inspired by a couple of gists by [masatomo](https://gist.github.com/730677) and [ShogunPanda](https://gist.github.com/1086265).

and

https://github.com/agile42/mongoid_sequence2/ **from francis**

## Usage

### setup

since `v0.2.3` you can specific custom default storage options for `Mongoid::Sequences`, eg:

    #config/initializers/sequence2.rb
    Mongoid::Sequence2.setup do |config|
     config.collection_name = :__sequences
     config.session = :default
    end


Include `Mongoid::Sequence` in your class and call `sequence(:field)`.

Like this:

```ruby
class Sequenced
	include Mongoid::Document
	include Mongoid::Sequence

	field :my_sequence, :type => Integer
	sequence :my_sequence
end

s1 = Sequenced.create
s1.sequence #=> 1

s2 = Sequenced.create
s2.sequence #=> 2 # and so on
```

It's also possible to make the `id` field behave like this:

```ruby
class Sequenced
	include Mongoid::Document
	include Mongoid::Sequence

	sequence :_id
end

s1 = Sequenced.create
s1.id #=> 1

s2 = Sequenced.create
s2.id #=> 2 # and so on
```

You can also have any per model sequence without need to create given model's objects:

```ruby
class Sequenced
	include Mongoid::Document
	include Mongoid::Sequence
end

Sequenced.next_sequence('some_name_1') #=> 1
Sequenced.next_sequence('some_name_1') #=> 2
Sequenced.next_sequence('some_name_2') #=> 1
```

## Consistency

Mongoid::Sequence uses the atomic [findAndModify](http://www.mongodb.org/display/DOCS/findAndModify+Command) command, so you shouldn't have to worry about the sequence's consistency.

## Installation

Just add it to your projects' `Gemfile`:

```ruby
gem "mongoid-sequence2"
```

## Thanks

thanks [masatomo](https://github.com/masatomo), [goncalossilva](https://github.com/goncalossilva), [agile42](https://github.com/agile42)


<hr/>

Copyright © 2010 Gonçalo Silva, released under the MIT license
