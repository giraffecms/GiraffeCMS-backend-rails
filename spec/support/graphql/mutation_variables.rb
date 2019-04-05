module GraphQL
	module MutationVariables
		def create_post_mutation_variables(input = {})
			attributes = attributes_for(:post)

			input.reverse_merge!(attributes)

			camelize_hash_keys(input).to_json
		end

		def camelize_hash_keys(hash)
			raise unless hash.is_a?(Hash)

			hash.transform_keys { |key| key.to_s.camelize(:lower) }
		end
	end
end