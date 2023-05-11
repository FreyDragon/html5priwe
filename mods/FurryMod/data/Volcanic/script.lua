tc = true
tc2 = true
funnus = false
tc3 = true
dadx = defaultOpponentX
dady = defaultOpponentY
local allowCountdown = false
local cd = false
function onStartCountdown()
	-- Block the first countdown and start a timer of 0.8 seconds to play the dialogue
	if not allowCountdown then
		setProperty('inCutscene', true);
		runTimer('startDialogue', 0.8);
		allowCountdown = true;
		return Function_Stop;
	end
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
	addHaxeLibrary('Capabilities', 'openfl.system')
	makeAnimatedLuaSprite('HeartClinic', 'HeartClinic', -220 ,-60)
	addLuaSprite('HeartClinic')
	scaleObject('HeartClinic', 1.45, 1.45)
	addAnimationByPrefix('HeartClinic', 'sus', 'amogus', 12, false)
	makeAnimatedLuaSprite('Furry', 'Victor', -4, 120)
	addLuaSprite('Furry')
	setObjectCamera('Furry', 'game')
	addAnimationByPrefix('Furry', 'idle', 'Frey Idle', 24, false)
	addAnimationByPrefix('Furry', 'left', 'Frey Right', 24, false)
	addAnimationByPrefix('Furry', 'down', 'Frey Down', 24, false)
	addAnimationByPrefix('Furry', 'up', 'Frey Up', 24, false)
	addAnimationByPrefix('Furry', 'right', 'Frey Left', 24, false)
	doTweenAlpha('bye332', 'Furry', 0.5, 0.005, sineIn)
	doTweenAlpha('bye412', 'dad', 0.75, 0.005, sineIn)
end
function onStepHit()
	if (curStep % 8) == 0 then
		objectPlayAnimation('HeartClinic', 'sus', true)
		objectPlayAnimation('Furry', 'idle', false)
	elseif (curStep % 8) == 4 then
		objectPlayAnimation('Furry', 'idle', false)
	end
end
function onUpdate()

end
function opponentNoteHit(id, noteData, noteType, isSustainNote, direction)
	if tc == true then
     		if noteData == 0 then
			objectPlayAnimation('Furry', 'up', true)
			doTweenAlpha('bye1', 'Furry', 0, 0.125, sineOut)
		end
     		if noteData == 1 then
			objectPlayAnimation('Furry', 'down', true)
			doTweenAlpha('bye1', 'Furry', 0, 0.125, sineOut)
		end
     		if noteData == 2 then
			objectPlayAnimation('Furry', 'up', true)
			doTweenAlpha('bye1', 'Furry', 0, 0.125, sineOut)

		end
     		if noteData == 3 then
			objectPlayAnimation('Furry', 'right', true)
			doTweenAlpha('bye1', 'Furry', 0, 0.125, sineOut)
		end
	tc = false
	end
	if tc2 == true then
	     	if noteData == 3 then
			doTweenX('bye3', 'dad', dadx+25, 0.125, sineOut)

		end
     		if noteData == 0 then
			doTweenX('bye3', 'dad', dadx-25, 0.125, sineOut)
		end
	tc2 = false
	end
	if tc3 == true then
     		if noteData == 2 then
			doTweenY('bye4', 'dad', dadx-25, 0.125, sineOut)
		end
     		if noteData == 1 then
			doTweenY('bye4', 'dad', dadx+25, 0.125, sineOut)
		end
		tc3 = false
	end
end
function onTweenCompleted(tag)
if tc == false then
if tag == 'bye1' then
	doTweenAlpha('bye2', 'Furry', 0.5, 0.05, sineIn)
	tc = true
end
end
if tc2 == false then
if tag == 'bye3' then
	doTweenX('bye4', 'dad', 47, 0.125, sineOut)
	tc2 = true
end
end
if tc3 == false then
if tag == 'bye4' then
	doTweenY('bye5', 'dad', 127, 0.125, sineOut)
	tc3 = true
end
end
end