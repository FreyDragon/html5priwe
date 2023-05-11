function onCreate()
	addHaxeLibrary('Capabilities', 'openfl.system')
	makeLuaSprite('Bkg', 'bkg', -120 ,-60)
	addLuaSprite('Bkg')
	scaleObject('Bkg', 1.2, 1.2)
	makeAnimatedLuaSprite('Furrygang', 'Furrygang', 100 ,350)
	addLuaSprite('Furrygang')
	setObjectCamera('Furrygang', 'game')
	setScrollFactor('Furrygang', 1.5, 1.15)
	addAnimationByPrefix('Furrygang', 'idle', 'Furrygang Bop', 24, false)
	setObjectOrder('Furrygang', 10)
	scaleObject('Furrygang', 1, 1.75)
	makeAnimatedLuaSprite('Furry', 'Frey', 100 ,100)
	addLuaSprite('Furry')
	setObjectCamera('Furry', 'game')
	addAnimationByPrefix('Furry', 'idle', 'Frey Idle', 24, false)
	addAnimationByPrefix('Furry', 'left', 'Frey Left', 24, false)
	addAnimationByPrefix('Furry', 'down', 'Frey Down', 24, false)
	addAnimationByPrefix('Furry', 'up', 'Frey Up', 24, false)
	addAnimationByPrefix('Furry', 'right', 'Frey Right', 24, false)
	scaleObject('Furry', 0.65, 0.65)
	setObjectOrder('Furry', 7)
	makeAnimatedLuaSprite('Furry2', 'Fred', 0 ,50)
	addLuaSprite('Furry2')
	setObjectCamera('Furry2', 'game')
	addAnimationByPrefix('Furry2', 'idle', 'Frey Idle', 24, false)
	addAnimationByPrefix('Furry2', 'left', 'Frey Left', 24, false)
	addAnimationByPrefix('Furry2', 'down', 'Frey Down', 24, false)
	addAnimationByPrefix('Furry2', 'up', 'Frey Up', 24, false)
	addAnimationByPrefix('Furry2', 'right', 'Frey Right', 24, false)
	scaleObject('Furry2', 0.7, 0.7)
	setObjectOrder('Furry2', 8)
	setPropertyFromClass('openfl.Lib', 'application.window.fullscreen', true)
	funnux = getPropertyFromClass('openfl.Lib', 'application.window.width')
	funnuy = getPropertyFromClass('openfl.Lib', 'application.window.height')
	setPropertyFromClass('openfl.Lib', 'application.window.fullscreen', false)
end
function onUpdate()
	local songPos = getPropertyFromClass('Conductor', 'songPosition') / 100 --How long it will take.
	local amogusx = getPropertyFromClass('openfl.Lib', 'application.window.x')
	local amogusy = getPropertyFromClass('openfl.Lib', 'application.window.y')

	if curStep >= 128 and curStep <= 144 then
		setPropertyFromClass('openfl.Lib', 'application.window.y', (amogusy + math.cos(songPos / 2)))
		setPropertyFromClass('openfl.Lib', 'application.window.y', (amogusy + 2))
	elseif curStep >= 144 and curStep <= 160 then
		setPropertyFromClass('openfl.Lib', 'application.window.x', ((funnux / 2 - 640) + (50 * math.cos(songPos / 2))))
		setPropertyFromClass('openfl.Lib', 'application.window.y', (amogusy - 2))
	elseif curStep >= 160 and curStep <= 192 then
		setPropertyFromClass('openfl.Lib', 'application.window.x', ((funnux / 2 - 640) + (150 * math.cos(songPos / 2))))
		setPropertyFromClass('openfl.Lib', 'application.window.y', ((funnuy / 2 - 360) + (150 * math.sin(songPos / 2))))
	elseif curStep >= 192 and curStep <= 224 then
		setPropertyFromClass('openfl.Lib', 'application.window.x', ((funnux / 2 - 640) + (250 * math.cos(songPos / 2))))
		setPropertyFromClass('openfl.Lib', 'application.window.y', (funnuy / 2 - 360))
	elseif curStep >= 224 and curStep <= 256 then
		setPropertyFromClass('openfl.Lib', 'application.window.y', ((funnuy / 2 - 360) + (250 * math.cos(songPos / 2))))
		setPropertyFromClass('openfl.Lib', 'application.window.x', (funnux / 2 - 640))
	elseif curStep >= 256 and curStep <= 288 then
		setPropertyFromClass('openfl.Lib', 'application.window.x', ((funnux / 2 - 640) + (150 * math.cos(songPos / 2))))
		setPropertyFromClass('openfl.Lib', 'application.window.y', ((funnuy / 2 - 360) + (150 * math.sin(songPos / 2))))
	elseif curStep >= 288 and curStep <= 304 then
		setPropertyFromClass('openfl.Lib', 'application.window.x', ((funnux / 2 - 640) + (150 * math.sin(songPos / 2))))
		setPropertyFromClass('openfl.Lib', 'application.window.y', ((funnuy / 2 - 360) + (150 * math.cos(songPos / 2))))
	elseif curStep >= 304 and curStep <= 320 then
		setPropertyFromClass('openfl.Lib', 'application.window.x', ((funnux / 2 - 640) + (150 * math.cos(songPos))))
		setPropertyFromClass('openfl.Lib', 'application.window.y', ((funnuy / 2 - 360) + (150 * math.sin(songPos))))
	elseif curStep >= 320 and curStep <= 384 then
		setPropertyFromClass('openfl.Lib', 'application.window.y', ((funnuy / 2 - 360) + (50 * math.sin(songPos))))
	elseif curStep >= 384 and curStep <= 416 then
		setPropertyFromClass('openfl.Lib', 'application.window.x', ((funnux / 2 - 640) + (25 * math.cos(songPos))))
		setPropertyFromClass('openfl.Lib', 'application.window.y', ((funnuy / 2 - 360) + (150 * math.sin(songPos / 2))))
	elseif curStep >= 416 and curStep <= 448 then
		setPropertyFromClass('openfl.Lib', 'application.window.x', ((funnux / 2 - 640) + (25 * math.sin(songPos))))
		setPropertyFromClass('openfl.Lib', 'application.window.y', ((funnuy / 2 - 360) + (150 * math.cos(songPos / 2))))
	elseif curStep >= 448 and curStep <= 480 then
		setPropertyFromClass('openfl.Lib', 'application.window.x', ((funnux / 2 - 640) + (150 * math.cos(songPos / 2))))
		setPropertyFromClass('openfl.Lib', 'application.window.y', ((funnuy / 2 - 360) + (25 * math.sin(songPos))))
	elseif curStep >= 480 and curStep <= 512 then	
		setPropertyFromClass('openfl.Lib', 'application.window.x', ((funnux / 2 - 640) + (150 * math.sin(songPos / 2))))
		setPropertyFromClass('openfl.Lib', 'application.window.y', ((funnuy / 2 - 360) + (25 * math.cos(songPos))))
	elseif curStep >= 512 and curStep <= 640 then
		setPropertyFromClass('openfl.Lib', 'application.window.x', ((funnux / 2 - 640) + (150 * math.cos(songPos / 2))))
	elseif curStep >= 640 and curStep <= 896 then	
		setPropertyFromClass('openfl.Lib', 'application.window.x', ((funnux / 2 - 640) + (300 * math.sin(songPos / 2))))
		setPropertyFromClass('openfl.Lib', 'application.window.y', ((funnuy / 2 - 360) + (10 * math.cos(songPos * 2))))
	elseif curStep >= 896 and curStep <= 1152 then	
		setPropertyFromClass('openfl.Lib', 'application.window.x', ((funnux / 2 - 640) + (300 * math.sin(songPos / 2))))
		setPropertyFromClass('openfl.Lib', 'application.window.y', ((funnuy / 2 - 360) + (10 * math.sin(songPos * 2))))
	elseif curStep >= 1152 and curStep <= 1160 then		
		setPropertyFromClass('openfl.Lib', 'application.window.y', (amogusy + 15))
	elseif curStep >= 1168 and curStep <= 1536 then
		setPropertyFromClass('openfl.Lib', 'application.window.x', ((funnux / 2 - 640) + (100 * math.cos(songPos / 2))))
		if amogusy < ((funnuy / 2) - 360) then		
			setPropertyFromClass('openfl.Lib', 'application.window.y', (amogusy + 1))
		end
	elseif curStep >= 1168 and curStep <= 2031 then
		setPropertyFromClass('openfl.Lib', 'application.window.x', ((funnux / 2 - 640) + (100 * math.cos(songPos / 2))))
		setPropertyFromClass('openfl.Lib', 'application.window.y', ((funnuy / 2 - 360) + (50 * math.sin(songPos))))
	elseif curStep >= 2176 and curStep <= 2304 then
		if curBeat % 4 == 0 then
			setPropertyFromClass('openfl.Lib', 'application.window.x', ((funnux / 2 - 640) + (100 * math.sin(songPos / 2))))
			setPropertyFromClass('openfl.Lib', 'application.window.y', ((funnuy / 2 - 360) + (25 * math.cos(songPos / 2))))
		elseif curBeat % 4 == 1 then
			setPropertyFromClass('openfl.Lib', 'application.window.x', ((funnux / 2 - 640) + (100 * math.cos(songPos / 2))))
			setPropertyFromClass('openfl.Lib', 'application.window.y', ((funnuy / 2 - 360) + (25 * math.sin(songPos / 2))))
		elseif curBeat % 4 == 2 then
			setPropertyFromClass('openfl.Lib', 'application.window.x', ((funnux / 2 - 640) + (150 * math.sin(songPos / 2))))
			setPropertyFromClass('openfl.Lib', 'application.window.y', ((funnuy / 2 - 360) + (50 * math.cos(songPos / 2))))
		elseif curBeat % 4 == 3 then
			setPropertyFromClass('openfl.Lib', 'application.window.x', ((funnux / 2 - 640) + (150 * math.cos(songPos / 2))))
			setPropertyFromClass('openfl.Lib', 'application.window.y', ((funnuy / 2 - 360) + (50 * math.sin(songPos / 2))))
		end
	elseif curStep >= 2432 and curStep <= 2688 then
		setProperty('camHUD.angle',(10 * math.cos(songPos / 2)))
		setPropertyFromClass('openfl.Lib', 'application.window.x', ((funnux / 2 - 640) + (150 * math.cos(songPos / 2))))
		setPropertyFromClass('openfl.Lib', 'application.window.y', ((funnuy / 2 - 360) + (150 * math.sin(songPos / 2))))
	elseif curStep >= 2688 and curStep <= 2944 then
		setPropertyFromClass('openfl.Lib', 'application.window.fullscreen', true)
		if curStep % 16 == 4 then
			setProperty('defaultCamZoom',1.5)
			setProperty('camHUD.angle',15)
		elseif curStep % 16 == 12 then
			setProperty('defaultCamZoom',1)	
			setProperty('camHUD.angle',-15)
		end
	elseif curStep >= 2944 then 
		setPropertyFromClass('openfl.Lib', 'application.window.fullscreen', false)
		setProperty('camHUD.alpha', 0)
	end
end
function onStepHit()
	if curStep == 2032 then
		setPropertyFromClass('openfl.Lib', 'application.window.x', ((funnux / 2 - 640) + 100))
		setPropertyFromClass('openfl.Lib', 'application.window.y', ((funnuy / 2 - 360)))
	elseif curStep == 2034 then
		setPropertyFromClass('openfl.Lib', 'application.window.x', ((funnux / 2 - 640) + 100))
		setPropertyFromClass('openfl.Lib', 'application.window.y', ((funnuy / 2 - 360) - 150))
	elseif curStep == 2035 then
		setPropertyFromClass('openfl.Lib', 'application.window.x', ((funnux / 2 - 640) + 250))
		setPropertyFromClass('openfl.Lib', 'application.window.y', ((funnuy / 2 - 360) - 200))
	elseif curStep == 2037 then
		setPropertyFromClass('openfl.Lib', 'application.window.x', ((funnux / 2 - 640) + 150))
		setPropertyFromClass('openfl.Lib', 'application.window.y', ((funnuy / 2 - 360) - 150))
	elseif curStep == 2041 then
		setPropertyFromClass('openfl.Lib', 'application.window.x', ((funnux / 2 - 640) + 50))
		setPropertyFromClass('openfl.Lib', 'application.window.y', ((funnuy / 2 - 360) - 100))
	elseif curStep == 2043 then
		setPropertyFromClass('openfl.Lib', 'application.window.x', ((funnux / 2 - 640) - 100))
		setPropertyFromClass('openfl.Lib', 'application.window.y', ((funnuy / 2 - 360) + 50))
	elseif curStep == 2044 then
		setPropertyFromClass('openfl.Lib', 'application.window.x', ((funnux / 2 - 640)))
		setPropertyFromClass('openfl.Lib', 'application.window.y', ((funnuy / 2 - 360)))
	end	
	if curStep > 2304 and curStep <= 2432 then
		if curBeat % 2 == 0 then
			setPropertyFromClass('openfl.Lib', 'application.window.x', ((funnux / 2 - 640) - 100))
			setPropertyFromClass('openfl.Lib', 'application.window.y', ((funnuy / 2 - 360) - 100))
			setProperty('camHUD.angle',15)
		elseif curBeat % 2 == 1 then
			setPropertyFromClass('openfl.Lib', 'application.window.x', ((funnux / 2 - 640) + 100))
			setPropertyFromClass('openfl.Lib', 'application.window.y', ((funnuy / 2 - 360) + 100))
			setProperty('camHUD.angle',-15)
		end
	end
	if curStep >= 2048 and curStep <= 2176 then
		setPropertyFromClass('openfl.Lib', 'application.window.fullscreen', true)
		if curStep % 16 == 4 then
			setProperty('defaultCamZoom',1.5)
			setProperty('camHUD.angle',15)
		elseif curStep % 16 == 12 then
			setProperty('defaultCamZoom',1)	
			setProperty('camHUD.angle',-15)
		end
	end
	if curStep == 2177 then
		setPropertyFromClass('openfl.Lib', 'application.window.fullscreen', false)
		setProperty('defaultCamZoom',1)
		setProperty('camHUD.angle',0)
	end
	if curStep == 1161 then
		setPropertyFromClass('openfl.Lib', 'application.window.y', ((funnuy / 2 - 360) - 4000))	
	end
	if curStep >= 320 and curStep <= 384 then
		if (curStep % 8) == 0 then
			setPropertyFromClass('openfl.Lib', 'application.window.x', ((funnux / 2 - 640) + 100))
		end
		if (curStep % 8) == 4 then
			setPropertyFromClass('openfl.Lib', 'application.window.x', ((funnux / 2 - 640) - 100))
		end
	end
	if curStep >= 512 and curStep <= 640 then
		if (curStep % 8) == 0 then
			setPropertyFromClass('openfl.Lib', 'application.window.y', ((funnuy / 2 - 360) + 100))
		end
		if (curStep % 8) == 4 then
			setPropertyFromClass('openfl.Lib', 'application.window.y', ((funnuy / 2 - 360) - 100))
		end
	end
	if curStep <= 64 then
		if (curStep % 8) == 0 then
			setPropertyFromClass('openfl.Lib', 'application.window.x', ((funnux / 2 - 640) + 40))
			setPropertyFromClass('openfl.Lib', 'application.window.y', (funnuy / 2 - 360))
		end
		if (curStep % 8) == 4 then
			setPropertyFromClass('openfl.Lib', 'application.window.x', (funnux / 2 - 640))
			setPropertyFromClass('openfl.Lib', 'application.window.y', (funnuy / 2 - 360))
		end
	end
	if curStep <= 128 and curStep >= 64 then
		if (curStep % 8) == 0 then
			setPropertyFromClass('openfl.Lib', 'application.window.x', ((funnux / 2 - 640) - 40))
			setPropertyFromClass('openfl.Lib', 'application.window.y', (funnuy / 2 - 360))
		end
		if (curStep % 8) == 4 then
			setPropertyFromClass('openfl.Lib', 'application.window.x', (funnux / 2 - 640))
			setPropertyFromClass('openfl.Lib', 'application.window.y', (funnuy / 2 - 360))
		end
	end
	if curStep <= 127 then
		if (curStep % 4) == 0 then
			objectPlayAnimation('Furrygang', 'idle', true)
		end
	else
		if (curStep % 8) == 0 then
			objectPlayAnimation('Furrygang', 'idle', true)
		end
	end
	if (curStep % 8) == 0 then
		objectPlayAnimation('Furry', 'idle', false)
		objectPlayAnimation('Furry2', 'idle', false)
	end
end
function opponentNoteHit(id, noteData, noteType, isSustainNote, direction)
	health = getProperty('health')
	if noteType == 'Hurt Note' then
     		if noteData == 0 then
			objectPlayAnimation('Furry', 'left', true)
		end
     		if noteData == 1 then
			objectPlayAnimation('Furry', 'down', true)
		end
     		if noteData == 2 then
			objectPlayAnimation('Furry', 'up', true)
		end
     		if noteData == 3 then
			objectPlayAnimation('Furry', 'right', true)
		end
	    	if getProperty('health') > 0.01 then

		       setProperty('health', health-0.0025);

	    end
	    if getProperty('health') > 0.1 then

	       setProperty('health', health-0.05);

	    end
	end
	if noteType == 'Furry Note' then
     		if noteData == 0 then
			objectPlayAnimation('Furry', 'left', true)
		end
     		if noteData == 1 then
			objectPlayAnimation('Furry', 'down', true)
		end
     		if noteData == 2 then
			objectPlayAnimation('Furry', 'up', true)
		end
     		if noteData == 3 then
			objectPlayAnimation('Furry', 'right', true)
		end
		    if getProperty('health') > 0.01 then
	
		       setProperty('health', health-0.0075);

		    end
	end
	if noteType == 'No Animation' then
     		if noteData == 0 then
			objectPlayAnimation('Furry2', 'left', true)
		end
     		if noteData == 1 then
			objectPlayAnimation('Furry2', 'down', true)
		end
     		if noteData == 2 then
			objectPlayAnimation('Furry2', 'up', true)
		end
     		if noteData == 3 then
			objectPlayAnimation('Furry2', 'right', true)
		end
		    if getProperty('health') > 0.01 then
	
		       setProperty('health', health-0.0045);

		    end
	end
	    if getProperty('health') > 0.01 then

	       setProperty('health', health-0.0075);

	    end
end