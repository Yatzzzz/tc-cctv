---------------------------TEAMDEMO--------------------------

ESX = nil
local PlayerData = {}
local isInMarker = false
local CurrentAction = nil
local menuopen = false
local bankcamera = false
local policecamera = false 
local hospcamera = false 
local blockbuttons = false
local currentCameraIndex = 0
local currentCameraIndexIndex = 0
local createdCamera = 0

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(100)
	end

	PlayerData = ESX.GetPlayerData()
end)
 
RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
		PlayerData.job = job
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(21)

		if IsControlJustReleased(0, 38) and CurrentAction == 'cameras' then
			if not menuopen then
				CurrentAction, menuopen = nil, true
		
				local elements = {
					{label = _U('bank_menu_selection'),   value = 'bankmenu'},
					{label = _U('police_menu_selection'), value = 'policemenu'},
					{label = _U('bankmotel_menu_selection'), value = 'mbankmenu'},
					{label = _U('hosp_menu_selection'), value = 'hospmenu'}
				}
		
				ESX.UI.Menu.CloseAll()
		
				ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'cloakroom',
				{
					title    = _U('securitycams_menu'),
					align    = 'top-left',
					elements = elements
				}, function(data, menu)
		
					if data.current.value == 'bankmenu' then
						inCam = true
		
							menu.close()
							bankcamera = true
							blockbuttons = true
							local firstCamx = Config.Locations[1].bankCameras[1].x
							local firstCamy = Config.Locations[1].bankCameras[1].y
							local firstCamz = Config.Locations[1].bankCameras[1].z
							local firstCamr = Config.Locations[1].bankCameras[1].r
							SetFocusArea(firstCamx, firstCamy, firstCamz, firstCamx, firstCamy, firstCamz)
							ChangeSecurityCamera(firstCamx, firstCamy, firstCamz, firstCamr)
		
		
							SendNUIMessage({
								type = "enablecam",
								label = Config.Locations[1].bankCameras[1].label,
								box = Config.Locations[1].bankCamLabel.label
							})
		
							currentCameraIndex = 1
							currentCameraIndexIndex = 1
							menuopen = false
							TriggerEvent('esx_securitycam:freeze', true)
		
		
							SetTimecycleModifierStrength(1.0)
							local scaleform = RequestScaleformMovie("TRAFFIC_CAM")
							while not HasScaleformMovieLoaded(scaleform) do
								Citizen.Wait(900)
							end
						
							PushScaleformMovieFunction(scaleform, "PLAY_CAM_MOVIE")
							SetFocusArea(x, y, z, 0.0, 0.0, 0.0)
							PopScaleformMovieFunctionVoid()
						
							while inCam do
								PopScaleformMovieFunctionVoid()
								DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 255)
								Citizen.Wait(1)
							end
		
					elseif data.current.value == 'policemenu' then
						inCam = true
		
							menu.close()
							policecamera = true
							blockbuttons = true
							local firstCamx = Config.Locations[1].policeCameras[1].x
							local firstCamy = Config.Locations[1].policeCameras[1].y
							local firstCamz = Config.Locations[1].policeCameras[1].z
							local firstCamr = Config.Locations[1].policeCameras[1].r
		
							SetFocusArea(firstCamx, firstCamy, firstCamz, firstCamx, firstCamy, firstCamz)
							ChangeSecurityCamera(firstCamx, firstCamy, firstCamz, firstCamr)
		
		
							SendNUIMessage({
								type  = "enablecam",
								label = Config.Locations[1].policeCameras[1].label,
								box   = Config.Locations[1].policeCamLabel.label
							})
		
							currentCameraIndex = 1
							currentCameraIndexIndex = 1
							menuopen = false
							TriggerEvent('esx_securitycam:freeze', true)
		
		
							SetTimecycleModifierStrength(1.0)
							local scaleform = RequestScaleformMovie("TRAFFIC_CAM")
							while not HasScaleformMovieLoaded(scaleform) do
								Citizen.Wait(900)
							end
						
							PushScaleformMovieFunction(scaleform, "PLAY_CAM_MOVIE")
							SetFocusArea(x, y, z, 0.0, 0.0, 0.0)
							PopScaleformMovieFunctionVoid()
						
							while inCam do
								PopScaleformMovieFunctionVoid()
								DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 255)
								Citizen.Wait(1)
							end
		
					elseif data.current.value == 'mbankmenu' then
						inCam = true

					
							menu.close()
							bmcamera = true
							blockbuttons = true
							local firstCamx = Config.Locations[1].bmCameras[1].x
							local firstCamy = Config.Locations[1].bmCameras[1].y
							local firstCamz = Config.Locations[1].bmCameras[1].z
							local firstCamr = Config.Locations[1].bmCameras[1].r
		
							SetFocusArea(firstCamx, firstCamy, firstCamz, firstCamx, firstCamy, firstCamz)
							ChangeSecurityCamera(firstCamx, firstCamy, firstCamz, firstCamr)
		
		
							SendNUIMessage({
								type  = "enablecam",
								label = Config.Locations[1].bmCameras[1].label,
								box   = Config.Locations[1].bmCamLabel.label
							})
		
							currentCameraIndex = 1
							currentCameraIndexIndex = 1
							menuopen = false
							TriggerEvent('esx_securitycam:freeze', true)
		
		
							SetTimecycleModifierStrength(1.0)
							local scaleform = RequestScaleformMovie("TRAFFIC_CAM")
							while not HasScaleformMovieLoaded(scaleform) do
								Citizen.Wait(900)
							end
						
							PushScaleformMovieFunction(scaleform, "PLAY_CAM_MOVIE")
							SetFocusArea(x, y, z, 0.0, 0.0, 0.0)
							PopScaleformMovieFunctionVoid()
						
							while inCam do
								PopScaleformMovieFunctionVoid()
								DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 255)
								Citizen.Wait(1)
							end
		
					elseif data.current.value == 'hospmenu' then
						inCam = true
		
		
						SetTimecycleModifier("heliGunCam")
						SetTimecycleModifierStrength(1.0)
						local scaleform = RequestScaleformMovie("TRAFFIC_CAM")
						while not HasScaleformMovieLoaded(scaleform) do
							Citizen.Wait(900)
						end
		
						PushScaleformMovieFunction(scaleform, "PLAY_CAM_MOVIE")
						SetFocusArea(x, y, z, 0.0, 0.0, 0.0)
						PopScaleformMovieFunctionVoid()
		
						menu.close()
						hospcamera = true
						blockbuttons = true
						local firstCamx = Config.Locations[1].hospCameras[1].x
						local firstCamy = Config.Locations[1].hospCameras[1].y
						local firstCamz = Config.Locations[1].hospCameras[1].z
						local firstCamr = Config.Locations[1].hospCameras[1].r
		
						SetFocusArea(firstCamx, firstCamy, firstCamz, firstCamx, firstCamy, firstCamz)
						ChangeSecurityCamera(firstCamx, firstCamy, firstCamz, firstCamr)
		
		
						SendNUIMessage({
							type  = "enablecam",
							label = Config.Locations[1].hospCameras[1].label,
							box   = Config.Locations[1].hospCamLabel.label
						 })
		
						currentCameraIndex = 1
						currentCameraIndexIndex = 1
						menuopen = false
						TriggerEvent('esx_securitycam:freeze', true)
		
		
						SetTimecycleModifierStrength(1.0)
						local scaleform = RequestScaleformMovie("TRAFFIC_CAM")
						while not HasScaleformMovieLoaded(scaleform) do
							Citizen.Wait(900)
						end
					
						PushScaleformMovieFunction(scaleform, "PLAY_CAM_MOVIE")
						SetFocusArea(x, y, z, 0.0, 0.0, 0.0)
						PopScaleformMovieFunctionVoid()
					
						while inCam do
							PopScaleformMovieFunctionVoid()
							DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 255)
							Citizen.Wait(1)
						end
					end
		
		
				end, function(data, menu)
					menu.close()
					menuopen = false
				end)
			end
		end

		if createdCamera ~= 0 then
			exports['mythic_notify']:SendAlert('inform', 'Sağ ve Sol ok yönleri ile kameralar arası geçiş, numpad 4,6,2,8 tuşları ile kamerayı hareket ettirebilirsin ve backspace ile kamerlardan çıkış yapabilirsiniz', 2500)
			break:

			DrawScaleformMovieFullscreen(instructions, 255, 255, 255, 255, 0)
			SetTimecycleModifier("scanline_cam_cheap")
			SetTimecycleModifierStrength(2.0)

			-- CLOSE CAMERAS
			if IsControlJustPressed(0, 177) then
				CloseSecurityCamera()
				SendNUIMessage({
					type = "disablecam",
				})

				CurrentAction = nil
				bankcamera = false
				policecamera = false
				bmcamera = false
				hospcamera = false
				blockbuttons = false
				inCam = false
				TriggerEvent('esx_securitycam:freeze', false)
			end

			-- GO BACK CAMERA
			if IsControlJustPressed(0, 174) then
				if bankcamera then
					local newCamIndex

					if currentCameraIndexIndex == 1 then
						newCamIndex = #Config.Locations[currentCameraIndex].bankCameras
					else
						newCamIndex = currentCameraIndexIndex - 1
					end

					local newCamx = Config.Locations[currentCameraIndex].bankCameras[newCamIndex].x
					local newCamy = Config.Locations[currentCameraIndex].bankCameras[newCamIndex].y
					local newCamz = Config.Locations[currentCameraIndex].bankCameras[newCamIndex].z
					local newCamr = Config.Locations[currentCameraIndex].bankCameras[newCamIndex].r

					SetFocusArea(newCamx, newCamy, newCamz, newCamx, newCamy, newCamz)
					SendNUIMessage({
						type = "updatecam",
						label = Config.Locations[currentCameraIndex].bankCameras[newCamIndex].label
					})

					ChangeSecurityCamera(newCamx, newCamy, newCamz, newCamr)
					currentCameraIndexIndex = newCamIndex
				elseif policecamera then
					local newCamIndex

					if currentCameraIndexIndex == 1 then
						newCamIndex = #Config.Locations[currentCameraIndex].policeCameras
					else
						newCamIndex = currentCameraIndexIndex - 1
					end

					local newCamx = Config.Locations[currentCameraIndex].policeCameras[newCamIndex].x
					local newCamy = Config.Locations[currentCameraIndex].policeCameras[newCamIndex].y
					local newCamz = Config.Locations[currentCameraIndex].policeCameras[newCamIndex].z
					local newCamr = Config.Locations[currentCameraIndex].policeCameras[newCamIndex].r

					SetFocusArea(newCamx, newCamy, newCamz, newCamx, newCamy, newCamz)
					SendNUIMessage({
						type = "updatecam",
						label = Config.Locations[currentCameraIndex].policeCameras[newCamIndex].label
					})

					ChangeSecurityCamera(newCamx, newCamy, newCamz, newCamr)
					currentCameraIndexIndex = newCamIndex
				elseif bmcamera then
					local newCamIndex

					if currentCameraIndexIndex == 1 then
						newCamIndex = #Config.Locations[currentCameraIndex].bmCameras
					else
						newCamIndex = currentCameraIndexIndex - 1
					end

					local newCamx = Config.Locations[currentCameraIndex].bmCameras[newCamIndex].x
					local newCamy = Config.Locations[currentCameraIndex].bmCameras[newCamIndex].y
					local newCamz = Config.Locations[currentCameraIndex].bmCameras[newCamIndex].z
					local newCamr = Config.Locations[currentCameraIndex].bmCameras[newCamIndex].r

					SetFocusArea(newCamx, newCamy, newCamz, newCamx, newCamy, newCamz)
					SendNUIMessage({
						type = "updatecam",
						label = Config.Locations[currentCameraIndex].bmCameras[newCamIndex].label
					})

					ChangeSecurityCamera(newCamx, newCamy, newCamz, newCamr)
					currentCameraIndexIndex = newCamIndex
				elseif hospcamera then
					local newCamIndex

					if currentCameraIndexIndex == 1 then
						newCamIndex = #Config.Locations[currentCameraIndex].hospCameras
					else
						newCamIndex = currentCameraIndexIndex - 1
					end

					local newCamx = Config.Locations[currentCameraIndex].hospCameras[newCamIndex].x
					local newCamy = Config.Locations[currentCameraIndex].hospCameras[newCamIndex].y
					local newCamz = Config.Locations[currentCameraIndex].hospCameras[newCamIndex].z
					local newCamr = Config.Locations[currentCameraIndex].hospCameras[newCamIndex].r

					SetFocusArea(newCamx, newCamy, newCamz, newCamx, newCamy, newCamz)
					SendNUIMessage({
						type = "updatecam",
						label = Config.Locations[currentCameraIndex].hospCameras[newCamIndex].label
					})

					ChangeSecurityCamera(newCamx, newCamy, newCamz, newCamr)
					currentCameraIndexIndex = newCamIndex
				end
			end

			-- GO FORWARD CAMERA
			if IsControlJustPressed(0, 175) then
				if bankcamera then
					local newCamIndex

					if currentCameraIndexIndex == #Config.Locations[currentCameraIndex].bankCameras then
						newCamIndex = 1
					else
						newCamIndex = currentCameraIndexIndex + 1
					end

					local newCamx = Config.Locations[currentCameraIndex].bankCameras[newCamIndex].x
					local newCamy = Config.Locations[currentCameraIndex].bankCameras[newCamIndex].y
					local newCamz = Config.Locations[currentCameraIndex].bankCameras[newCamIndex].z
					local newCamr = Config.Locations[currentCameraIndex].bankCameras[newCamIndex].r

					SendNUIMessage({
						type = "updatecam",
						label = Config.Locations[currentCameraIndex].bankCameras[newCamIndex].label
					})

					ChangeSecurityCamera(newCamx, newCamy, newCamz, newCamr)
					currentCameraIndexIndex = newCamIndex
				elseif policecamera then
					local newCamIndex

					if currentCameraIndexIndex == #Config.Locations[currentCameraIndex].policeCameras then
						newCamIndex = 1
					else
						newCamIndex = currentCameraIndexIndex + 1
					end

					local newCamx = Config.Locations[currentCameraIndex].policeCameras[newCamIndex].x
					local newCamy = Config.Locations[currentCameraIndex].policeCameras[newCamIndex].y
					local newCamz = Config.Locations[currentCameraIndex].policeCameras[newCamIndex].z
					local newCamr = Config.Locations[currentCameraIndex].policeCameras[newCamIndex].r

					SendNUIMessage({
						type = "updatecam",
						label = Config.Locations[currentCameraIndex].policeCameras[newCamIndex].label
					})

					ChangeSecurityCamera(newCamx, newCamy, newCamz, newCamr)
					currentCameraIndexIndex = newCamIndex
				elseif bmcamera then
					local newCamIndex

					if currentCameraIndexIndex == #Config.Locations[currentCameraIndex].bmCameras then
						newCamIndex = 1
					else
						newCamIndex = currentCameraIndexIndex + 1
					end

					local newCamx = Config.Locations[currentCameraIndex].bmCameras[newCamIndex].x
					local newCamy = Config.Locations[currentCameraIndex].bmCameras[newCamIndex].y
					local newCamz = Config.Locations[currentCameraIndex].bmCameras[newCamIndex].z
					local newCamr = Config.Locations[currentCameraIndex].bmCameras[newCamIndex].r

					SendNUIMessage({
						type = "updatecam",
						label = Config.Locations[currentCameraIndex].bmCameras[newCamIndex].label
					})

					ChangeSecurityCamera(newCamx, newCamy, newCamz, newCamr)
					currentCameraIndexIndex = newCamIndex
				elseif hospcamera then
					local newCamIndex

					if currentCameraIndexIndex == #Config.Locations[currentCameraIndex].hospCameras then
						newCamIndex = 1
					else
						newCamIndex = currentCameraIndexIndex + 1
					end

					local newCamx = Config.Locations[currentCameraIndex].hospCameras[newCamIndex].x
					local newCamy = Config.Locations[currentCameraIndex].hospCameras[newCamIndex].y
					local newCamz = Config.Locations[currentCameraIndex].hospCameras[newCamIndex].z
					local newCamr = Config.Locations[currentCameraIndex].hospCameras[newCamIndex].r

					SendNUIMessage({
						type = "updatecam",
						label = Config.Locations[currentCameraIndex].hospCameras[newCamIndex].label
					})

					ChangeSecurityCamera(newCamx, newCamy, newCamz, newCamr)
					currentCameraIndexIndex = newCamIndex
				
				end
			end

			if Config.Locations[currentCameraIndex].bankCameras[currentCameraIndexIndex].canRotate then
				local getCameraRot = GetCamRot(createdCamera, 2)

				-- sol
				if IsControlPressed(1, 108) then
					SetCamRot(createdCamera, getCameraRot.x, 0.0, getCameraRot.z + 0.7, 2)
				end

				-- sağ
				if IsControlPressed(1, 107) then
					SetCamRot(createdCamera, getCameraRot.x, 0.0, getCameraRot.z - 0.7, 2)
				end

				--aşağı
				if IsControlPressed(1, 60) then
					SetCamRot(createdCamera, getCameraRot.x - 0.7, 0.0, getCameraRot.z, 2)
				end

				--yukarı
				if IsControlPressed(1, 61) then
					SetCamRot(createdCamera, getCameraRot.x + 0.7, 0.0, getCameraRot.z, 2)
				end
			elseif Config.Locations[currentCameraIndex].policeCameras[currentCameraIndexIndex].canRotate then
				local getCameraRot = GetCamRot(createdCamera, 2)

				-- sol
				if IsControlPressed(1, 108) then
					SetCamRot(createdCamera, getCameraRot.x, 0.0, getCameraRot.z + 0.7, 2)
				end

				-- sağ
				if IsControlPressed(1, 107) then
					SetCamRot(createdCamera, getCameraRot.x, 0.0, getCameraRot.z - 0.7, 2)
				end

				
				--aşağı
				if IsControlPressed(1, 60) then
					SetCamRot(createdCamera, getCameraRot.x - 0.7, 0.0, getCameraRot.z, 2)
				end

				--yukarı
				if IsControlPressed(1, 61) then
					SetCamRot(createdCamera, getCameraRot.x + 0.7, 0.0, getCameraRot.z, 2)
				end
			elseif Config.Locations[currentCameraIndex].hospCameras[currentCameraIndexIndex].canRotate then
				local getCameraRot = getCamRot(createdCamera, 2)

				-- sol
				if IsControlPressed(1, 108) then
					SetCamRot(createdCamera, getCameraRot.x, 0.0, getCameraRot.z + 0.7, 2)
				end

				-- sağ
				if IsControlPressed(1, 107) then
					SetCamRot(createdCamera, getCameraRot.x, 0.0, getCameraRot.z - 0.7, 2)
				end

				--aşağı
				if IsControlPressed(1, 60) then
					SetCamRot(createdCamera, getCameraRot.x - 0.7, 0.0, getCameraRot.z, 2)
				end

				--yukarı
				if IsControlPressed(1, 61) then
					SetCamRot(createdCamera, getCameraRot.x + 0.7, 0.0, getCameraRot.z, 2)
				end
			elseif Config.Locations[currentCameraIndex].bmCameras[currentCameraIndexIndex].canRotate then
				local getCameraRot = getCamRot(createdCamera, 2)

				-- sol
				if IsControlPressed(1, 108) then
					SetCamRot(createdCamera, getCameraRot.x, 0.0, getCameraRot.z + 0.7, 2)
				end

				-- sağ
				if IsControlPressed(1, 107) then
					SetCamRot(createdCamera, getCameraRot.x, 0.0, getCameraRot.z - 0.7, 2)
				end

				--aşağı
				if IsControlPressed(1, 60) then
					SetCamRot(createdCamera, getCameraRot.x - 0.7, 0.0, getCameraRot.z, 2)
				end

				--yukarı
				if IsControlPressed(1, 61) then
					SetCamRot(createdCamera, getCameraRot.x + 0.7, 0.0, getCameraRot.z, 2)
				end
			end
		end
	end
end)

function ChangeSecurityCamera(x, y, z, r)
	if createdCamera ~= 0 then
		DestroyCam(createdCamera, 0)
		createdCamera = 0
	end

	local cam = CreateCam("DEFAULT_SCRIPTED_CAMERA", 1)
	SetCamCoord(cam, x, y, z)
	SetCamRot(cam, r.x, r.y, r.z, 2)
	RenderScriptCams(1, 0, 0, 1, 1)

	createdCamera = cam
end

function CloseSecurityCamera()
	DestroyCam(createdCamera, 0)
	RenderScriptCams(0, 0, 1, 1, 1)
	createdCamera = 0
	ClearTimecycleModifier("scanline_cam_cheap")
	SetFocusEntity(GetPlayerPed(PlayerId()))
end

RegisterNetEvent('esx_securitycam:freeze')
AddEventHandler('esx_securitycam:freeze', function(freeze)
	FreezeEntityPosition(PlayerPedId(), freeze)
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1500)
		if blockbuttons then
			DisableControlAction(2, 24, true)
			DisableControlAction(2, 257, true)
			DisableControlAction(2, 25, true)
			DisableControlAction(2, 263, true)
			DisableControlAction(2, 45, true)
			DisableControlAction(2, 22, true)
			DisableControlAction(2, 44, true)
			DisableControlAction(2, 37, true)
			DisableControlAction(2, 23, true)
			DisableControlAction(2, 288, true)
			DisableControlAction(2, 289, true)
			DisableControlAction(2, 170, true)
			DisableControlAction(2, 167, true)
			DisableControlAction(2, 168, true)
			DisableControlAction(2, 57, true)
		else
			Citizen.Wait(2500)
		end
	end
end)

RegisterCommand("cctv", function(source, args, rawCommand)
		if not menuopen then
		local dict = "amb@world_human_seat_wall_tablet@female@base"
        RequestAnimDict(dict)
        if tabletObject == nil then
            tabletObject = CreateObject(GetHashKey('prop_cs_tablet'), GetEntityCoords(playerPed), 1, 1, 1)
            AttachEntityToEntity(tabletObject, playerPed, GetPedBoneIndex(playerPed, 28422), 0.0, 0.0, 0.03, 0.0, 0.0, 0.0, 1, 1, 0, 1, 0, 1)
        end
		CurrentAction, menuopen = nil, true

		local elements = {
			{label = _U('bank_menu_selection'),   value = 'bankmenu'},
			{label = _U('police_menu_selection'), value = 'policemenu'},
			{label = _U('bankmotel_menu_selection'), value = 'mbankmenu'},
			{label = _U('hosp_menu_selection'), value = 'hospmenu'}
		}

		ESX.UI.Menu.CloseAll()

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'cloakroom',
		{
			title    = _U('securitycams_menu'),
			align    = 'top-left',
			elements = elements
		}, function(data, menu)

			if data.current.value == 'bankmenu' then
				inCam = true

					menu.close()
					bankcamera = true
					blockbuttons = true
					local firstCamx = Config.Locations[1].bankCameras[1].x
					local firstCamy = Config.Locations[1].bankCameras[1].y
					local firstCamz = Config.Locations[1].bankCameras[1].z
					local firstCamr = Config.Locations[1].bankCameras[1].r
					SetFocusArea(firstCamx, firstCamy, firstCamz, firstCamx, firstCamy, firstCamz)
					ChangeSecurityCamera(firstCamx, firstCamy, firstCamz, firstCamr)
					SendNUIMessage({
						type = "enablecam",
						label = Config.Locations[1].bankCameras[1].label,
						box = Config.Locations[1].bankCamLabel.label
					})
					currentCameraIndex = 1
					currentCameraIndexIndex = 1
					menuopen = false
					TriggerEvent('esx_securitycam:freeze', true)
					SetTimecycleModifierStrength(1.0)
					local scaleform = RequestScaleformMovie("TRAFFIC_CAM")
					while not HasScaleformMovieLoaded(scaleform) do
						Citizen.Wait(900)
					end
					PushScaleformMovieFunction(scaleform, "PLAY_CAM_MOVIE")
					SetFocusArea(x, y, z, 0.0, 0.0, 0.0)
					PopScaleformMovieFunctionVoid()
					while inCam do
						PopScaleformMovieFunctionVoid()
						DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 255)
						Citizen.Wait(1)
					end

			elseif data.current.value == 'policemenu' then
				inCam = true

					menu.close()
					policecamera = true
					blockbuttons = true
					local firstCamx = Config.Locations[1].policeCameras[1].x
					local firstCamy = Config.Locations[1].policeCameras[1].y
					local firstCamz = Config.Locations[1].policeCameras[1].z
					local firstCamr = Config.Locations[1].policeCameras[1].r

					SetFocusArea(firstCamx, firstCamy, firstCamz, firstCamx, firstCamy, firstCamz)
					ChangeSecurityCamera(firstCamx, firstCamy, firstCamz, firstCamr)

					SendNUIMessage({
						type  = "enablecam",
						label = Config.Locations[1].policeCameras[1].label,
						box   = Config.Locations[1].policeCamLabel.label
					})

					currentCameraIndex = 1
					currentCameraIndexIndex = 1
					menuopen = false
					TriggerEvent('esx_securitycam:freeze', true)


					SetTimecycleModifierStrength(1.0)
					local scaleform = RequestScaleformMovie("TRAFFIC_CAM")
					while not HasScaleformMovieLoaded(scaleform) do
						Citizen.Wait(900)
					end
				
					PushScaleformMovieFunction(scaleform, "PLAY_CAM_MOVIE")
					SetFocusArea(x, y, z, 0.0, 0.0, 0.0)
					PopScaleformMovieFunctionVoid()
				
					while inCam do
						PopScaleformMovieFunctionVoid()
						DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 255)
						Citizen.Wait(1)
					end

			elseif data.current.value == 'mbankmenu' then
				inCam = true
				 
					menu.close()
					bmcamera = true
					blockbuttons = true
					local firstCamx = Config.Locations[1].bmCameras[1].x
					local firstCamy = Config.Locations[1].bmCameras[1].y
					local firstCamz = Config.Locations[1].bmCameras[1].z
					local firstCamr = Config.Locations[1].bmCameras[1].r

					SetFocusArea(firstCamx, firstCamy, firstCamz, firstCamx, firstCamy, firstCamz)
					ChangeSecurityCamera(firstCamx, firstCamy, firstCamz, firstCamr)


					SendNUIMessage({
						type  = "enablecam",
						label = Config.Locations[1].bmCameras[1].label,
						box   = Config.Locations[1].bmCamLabel.label
					})

					currentCameraIndex = 1
					currentCameraIndexIndex = 1
					menuopen = false
					TriggerEvent('esx_securitycam:freeze', true)


					SetTimecycleModifierStrength(1.0)
					local scaleform = RequestScaleformMovie("TRAFFIC_CAM")
					while not HasScaleformMovieLoaded(scaleform) do
						Citizen.Wait(900)
					end
				
					PushScaleformMovieFunction(scaleform, "PLAY_CAM_MOVIE")
					SetFocusArea(x, y, z, 0.0, 0.0, 0.0)
					PopScaleformMovieFunctionVoid()
				
					while inCam do
						PopScaleformMovieFunctionVoid()
						DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 255)
						Citizen.Wait(1)
					end

			elseif data.current.value == 'hospmenu' then
				inCam = true

				SetTimecycleModifier("heliGunCam")
				SetTimecycleModifierStrength(1.0)
				local scaleform = RequestScaleformMovie("TRAFFIC_CAM")
				while not HasScaleformMovieLoaded(scaleform) do
					Citizen.Wait(900)
				end

				PushScaleformMovieFunction(scaleform, "PLAY_CAM_MOVIE")
				SetFocusArea(x, y, z, 0.0, 0.0, 0.0)
				PopScaleformMovieFunctionVoid()

				menu.close()
				hospcamera = true
				blockbuttons = true
				local firstCamx = Config.Locations[1].hospCameras[1].x
				local firstCamy = Config.Locations[1].hospCameras[1].y
				local firstCamz = Config.Locations[1].hospCameras[1].z
				local firstCamr = Config.Locations[1].hospCameras[1].r

				SetFocusArea(firstCamx, firstCamy, firstCamz, firstCamx, firstCamy, firstCamz)
				ChangeSecurityCamera(firstCamx, firstCamy, firstCamz, firstCamr)


				SendNUIMessage({
					type  = "enablecam",
					label = Config.Locations[1].hospCameras[1].label,
					box   = Config.Locations[1].hospCamLabel.label
				 })

				currentCameraIndex = 1
				currentCameraIndexIndex = 1
				menuopen = false
				TriggerEvent('esx_securitycam:freeze', true)


				SetTimecycleModifierStrength(1.0)
				local scaleform = RequestScaleformMovie("TRAFFIC_CAM")
				while not HasScaleformMovieLoaded(scaleform) do
					Citizen.Wait(900)
				end
			
				PushScaleformMovieFunction(scaleform, "PLAY_CAM_MOVIE")
				SetFocusArea(x, y, z, 0.0, 0.0, 0.0)
				PopScaleformMovieFunctionVoid()
			
				while inCam do
					PopScaleformMovieFunctionVoid()
					DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 255)
					Citizen.Wait(1)
				end
			end

		end, function(data, menu)
			menu.close()
			menuopen = false
		end)
   
	end
end)

---------------------------TEAMDEMO--------------------------