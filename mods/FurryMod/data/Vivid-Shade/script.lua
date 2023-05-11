local allowCountdown = false
function onStartCountdown()
	-- Block the first countdown and start a timer of 0.8 seconds to play the dialogue
	if not allowCountdown then
		setProperty('inCutscene', true);
		runTimer('startDialogue', 0.8);
		allowCountdown = true;
		return Function_Stop;
	end
	setObjectCamera('nusy', 'other')
	return Function_Continue;
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'startDialogue' then -- Timer completed, play dialogue
		startDialogue('dialogue', 'freakymenu');
	end
end

-- Dialogue (When a dialogue is finished, it calls startCountdown again)
function onNextDialogue(count)
	-- triggered when the next dialogue line starts, 'line' starts with 1
end

function onSkipDialogue(count)
	-- triggered when you press Enter and skip a dialogue line that was still being typed, dialogue line starts with 1
end
function onCreate()
	allowCD = false
	makeAnimatedLuaSprite('Bkg', 'bkg', -220 ,-60)
	addLuaSprite('Bkg')
	scaleObject('Bkg', 1.45, 1.45)
	addAnimationByPrefix('Bkg', 'sus', 'amogus', 12, false)
	makeLuaSprite('Furrygang2', 'Furrygang', 100 ,350)
	addLuaSprite('Furrygang2')
	setObjectCamera('Furrygang2', 'game')
	setScrollFactor('Furrygang2', 1.5, 1.15)
	setObjectOrder('Furrygang2', 9)
	scaleObject('Furrygang2', 1, 1.75)
	makeAnimatedLuaSprite('Furry', 'Frey', -800, 50)
	addLuaSprite('Furry')
	setObjectCamera('Furry', 'game')
	addAnimationByPrefix('Furry', 'idle', 'Frey Idle', 24, false)
	addAnimationByPrefix('Furry', 'left', 'Frey Left', 24, false)
	addAnimationByPrefix('Furry', 'down', 'Frey Down', 24, false)
	addAnimationByPrefix('Furry', 'up', 'Frey Up', 24, false)
	addAnimationByPrefix('Furry', 'right', 'Frey Right', 24, false)
	scaleObject('Furry', 0.85, 0.85)
	setObjectOrder('Furry', 10)
	makeAnimatedLuaSprite('Furry2', 'Fred', -500 ,5)
	addLuaSprite('Furry2')
	setObjectCamera('Furry2', 'game')
	addAnimationByPrefix('Furry2', 'idle', 'Frey Idle', 24, false)
	addAnimationByPrefix('Furry2', 'left', 'Frey Left', 24, false)
	addAnimationByPrefix('Furry2', 'down', 'Frey Down', 24, false)
	addAnimationByPrefix('Furry2', 'up', 'Frey Up', 24, false)
	addAnimationByPrefix('Furry2', 'right', 'Frey Right', 24, false)
	scaleObject('Furry2', 0.8, 0.8)
	setObjectOrder('Furry2', 9)
end
function onUpdate()

end
function onStepHit()
	if (curStep % 8) == 0 then
		objectPlayAnimation('Furry', 'idle', false)
		objectPlayAnimation('Furry2', 'idle', false)
		objectPlayAnimation('Bkg', 'sus', true)
		if getProperty('songMisses') >= 3 then
		       setProperty('health', -1024);
		end

			
	end
end
function onBeatHit()
	if curStep >= 1024 and curStep <= 1536 then
		triggerEvent('Add Camera Zoom', 0.03, 0.05)
	end
	if curBeat <= 60 then
		if (curBeat % 2) == 0 then
			triggerEvent('Add Camera Zoom', 0.03, 0.05)
		end
	end
	if curBeat >= 64 and curBeat <= 192 then
		triggerEvent('Add Camera Zoom', 0.03, 0.05)
	end
end
function opponentNoteHit(id, noteData, noteType, isSustainNote, direction)
	health = getProperty('health')
     		if noteData == 0 then
			doTweenAngle('amog15', 'camGame', -0.75, 0.025, sineInOut)
			doTweenX('amog16', 'camGame', -6.25, 0.025, sineInOut)
		end
     		if noteData == 1 then
			doTweenY('amog17', 'camGame', 15, 0.025, sineInOut)
		end
     		if noteData == 2 then
			doTweenY('amog18', 'camGame', -15, 0.025, sineInOut)
		end
     		if noteData == 3 then
			doTweenAngle('amog19', 'camGame', 0.75, 0.025, sineInOut)
			doTweenX('amog20', 'camGame', 6.25, 0.025, sineInOut)
		end
	if noteType == '' then	
     		if noteData == 0 then
			doTweenAngle('amog4', 'camHUD', -2.5, 0.025, sineInOut)
			doTweenX('amog5', 'camHUD', -12.5, 0.025, sineInOut)
		end
     		if noteData == 1 then
			doTweenY('amog6', 'camHUD', 15, 0.025, sineInOut)
		end
     		if noteData == 2 then
			doTweenY('amog7', 'camHUD', -15, 0.025, sineInOut)
		end
     		if noteData == 3 then
			doTweenAngle('amog8', 'camHUD', 2.5, 0.025, sineInOut)
			doTweenX('amog9', 'camHUD', 12.5, 0.025, sineInOut)
		end
	end
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
			doTweenAngle('amog4', 'camHUD', -5, 0.025, sineInOut)
			doTweenX('amog5', 'camHUD', -25, 0.025, sineInOut)
		end
     		if noteData == 1 then
			objectPlayAnimation('Furry', 'down', true)
			doTweenY('amog6', 'camHUD', 30, 0.025, sineInOut)
		end
     		if noteData == 2 then
			objectPlayAnimation('Furry', 'up', true)
			doTweenY('amog7', 'camHUD', -30, 0.025, sineInOut)
		end
     		if noteData == 3 then
			objectPlayAnimation('Furry', 'right', true)
			doTweenAngle('amog8', 'camHUD', 5, 0.025, sineInOut)
			doTweenX('amog9', 'camHUD', 25, 0.025, sineInOut)
		end
		    if getProperty('health') > 0.01 then
	
		       setProperty('health', health-0.0075);

		    end
	end
	if noteType == 'No Animation' then
     		if noteData == 0 then
			objectPlayAnimation('Furry2', 'left', true)
			doTweenAngle('amog4', 'camHUD', -10, 0.025, sineInOut)
			doTweenX('amog5', 'camHUD', -45, 0.025, sineInOut)
		end
     		if noteData == 1 then
			objectPlayAnimation('Furry2', 'down', true)
			doTweenY('amog6', 'camHUD', 50, 0.025, sineInOut)
		end
     		if noteData == 2 then
			objectPlayAnimation('Furry2', 'up', true)
			doTweenY('amog7', 'camHUD', -50, 0.025, sineInOut)
		end
     		if noteData == 3 then
			objectPlayAnimation('Furry2', 'right', true)
			doTweenAngle('amog8', 'camHUD', 10, 0.025, sineInOut)
			doTweenX('amog9', 'camHUD', 45, 0.025, sineInOut)
		end
		    if getProperty('health') > 0.01 then
	
		       setProperty('health', health-0.0045);

		    end
	end
	    if getProperty('health') > 0.01 then

	       setProperty('health', health-0.0075);

	    end
end
function onTweenCompleted(tag)
if tag == 'amog1' then
	doTweenX('amog2', 'camHUD', 25, 0.025, sineInOut)
elseif tag == 'amog2' then
	doTweenX('amog3', 'camHUD', 0, 0.0125, sineInOut)	
elseif tag == 'amog4' then
	doTweenAngle('amog10', 'camHUD', 0, 0.025, sineInOut)
	doTweenX('amog11', 'camHUD', 0, 0.025, sineInOut)
elseif tag == 'amog6' then
	doTweenY('amog12', 'camHUD', 0, 0.025, sineInOut)
elseif tag == 'amog7' then 
	doTweenY('amog13', 'camHUD', 0, 0.025, sineInOut)
elseif tag == 'amog8' then
	doTweenAngle('amog14', 'camHUD', 0, 0.025, sineInOut)
	doTweenX('amog15', 'camHUD', 0, 0.025, sineInOut)
end

end