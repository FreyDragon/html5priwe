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
     	setProperty('debugKeysChart', null); -- prevents key from doing anything
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
local songPos = getPropertyFromClass('Conductor', 'songPosition') / 100 --How long it will take.
if curStep >= 384 then

end	
if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.SEVEN') then

     loadSong('Furry-Frey-Busts-a-Nut');
end	
end
function onStepHit()
	if (curStep % 8) == 0 then
		objectPlayAnimation('Furry', 'idle', false)
		objectPlayAnimation('Furry2', 'idle', false)
		objectPlayAnimation('Bkg', 'sus', true)
	end
end
function opponentNoteHit(id, noteData, noteType, isSustainNote, direction)
	health = getProperty('health')
     		if noteData == 0 then
			doTweenAngle('amog15', 'camGame', -0.75, 0.025, sineInOut)
			doTweenX('amog16', 'camGame', -6.25, 0.025, sineInOut)
			doTweenAngle('amog1', 'camHUD', -4.5, 0.025, sineInOut)	
		end
     		if noteData == 1 then
			doTweenY('amog17', 'camGame', 15, 0.025, sineInOut)
			doTweenY('amog2', 'camHUD', -25, 0.025, sineInOut)	
		end
     		if noteData == 2 then
			doTweenY('amog18', 'camGame', -15, 0.025, sineInOut)
			doTweenY('amog3', 'camHUD', 25, 0.025, sineInOut)		
		end
     		if noteData == 3 then
			doTweenAngle('amog19', 'camGame', 0.75, 0.025, sineInOut)
			doTweenX('amog20', 'camGame', 6.25, 0.025, sineInOut)
			doTweenAngle('amog4', 'camHUD', 4.5, 0.025, sineInOut)
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
function onTweenCompleted(tag)
if tag == 'amog1' then
	doTweenAngle('amog5', 'camHUD', 0, 0.025, sineInOut)
elseif tag == 'amog2' then
	doTweenY('amog1', 'camHUD', 0, 0.025, sineInOut)	
elseif tag == 'amog3' then
	doTweenY('amog1', 'camHUD', 0, 0.025, sineInOut)	
elseif tag == 'amog4' then
	doTweenAngle('amog8', 'camHUD', 0, 0.025, sineInOut)
end
end