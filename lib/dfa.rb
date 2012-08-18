module DFA

	def accepts? (symbol_chain)
		if valid?(symbol_chain)
			@current_state = @states.select {|state| state.initial}[0]
			symbol_chain.each_char do |symbol|
				@current_state = @current_state.next_state(symbol) do |next_state|
					puts "Current state is: #{@current_state.name.to_s} - Read symbol: #{symbol} - Next state will be: #{next_state}"
				end
			end
			return @current_state.final
		else
			puts "Processing will stop now."
		end
	end

private

	def valid?(symbol_chain)
			raise "No inital state or more than one initial state found." unless has_only_one_initial_state?
			raise "No final state found." unless has_final_state?
			raise "It doesn't exist transtitions for each state/symbol pair or state/symbol pair specified more than once." unless 			           has_transition_functions_for_each_symbol_in_each_state?
			true
		end

		def has_only_one_initial_state?
			@states.select {|x| x.initial}.count == 1
		end

		def has_final_state?
			@states.select {|x| x.final}.count > 0
		end

		def has_transition_functions_for_each_symbol_in_each_state?
			@states.each do |state|
				@alphabect.each do |symbol|
					return false unless state.transitions.select {|x| x.symbol == symbol}.count == 1
				end
			end
			true
		end

end
