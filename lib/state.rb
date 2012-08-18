class State
	attr_reader :initial, :final, :name

	def initialize(initial, final, name)
		@initial = initial
		@final = final
		@name = name
		@transitions = []
	end

	def add_transition(transition)
		@transitions << transition
	end

	def transitions
		@transitions
	end

	def next_state(symbol, &block)
		state = @transitions.select { |x| x.symbol == symbol }.collect! { |x| x.next_state }[0]			
		if block_given?
			yield state.name.to_s
		end
		state
	end
end
