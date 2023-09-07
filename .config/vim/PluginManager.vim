vim9script

# Constants
const PATH_DELIMITER = has("win32") ? ";" : ":"
const DATA_PATH = has("win32") ? expand("~/AppData/Local/calvim") : expand("~/.local/share/calvim")
const PLUGIN_DIRECTORY = has("win32") ? expand(DATA_PATH .. "/pack/downloads/opt") : expand(DATA_PATH .. "/pack/downloads/opt")

# Current state
var gitPath = ""
var valid = false
var cloneJobs = {}
var plugins = {}

exec $"set packpath+={DATA_PATH}"
exec $"set runtimepath+={DATA_PATH}"

def Dummy(_: any)
enddef

def IsGitInstalled(): bool
	var path = getenv("PATH")

	for dir in path->split(PATH_DELIMITER)
		if filereadable(dir .. "/git") || filereadable(dir .. "/git.exe")
			gitPath = dir .. (filereadable(dir .. "/git.exe") ? "/git.exe" : "/git")
			return true
		endif
	endfor

	return false
enddef

def GetGitPath(): string
	return gitPath
enddef

def GetRepositoryName(repoURL: string): string
	var parts = repoURL->split("/")

	return parts[parts->len() - 1]
enddef

def CloneFinished(index: number, code: number, handle: dict<any>): void
	var info = handle.job->job_info()

	if info.status == "fail"
		handle.code = 0xDEAD
	elseif info.status == "dead"
		handle.code = code
	endif

	cloneJobs->remove(index)

	handle.OnFinish(handle)
enddef

def CloneRepository(repoURL: string, targetDir: string, OnUpdate: func, OnFinish: func): bool
	if !valid
		echoerr "Tried to clone a repository without git installed, aborting."
		return false
	endif

	var targetName = GetRepositoryName(repoURL)
	var command = [
		GetGitPath(),
		"clone",
		"https://github.com/" .. repoURL,
		targetDir,
		"--depth=1"
	]

	var index = rand()

	var job = job_start(command, {
		exit_cb: (_ch, code) => {
			CloneFinished(index, code, cloneJobs[index])
		},
		callback: (_ch, line) => {
			var handle = cloneJobs[index]

			handle.lastLine = line
			handle.OnUpdate(handle)
		}
	})

	cloneJobs[index] = {
		job: job,
		code: -1,
		url: repoURL,
		name: targetName,
		lastLine: "",
		OnUpdate: OnUpdate,
		OnFinish: OnFinish
	}

	return false
enddef

export def AddPlugin(url: string, opts: dict<any>)
	var name = GetRepositoryName(url)

	plugins[name] = {
		name: name,
		url: url,
		opts: opts
	}
enddef

export def Install()
	for name in plugins->keys()
		var info = plugins->get(name, {})

		if !info->has_key("name") || !info->has_key("url")
			continue
		endif

		var finalDirectory = expand(PLUGIN_DIRECTORY .. "/" .. name)

		if isdirectory(finalDirectory) && isdirectory(finalDirectory .. "/.git") # Already installed
			if info.opts.autoload
				if info.opts->has_key("mod")
					silent! exec $"packadd {info.opts.mod}"
				endif

				if info.opts->has_key("rt")
					exec $"set rtp+={finalDirectory}/"
					silent! exec $"runtime {info.opts.rt}"
				endif
			endif

			continue
		endif

		CloneRepository(info.url, finalDirectory, Dummy, (handle) => {
			if info.opts.autoload
				if info.opts->has_key("mod")
					silent! exec $"packadd {info.opts.mod}"
				endif

				if info.opts->has_key("rt")
					exec $"set rtp+={finalDirectory}/"
					silent! exec $"runtime {info.opts.rt}"
				endif
			endif

			silent! plugins->remove(info.name)
		})
	endfor

	if cloneJobs->len() > 0
		echomsg $"Installing {cloneJobs->len()} plugins..."

		silent! while !cloneJobs->empty()
			sleep 200m
		endwhile
	endif
enddef

export def Init()
	if !IsGitInstalled()
		echoerr "Git is not installed or is not in the PATH! Please install git on your system to continue"
		finish
	endif

	valid = true
enddef

export def CanInstall(): bool
	return valid
enddef

