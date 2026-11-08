script_author("KuDo")
script_name("[ARZ]WH for HW26")
script_version('v0.01')

local ff = "{ff0000}[WH]{FFFFFF}"

activated = false

function main()
	while not isSampAvailable() do wait(0) end
	local font = renderCreateFont("Courier New", 9, 7)
	sampRegisterChatCommand("hw", function()
		activated = not activated
		if activated then
			addOneOffSound(0.0, 0.0, 0.0, 1083)
			sampAddChatMessage("{00FF00}[WH by KuDo] {FFFFFF}ON", -1)
		else
			addOneOffSound(0.0, 0.0, 0.0, 1084)
			sampAddChatMessage("{FF0000}[WH by KuDo] {FFFFFF}OFF", -1)
		end
		
	end)
	while true do
		wait(0)
		if activated then
			for a = 1, 2048 do
				if sampIs3dTextDefined(a) then
					local string, color, vposX, vposY, vposZ, distance, ignoreWalls, playerId, vehicleId = sampGet3dTextInfoById(a)
					local X, Y, Z = getCharCoordinates(PLAYER_PED)
					local distances = getDistanceBetweenCoords2d(vposX, vposY, X, Y)
					if isPointOnScreen(vposX, vposY, vposZ, 0.0) and string.find(string, "Ўкатулка тьмы") and distances > 1.0 then
						local wposX, wposY = convert3DCoordsToScreen(vposX, vposY, vposZ)
						renderFontDrawText(font, ff .. "Ўкатулка", wposX, wposY, color)
					end
				end
			end
		end
  end
end
