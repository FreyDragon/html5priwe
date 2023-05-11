attackBeat = 0
attacking = false
dodgingTime = false
attackDodged = false
attackSteps = 0
function onCreate()
	makeAnimatedLuaSprite('Furrey', 'wraithAttack', -200, 820)
	addLuaSprite('Furrey')
	addAnimationByPrefix('Furrey', 'swing', 'SwingBack', 60, false)
	addAnimationByPrefix('Furrey', 'prep', 'Attack', 24, false)
	objectPlayAnimation('Furrey', 'prep', true)
	scaleObject('Furrey',0.3, 0.3)
	doTweenY('bye3093', 'Furrey', 250, 0.005, sineOut)
	doTweenX('bye302093', 'Furrey', 450, 0.005, sineOut)
	setObjectOrder('Furrey', 10)
			doTweenAlpha('bye3302', 'Furrey', 0, 0.125, sineIn)
end
function onEvent(name, value1, value2)
	if name == 'attack' then
		doTweenAlpha('bye3302', 'Furrey', 0.5, 0.125, sineIn)
		attackBeat = 2
		dodgingTime = false
		attacking = true
		attackDodged = false
		playSound('warn', 1, 'attack')
		attackSteps = 7
		objectPlayAnimation('Furrey', 'prep', true)
	end
end 
function onBeatHit()
	botplayVar = getProperty('cpuControlled')
	if attackBeat >= 0 then
		attackBeat = attackBeat - 1
	end
	if attackBeat == 1 then
		runTimer('attackTimer', 0.5)
		doTweenAlpha('bye3302', 'Furrey', 0.5, 0.125, sineIn)
	end
	if attackBeat == 0 then
		if botplayVar == true then
			objectPlayAnimation('boyfriend', 'dodge', true)
		end
		objectPlayAnimation('Furrey', 'swing', true)
			doTweenAlpha('bye33a02', 'Furrey', 0, 0.25, sineIn)
		playSound('attack', 1, 'attack')
	end

end
function onTimerCompleted(tag, loops, loopsLeft)
	botplayVar = getProperty('cpuControlled')
	if tag == 'attackTimer' then
		if not botplayVar == true then
			if not attackDodged == true then
				setProperty('health', -1)
			end
		end
		dodgingTime = false
		attackDodged = false
	end
end
function onUpdate()
	botplayVar = getProperty('cpuControlled')
	if not botplayVar == true then
		if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.SPACE') then
			if attackBeat <= 1 then
				attackDodged = true
			end
			objectPlayAnimation('boyfriend', 'dodge', true)
		end
	end
end