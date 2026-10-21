" XXX: The thinca/vim-themis's ftplugin sets b:did_ftplugin.  Therefore if we
" use the b:did_ftplugin load guard ideom, this file may never be loaded...
" Ignore b:did_ftplugin for now, but can we truely allowed to do this...?
" if exists('b:did_ftplugin')
"   finish
" endif

let s:defined_abbrev_triggers = []

function s:command_abbrev(trigger, abbrev) abort
  if strpart(getline('.'), 0, col('.') - 1)->trim() ==# a:trigger
    return a:abbrev
  else
    return a:trigger
  endif
endfunction

function s:subcommand_abbrev(command, trigger, abbrev) abort
  if strpart(getline('.'), 0, col('.') - 1) =~? $'^\s*{a:command}\s\+{a:trigger}$'
    return a:abbrev
  else
    return a:trigger
  endif
endfunction

function s:try_one_by_one(trigger, list) abort
  for expr in a:list
    let abbrev = eval(expr)
    if abbrev !=# a:trigger
      return abbrev
    endif
  endfor
  return a:trigger
endfunction

function s:set_abbrev(trigger, expr) abort
  if maparg(a:trigger, 'i', v:true) ==# ''
    execute $'inoreabbrev <buffer> <expr> {a:trigger} {a:expr}'
    call add(s:defined_abbrev_triggers, a:trigger)
  endif
endfunction

function s:clear_abbrevs(triggers) abort
  eval a:triggers
    \->copy()
    \->map({ _, trigger -> $'iunabbrev <buffer> {trigger}' })
    \->execute()
endfunction

{{body}}

if exists('b:undo_ftplugin')
  let b:undo_ftplugin = ' | ' . b:undo_ftplugin
else
  let b:undo_ftplugin = ''
endif
let b:undo_ftplugin = $'call {expand('<SID>')}clear_abbrevs({string(s:defined_abbrev_triggers->sort()->uniq())})' . b:undo_ftplugin
unlet s:defined_abbrev_triggers
