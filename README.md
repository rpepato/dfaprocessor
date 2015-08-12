DFAProcessor
============

A Ruby library for processing of deterministc finit automatons (DFAs)

DFAProcessor does the job of analyze a chain of symbols against a [DFA](http://en.wikipedia.org/wiki/Deterministic_finite_automaton) and answer if the chain is accepted or rejected by
the automaton. To use this library, you should provide:
  * a set of states (containing one initial state and at least one final state)
  * a set of transition functions (to determine the next state considering the current symbol in the chain)
  * a symbol chain (a string) to be validated

Sample Usage
------------
```ruby
$LOAD_PATH << File.expand_path(File.dirname(__FILE__))
require 'transition'
require 'state'
require 'automata'

initial_state = State.new(true, false, :s)
final_state = State.new(false, true, :r)

alphabect = ['0','1']

initial_state.add_transition (Transition.new('0', final_state))
initial_state.add_transition (Transition.new('1', final_state)
final_state.add_transition (Transition.new('0', initial_state))
final_state.add_transition (Transition.new('1', final_state))

if Automata.new([initial_state, final_state], alphabect).accepts?("00011")
  p "Accepted"
else
  p "Rejected"
end
```
Specs
------------
To run the specs:

```ruby
bundle
rspec
```
