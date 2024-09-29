--[[

	Find
  @Ivadsiuls

	September 29th, 2024


	Original by Stephen Leitnick (December 31st, 2023)
]]

local Find = {}

-- Removes the risk of accedently getting a property instead of a child of an instance.

function Find.path(parent: Instance, path: string): Instance
	local pathParts = string.split(path, "/")
	
	local instance = parent
	for _, pathPart in pathParts do
		local child = instance:FindFirstChild(pathPart)
		if child == nil then
			error(`failed to find {pathPart} in {instance:GetFullName()} (full path: {path})`)
		end
		instance = child
	end
	
	return instance
end

-- Instead of using FindFirstChild, uses WaitForChild.
-- Can be useful if you are trying to reference an instance that is created on runtime.

function Find.pathWait(parent: Instance, path: string, waitTimeout: number?): Instance
	local pathParts = string.split(path, "/")
	waitTimeout = waitTimeout or 5

	local instance = parent
	for _, pathPart in pathParts do
		local child = instance:WaitForChild(pathPart, waitTimeout)
		if child == nil then
			error(`failed to find {pathPart} in {instance:GetFullName()} (full path: {path})`)
		end
		instance = child
	end

	return instance
end

return Find
