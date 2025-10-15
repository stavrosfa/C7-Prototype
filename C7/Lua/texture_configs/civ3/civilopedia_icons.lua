local civilopedia_icons = {
	data = {},
}

function civilopedia_icons.data:map_object_to_sprite(...)
	local size, item, other = ...
	if (item:GetType().Name ~= "Building") then
		error "Expected a Building object"
	end

	if(other == nil and item.iconTextures ~= nil) then
		return {
			path = item.iconTextures[string.lower(size) .. "IconTexture"],
		}
	end

	if (other ~= nil and item.cultureVariationTextures ~= nil) then
		return {
			path = item.cultureVariationTextures[string.lower(other)][string.lower(size) .. "IconTexture"],
		}
	end

	if (other ~= nil and item.eraVariationTextures ~= nil) then
		return {
			path = item.eraVariationTextures[string.lower(other)][string.lower(size) .. "IconTexture"],
		}
	end

end

return civilopedia_icons
