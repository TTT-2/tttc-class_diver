CLASS.AddClass("DIVER", {
	color = Color(75, 160, 235, 255),
	passiveItems = {
		"item_ttt_nodrowningdmg"
	},
	passive = true,
	OnSet = function(ply)
		if SERVER then
			ply:GiveArmor(30)
		end
	end,
	OnUnset = function(ply)
		if SERVER then
			ply:RemoveArmor(30)
		end
	end,
	lang = {
		name = {
			en = "Diver",
			de = "Taucher",
			ru = "Дайвер"
		},
		desc = {
			en = "They walk a bit slower being hindered by their wetsuit on land. However they find their home in the water.",
			de = "Wegen seines Neoprenanzuges läuft er langsamer an Land. Im Wasser jedoch fühlt er sich zu Hause.",
			ru = "Он идёт немного медленнее, потому что на суше его гидрокостюм мешает. Однако ему уютно находиться в воде."
		}
	}
})

hook.Add("TTTPlayerSpeedModifier", "tttc_class_diver_walkspeed", function(ply, _, _, speedMultiplierModifier)
	if ply:GetCustomClass() ~= CLASS.CLASSES.DIVER.index then return end

	speedMultiplierModifier[1] = speedMultiplierModifier[1] * ((ply:WaterLevel() > 0) and 4.0 or 0.75)
end)
