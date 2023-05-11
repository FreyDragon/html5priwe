attackBeat = 0
attacking = false
dodgingTime = false
attackDodged = false
attackSteps = 0
function onCreate()
		doTweenX('dauhuihddiadda', 'dad', 400, 0.01, sineOut)
		doTweenY('dauhusudihddiadda', 'dad', 750, 0.01, sineOut)
	
end
function onEvent(name, value1, value2)
	if name == 'attackSALEM' then
		attackBeat = 2
		dodgingTime = false
		attacking = true
		attackDodged = false
		playSound('warn', 1, 'attack')
		attackSteps = 7
	end
end 
function onBeatHit()
	dadx = getProperty('dad.X')
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
		doTweenX('dadda', 'dad', 305, 0.01, sineOut)
		doTweenY('dauhusudihddiadda', 'dad', 745, 0.01, sineOut)
		objectPlayAnimation('dad', 'Shoot', true)
		runTimer('dadReturn', 0.25)
		playSound('shoot', 1, 'shoot')
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
	elseif tag == 'dadReturn' then
		objectPlayAnimation('dad', 'idle', true)
		doTweenX('dauhdiadda', 'dad', 400, 0.01, sineOut)
		doTweenY('dauhusudihddiadda', 'dad', 750, 0.01, sineOut)
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