function! meteor#MeteorLoadRubyLib()
  let ruby_module = fnameescape(globpath(&runtimepath, 'autoload/meteor.rb'))
  exe 'rubyfile ' . ruby_module
endfunction

" switch js file to unit test or html template, using current buffer name
function! meteor#MeteorOpenAlternate(opener, type)
  " let alternate = system("meteor_find_alternate " . expand("%:p") . " " . a:type)
  " execute a:opener . " " . alternate
  ruby Meteor::find_alternate()
endfunction

" switch to template HTML file from supplied template name
function! meteor#MeteorOpenTemplate(opener, fragment)
  ruby Meteor::find_template()
endfunction

call meteor#MeteorLoadRubyLib()

nnoremap <leader>mU :call meteor#MeteorOpenAlternate("e", "test")<CR>
nnoremap <leader>mu :call meteor#MeteorOpenAlternate("vsplit", "test")<CR>
nnoremap <leader>mT :call meteor#MeteorOpenAlternate("e", "template")<CR>
nnoremap <leader>mt :call meteor#MeteorOpenAlternate("vsplit", "template")<CR>
nnoremap <leader>mh :call meteor#MeteorOpenTemplate("vsplit", "<C-R><C-W>")<CR>
nnoremap <leader>mH :call meteor#MeteorOpenTemplate("e", "<C-R><C-W>")<CR>
