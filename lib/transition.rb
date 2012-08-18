class Transition
	attr_reader :symbol, :next_state

	def initialize(symbol, next_state)
		@symbol = symbol
		@next_state = next_state
	end

end
