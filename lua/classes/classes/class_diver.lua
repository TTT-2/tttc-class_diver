CLASS.AddClass("DIVER", {
	color = Color(75, 160, 235, 255),
	passiveItems = {
		"item_ttt_nodrowningdmg"
	},
	passive = true,
	OnSet = function(ply)
		if SERVER then
			ply:GiveArmor(30)
			ply:GiveSpeedMultiplier(0.75)

			ply.wasUnderWater = false
		end
	end,
	OnUnset = function(ply)
		if SERVER then
			ply:RemoveArmor(30)

			if ply.wasUnderWater then
				ply:RemoveSpeedMultiplier(5.0)
			else
				ply:RemoveSpeedMultiplier(0.75)
			end

			ply.wasUnderWater = nil
		end
	end,
	OnThink = function(ply)
		if SERVER then
			if ply:WaterLevel() > 0 and not ply.wasUnderWater then
				ply:RemoveSpeedMultiplier(0.75)
				ply:GiveSpeedMultiplier(5.0)

				ply.wasUnderWater = true
			elseif ply:WaterLevel() == 0 and ply.wasUnderWater then
				ply:RemoveSpeedMultiplier(5.0)
				ply:GiveSpeedMultiplier(0.75)

				ply.wasUnderWater = false
			end
		end
	end,
	lang = {
		name = {
			English = "Diver",
			Deutsch = "Taucher"
		},
		desc = {
			English = "They walk a bit slower being hindered by their wetsuit on land. However they find their home in the water.",
			Deutsch = "Wegen seines Neoprenanzuges läuft er langsamer an Land. Im Wasser jedoch fühlt er sich zu Hause."
		}
	}
})
