
-- user@host
if context ~= nil then
	print(""
		..bold()
		..white()
		..context.user
		..magenta()
		.."@"
		..context.host
		..reset())
end

-- Distro
if distro ~= nil then
	print(""
    ..magentaBright()
		.."   "
		..bold()
		..blue()
		.."Distro"
		..reset()
		..": "
		..string.rep(" ", 16 - 12)
		..distro.shortname
		.." "
		..distro.architecture)
end

--[[ Host
if host ~= nil then
	print(""
		.." 󰇅  "
		..bold()
		..blue()
		.."Host"
		..reset()
		..": "
		..string.rep(" ", 16 - 10)
		..host.model)
end
]]--

-- Kernel
if kernel ~= nil then
	print(""
    ..magentaBright()
		.."   "
		..bold()
		..blue()
		.."Kernel"
		..reset()
		..": "
		..string.rep(" ", 16 - 12)
		..kernel.name
		.." "
		..kernel.version)
end

-- Uptime
if uptime ~= nil then
	local output = ""
	local function comma()
		if output ~= "" then output = output..", " end
	end
	local function s(v)
		if v ~= 1 and v ~= 0 then
			return "s"
		else
			return ""
		end
	end
	if uptime.days >= 1 then
		output = output..uptime.days.." day"..s(uptime.days)
	end
	if uptime.hours >= 1 then
		comma()
		output = output..uptime.hours.." hour"..s(uptime.hours)
	end
	if uptime.minutes >= 1 then
		comma()
		output = output..uptime.minutes.." minute"..s(uptime.minutes)
	elseif uptime.hours == 0 then
		comma()
		output = output..uptime.seconds.." second"..s(uptime.seconds)
	end
	
	print(""
    ..magentaBright()
		.." 祥 "
		..bold()
		..blue()
		.."Uptime"
		..reset()
		..": "
		..string.rep(" ", 16 - 12)
		..output)
end

-- Packages
if packageManagers ~= nil then
	local output = ""
	if #packageManagers ~= 0 then
		for i,packageManager in pairs(packageManagers) do
			if packageManager.packages == 0 then
				table.remove(packageManagers, i)
			end
		end
		for i,packageManager in pairs(packageManagers) do
			if i ~= #packageManagers then
				output = output
					..packageManager.packages
					.." ("
					..packageManager.name
					.."), "
			else
				output = output
					..packageManager.packages
					.." ("
					..packageManager.name
					..")"
			end
		end
	else
		output = "0"
	end
	print(""
    ..magentaBright()
		.."   "
		..bold()
		..blue()
		.."Packages"
		..reset()
		..": "
		..string.rep(" ", 16 - 14)
		..output)
end

-- Shell
if shell ~= nil then
	print(""
    ..magentaBright()
		.."   "
		..bold()
		..blue()
		.."Shell"
		..reset()
		..": "
		..string.rep(" ", 16 - 11)
		..shell.name
		.." "
		..shell.version)
end

-- Resolution
if resolution ~= nil then
	if resolution.refresh ~= nil then
		print(""
      ..magentaBright()
			.."   "
			..bold()
			..blue()
			.."Resolution"
			..reset()
			..": "
			..resolution.width
			.."x"
			..resolution.height
			.." @ "
			..string.format("%.2f", resolution.refresh))
	else
		print(""
      ..magentaBright()
			.."   "
			..bold()
			..blue()
			.."Resolution"
			..reset()
			..": "
			..resolution.width)
	end
end

-- DE
if de ~= nil then
	print(""
    ..magentaBright()
		.."   "
		..bold()
		..blue()
		.."DE"
		..reset()
		..": "
		..string.rep(" ", 16 - 8)
		..de.name
		.." "
		..de.version)
end

-- WM
if wm ~= nil then
	print(""
    ..magentaBright()
		.."   "
		..bold()
		..blue()
		.."WM"
		..reset()
		..": "
		..string.rep(" ", 16 - 8)
		..wm)
end

-- CPU
if cpu ~= nil then
	local freq = (cpu.freq >= 1000)
		and ""..(cpu.freq / 1000).."GHz"
		or  ""..cpu.freq.."MHz"
	print(""
    ..magentaBright()
		.."   "
		..bold()
		..blue()
		.."CPU"
		..reset()
		..": "
		..string.rep(" ", 16 - 9)
		..cpu.name
		.." ("
		..cpu.cores
		..") @ "
		..freq)
end

-- GPU
if gpus ~= nil then
	if #gpus ~= 1 then
		print(""
      ..magentaBright()
			.."   "
			..bold()
			..blue()
			.."GPUs"
			..reset()
			..": ")
		for _,gpu in pairs(gpus) do
			print(" - "..gpu.brand.." "..gpu.name)
		end
	else
		print(""
      ..magentaBright()
			.."   "
			..bold()
			..blue()
			.."GPU"
			..reset()
			..": "
			..string.rep(" ", 16 - 9)
			..gpus[1].brand
			.." "
			..gpus[1].name)
	end
end

--[[ Motherboard
if motherboard ~= nil then
	print(""
		.." 󰐿  "
		..bold()
		..blue()
		.."Board"
		..reset()
		..": "
		..string.rep(" ", 16 - 11)
		..motherboard.vendor
		.." "
		..motherboard.name)
end
]]--

-- Memory
if memory ~= nil then
	-- This memory math is probably inaccurate, but idk how to make it right ;-;
	print(""
    ..magentaBright()
		.."   "
		..bold()
		..blue()
		.."Memory"
		..reset()
		..": "
		..string.rep(" ", 16 - 12)
		..math.floor(memory.used / 1024)
		.."MB / "
		..math.floor(memory.max / 1024)
		.."MB")
end

-- Palette
print("")
print(""
	..blackBg()  .."  "
	..redBg()    .."  "
	..greenBg()  .."  "
	..yellowBg() .."  "
	..blueBg()   .."  "
	..magentaBg().."  "
	..cyanBg()   .."  "
	..whiteBg()  .."  "
	..reset())
print(""
	..blackBrightBg()  .."  "
	..redBrightBg()    .."  "
	..greenBrightBg()  .."  "
	..yellowBrightBg() .."  "
	..blueBrightBg()   .."  "
	..magentaBrightBg().."  "
	..cyanBrightBg()   .."  "
	..whiteBrightBg()  .."  "
	..reset())
