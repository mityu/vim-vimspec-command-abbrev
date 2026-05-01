" XXX: The thinca/vim-themis's ftplugin sets b:did_ftplugin.  Therefore if we
" use the b:did_ftplugin load guard ideom, this file may never be loaded...
" Ignore b:did_ftplugin for now, but can we truely allowed to do this...?
" if exists('b:did_ftplugin')
"   finish
" endif

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
