require File.expand_path(File.join('.', 'spec_helper'), File.dirname(__FILE__))
require 'automata'
require 'state'
require 'transition'

describe "Automata" do

	describe "DFA" do

		describe "When Processing" do

			before(:each) do
				@alphabect = ['0','1']
				initial_state = State.new(true, false, :I)
				final_state = State.new(false, true, :F)
				initial_state.add_transition Transition.new('0', final_state)
				initial_state.add_transition Transition.new('1', final_state)
				final_state.add_transition Transition.new('0', initial_state)
				final_state.add_transition Transition.new('1', final_state)
				@automata = Automata.new([initial_state, final_state], @alphabect)
			end

			it "should raise error when no initial state is present" do
				lambda{Automata.new([],@alphabect).accepts?("1")}.should raise_error "No inital state or more than one initial state found."
			end

			it "should raise error when no final states are present" do
				initial_state = State.new(true, false, :r)
				lambda{Automata.new([initial_state], @alphabect).accepts?("1")}.should raise_error "No final state found."
			end

			it "should raise error when miss transition functions" do
				initial_state = State.new(true, false, :r)
				final_state = State.new(false, true, :s)
				initial_state.add_transition Transition.new('0', initial_state)
				initial_state.add_transition Transition.new('1', final_state)
				final_state.add_transition Transition.new('1', initial_state)
				automata = Automata.new([initial_state, final_state], @alphabect)
				lambda{automata.accepts?("1010")}.should raise_error "It doesn't exist transtitions for each state/symbol pair or state/symbol pair specified more than once."				
			end

			it "should accept a valid symbol chain" do
				@automata.accepts?("1010101").should be_true
			end

			it "should reject an invalid symbol chain" do 
				@automata.accepts?("0111011111010").should_not be_true
			end

		end

	end

end
