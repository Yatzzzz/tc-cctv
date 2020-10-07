--Script by yatzzz

Config = {}

Config.Locale = 'en'

-- kameralar
Config.Locations = {
	{
	bankCamLabel = {label = _U('pacific_standard_bank')},
		bankCameras = {
			{label = _U('bcam'), x = 232.86, y = 221.46, z = 107.83, r = {x = -25.0, y = 0.0, z = -140.91}, canRotate = true},
			{label = _U('bcam2'), x = 257.45, y = 210.07, z = 109.08, r = {x = -25.0, y = 0.0, z = 28.05}, canRotate = true},
			{label = _U('bcam3'), x = 261.50, y = 218.08, z = 107.95, r = {x = -25.0, y = 0.0, z = -149.49}, canRotate = true},
			{label = _U('bcam4'), x = 241.64, y = 233.83, z = 111.48, r = {x = -35.0, y = 0.0, z = 120.46}, canRotate = true},
			{label = _U('bcam5'), x = 269.66, y = 223.67, z = 113.23, r = {x = -30.0, y = 0.0, z = 111.29}, canRotate = true},
			{label = _U('bcam6'), x = 261.98, y = 217.92, z = 113.25, r = {x = -40.0, y = 0.0, z = -159.49}, canRotate = true},
			{label = _U('bcam7'), x = 258.44, y = 204.97, z = 113.25, r = {x = -30.0, y = 0.0, z = 10.50}, canRotate = true},
			{label = _U('bcam8'), x = 235.53, y = 227.37, z = 113.23, r = {x = -35.0, y = 0.0, z = -160.29}, canRotate = true},
			{label = _U('bcam9'), x = 254.72, y = 206.06, z = 113.28, r = {x = -35.0, y = 0.0, z = 44.70}, canRotate = true},
			{label = _U('bcam10'), x = 269.89, y = 223.76, z = 106.48, r = {x = -35.0, y = 0.0, z = 112.62}, canRotate = true},
			{label = _U('bcam11'), x = 252.27, y = 225.52, z = 103.99, r = {x = -35.0, y = 0.0, z = -74.87}, canRotate = true}
		},

	policeCamLabel = {label = _U('motel')},
		policeCameras = {
			{label = _U('mcam1'), x = 324.72, y = -198.68, z = 59.00, r = {x = -180.00, y = -180.00, z = -22.34}, canRotate = true},  -- pinkcage
			{label = _U('mcam2'), x = -1479.7, y = -674.56, z = 36.04, r = {x = -180.00, y = -180.00, z = 3.46}, canRotate = true}  -- BURAYI BİLMİYORUM KEREM
		},
	bmCamLabel = {label = _U('bankmotel')},
			bmCameras = {
			{label = _U('bmcam1'), x = 309.38, y = -275.09, z = 55.16, r = {x = -0.0, y = 0.0, z = 210.0}, canRotate = true}, -- motel banka giriş
			{label = _U('bmcam2'), x = 309.3, y = -281.42, z = 55.16, r = {x = -0.0, y = 0.0, z = 210.0}, canRotate = true}, -- motel banka kasa
			{label = _U('bmcam3'), x = -355.64, y = -46.07, z = 50.04, r = {x = -180.0, y = -180.0, z = -26.9}, canRotate = true}, -- AVM Banka', -- prnt.sc/u46ith
			{label = _U('bmcam4'), x = 355.89, y = -52.31, z = 50.04, r = {x = -180.0, y = -180.0, z = 46.56}, canRotate = true}, -- 'AVM Banka Kasa',
			{label = _U('bmcam5'), x = -1218.69, y = -331.55, z = 38.78, r = {x = -180.0, y = -180.0, z = -66.07}, canRotate = true}, -- 'Lifeİnvaders Banka', -- prnt.sc/u46jkr
			{label = _U('bmcam6'), x = -1214.23, y = -335.92, z = 38.78, r = {x = -180.0, y = -180.0, z = -72.27}, canRotate = true} -- 'Lifeİnvaders Banka Kasa',
		},
	hospCamLabel = {label = _U('hosp')},
	    		hospCameras = {
			{label = _U('hospcam1'), x = 282.38, y = -596.68, z = 45.38, r = {x = -180.00, y = -180.00, z = 130.0}, canRotate = true}, --dış
			{label = _U('hospcam2'), x = 301.3, y = -581.34, z = 44.68, r = {x = -0.0, y = 0.0, z = -90.0}, canRotate = true}, --lobi
			{label = _U('hospcam3'), x = 305.79, y = -570.24, z = 45.28, r = {x = -0.0, y = 0.0, z = -90.0}, canRotate = true}, --sol koridor
			{label = _U('hospcam4'), x = 323.95, y = -585.06, z = 45.28, r = {x = -180.00, y = -180.00, z = -76.34}, canRotate = true}, --acil bakım
			{label = _U('hospcam5'), x = 314.2, y = -561.97, z = 45.28, r = {x = -0.0, y = 0.0, z = 180.0}, canRotate = true}, --amiliyat#1
			{label = _U('hospcam6'), x = 317.34, y = -572.79, z = 45.28, r = {x = -180.00, y = -180.00, z = 130.0}, canRotate = true}, --amiliyat#2
			{label = _U('hospcam7'), x = 326.82, y = -576.09, z = 45.28, r = {x = -180.00, y = -180.00, z = 180.0}, canRotate = true}, --amiliyat#3
			{label = _U('hospcam8'), x = 306.23, y = -568.63, z = 45.28, r = {x = -180.00, y = -180.00, z = 130.0}, canRotate = true} --labavatuar
		},
	}
}