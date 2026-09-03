local utils = {}

function utils.keybind(...)
	local number_args = select("#", ...)
	local result = ""

	for i = 1, number_args do
		local params = select(i, ...)
		result = result .. tostring(params)

		if i < number_args then
			result = result .. " + "
		end
	end

	return result
end

return utils
