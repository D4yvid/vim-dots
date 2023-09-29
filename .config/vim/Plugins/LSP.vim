vim9script

var servers = [
	{
		name: 'clangd',
		filetype: ['c', 'cpp'],
		path: 'clangd',
		args: []
	},
	{
		name: 'phpls',
		filetype: ['php'],
		path: 'intelephense',
		args: ['--stdio']
	}
]

g:LspOptionsSet({
	autoComplete: true,
	autoHighlightDiags: true,
	completionKinds: {
		Text: ' Text',
		Method: ' Method',
		Function: ' Function',
		Constructor: ' Constructor',
		Field: ' Field',
		Variable: ' Variable',
		Class: ' Class',
		Interface: ' Interface',
		Module: ' Module',
		Property: ' Property',
		Unit: ' Unit',
		Value: ' Value',
		Enum: ' Enum',
		Keyword: ' Keyword',
		Snippet: ' Snippet',
		Color: ' Color',
		File: ' File',
		Reference: ' Reference',
		Folder: ' Folder',
		EnumMember: ' Enum Member',
		Constant: ' Constant',
		Struct: ' Struct',
		Event: ' Event',
		Operator: ' Operator',
		TypeParameter: ' Type Parameterr',
		Buffer: ' Text'
	},
	customCompletionKinds: true,
	diagSignErrorText: ' ',
	diagSignInfoText: ' ',
	diagSignHintText: ' ',
	diagSignWarningText: ' ',
	hideDisabledCodeActions: true,
	ignoreMissingServer: true,
	noNewlineInCompletion: true,
	showDiagInBalloon: false,
	showDiagInPopup: true,
	showDiagWithSign: true,
	showInlayHints: false,
	showSignature: true,
	snippetSupport: true,
	usePopupInCodeAction: true,
	useBufferCompletion: true
})

for server in servers
	g:LspAddServer([server])
endfor

def g:OnLspAttach()
	au CursorHold <buffer> silent! LspDiagCurrent
enddef

au CompleteDone * pclose
au User LspAttached g:OnLspAttach()
