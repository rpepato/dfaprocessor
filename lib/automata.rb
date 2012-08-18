require 'dfa'
class Automata
	include DFA

	def initialize(states=[], alphabect=[])
		@states = states
		@alphabect = alphabect
		compress_alphabect
	end

private

	def compress_alphabect
		@alphabect.uniq!
	end

end
