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
	addHaxeLibrary('Capabilities', 'openfl.system')
	makeAnimatedLuaSprite('Bkg', 'bkg', -220 ,-60)
	addLuaSprite('Bkg')
	scaleObject('Bkg', 1.45, 1.45)
	addAnimationByPrefix('Bkg', 'sus', 'amogus', 24, false)
	makeAnimatedLuaSprite('nusy', 'Funnus', -220 ,-60)
	addLuaSprite('nusy')
	scaleObject('nusy', 1.45, 1.45)
	setObjectOrder('nusy', 10)
	addAnimationByPrefix('nusy', 'sus', 'amogus', 24, false)
	makeAnimatedLuaSprite('Furry', 'Frey', -800 ,50)
	addLuaSprite('Furry')
	setObjectCamera('Furry', 'game')
	addAnimationByPrefix('Furry', 'idle', 'Frey Idle', 24, false)
	addAnimationByPrefix('Furry', 'left', 'Frey Left', 24, false)
	addAnimationByPrefix('Furry', 'down', 'Frey Down', 24, false)
	addAnimationByPrefix('Furry', 'up', 'Frey Up', 24, false)
	addAnimationByPrefix('Furry', 'right', 'Frey Right', 24, false)
	scaleObject('Furry', 0.8, 0.8)
	setObjectOrder('Furry', 9)
end
function onStepHit()
	if (curStep % 8) == 0 then
		objectPlayAnimation('Furry', 'idle', false)
		objectPlayAnimation('nusy', 'sus', true)
	end
	if curStep <= 368 then
	if curStep % 16 == 0 then
		objectPlayAnimation('Bkg', 'sus', true)
		doTweenAlpha('usy', 'nusy', 0.75, 0.75, 'sineInOut')
	end
	elseif curStep <= 384 then
		doTweenAlpha('usuidhfsy', 'nusy', 0, 0.75, 'sineInOut')
	if curStep % 2 == 0 then
		objectPlayAnimation('Bkg', 'sus', true)
	end
	else
	if curStep % 4 == 0 then
		objectPlayAnimation('Bkg', 'sus', true)
	end	
	end
end
function onUpdate()
if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.SEVEN') then

     loadSong('Furry-Frey-Busts-a-Nut');

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
	end
	    if getProperty('health') > 0.01 then

	       setProperty('health', health-0.0075);

	    end
end
function onTweenCompleted(tag)
	if tag == 'usy' then
		doTweenAlpha('susy', 'nusy', 1, 0.5, 'sineInOut')
	end
end