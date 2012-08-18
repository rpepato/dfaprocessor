$LOAD_PATH << File.expand_path(File.dirname(__FILE__))
require 'transition'
require 'state'
require 'automata'

initial_state = State.new(true, false, :s)
final_state = State.new(false, true, :r)

alphabect = ['0','1']

initial_state.add_transition (Transition.new('0', final_state))
initial_state.add_transition (Transition.new('1', final_state))
final_state.add_transition (Transition.new('0', initial_state))
final_state.add_transition (Transition.new('1', final_state))

if Automata.new([initial_state, final_state], alphabect).accepts?("00011")
	p "Accepted"
else
	p "Rejected"
end




