" sioyek.vim
" Syntax file for Sioyek configuration files

if exists("b:current_syntax")
  finish
endif

" taken from https://github.com/fladson/vim-kitty/blob/main/syntax/kitty.vim

" syn region sioyekKeybind start=' ' end=' ' contains=sioyekActionKW contained nextgroup=sioyekKey,sioyekKeyComb,sioyekActionKW
syn region sioyekString start=+'+ skip=+\\\\\|\\'+ end=+'+ oneline
syn spell notoplevel

" the order here matters
syn match sioyekSt '.*$' contains=sioyekNumber,sioyekColor
" sioyekColor matchin doesn't work for some reason
syn match sioyekNumber '\s[+-]\?\d\+\.\?\d*' contained
syn match sioyekColor '\(\d\.\?\d*\s\+\)\{2}\d\.\?\d*' contained
" syn match sioyekKW '^\s*\S*' contains=sioyekKeyword,sioyekInvalidKeyword nextgroup=sioyekSt
syn match sioyekInclude '^\s*source' display
" syn match sioyekMap '^\s*' nextgroup=sioyekKeybind
" syn match sioyekInvalidKeyword '\S*' contained
syn match sioyekInvalidKeyword '\S*'
" syn match sioyekActionKW '\s*\S*' contains=sioyekAction,sioyekEvent,sioyekInvalidAction
" syn match sioyekInvalidAction '\S*' contained
syn match sioyekComment /^\s*#.*$/ contains=sioyekTodo,@Spell,sioyekAction,sioyekKeyword

hi def link sioyekAction Function
hi def link sioyekColor Number
hi def link sioyekComment Comment
hi def link sioyekContinue sioyekSt
hi def link sioyekEvent Function
hi def link sioyekInclude Include
hi def link sioyekInvalidAction Error
hi def link sioyekInvalidKeyword Error
hi def link sioyekKeybind Constant
hi def link sioyekKeyword Keyword
hi def link sioyekMap Keyword
hi def link sioyekNumber Number
hi def link sioyekString String
hi def link sioyekTodo Todo
hi def link sioyekUnit Type

syn keyword sioyekTodo contained TODO FIXME XXX contained

" from the default preference config, extract all options
" sed -n '/^[^#]/ {/^[[:space:]]*$/! { s/^\s*\(\S\+\).*/\\ \1/; p }}' sioyek/prefs.config 
" pref releated keywords `sioyekKeyword` {{{
" syn keyword sioyekKeyword contained
syn keyword sioyekKeyword nextgroup=sioyekSt
\ check_for_updates_on_startup
\ use_legacy_keybinds
\ background_color
\ dark_mode_background_color
\ dark_mode_contrast
\ text_highlight_color
\ visual_mark_color
\ search_highlight_color
\ link_highlight_color
\ synctex_highlight_color
\ search_url_s
\ search_url_l
\ search_url_g
\ middle_click_search_engine
\ shift_middle_click_search_engine
\ zoom_inc_factor
\ vertical_move_amount
\ horizontal_move_amount
\ move_screen_ratio
\ flat_toc
\ should_use_multiple_monitors
\ should_load_tutorial_when_no_other_file
\ should_launch_new_instance
\ should_launch_new_window
\ inverse_search_command
\ visual_mark_next_page_fraction
\ visual_mark_next_page_threshold
\ should_draw_unrendered_pages
\ rerender_overview
\ overview_size
\ overview_offset
\ linear_filter
\ default_dark_mode
\ sort_bookmarks_by_location
\ shared_database_path
\ ui_font
\ font_size
\ startup_commands
\ custom_background_color
\ custom_text_color
\ wheel_zoom_on_cursor
\ status_bar_color
\ status_bar_text_color
\ status_bar_font_size
\ single_main_window_size
\ single_main_window_move
\ main_window_size
\ main_window_move
\ helper_window_size
\ helper_window_move
\ touchpad_sensitivity
\ page_separator_width
\ page_separator_color
\ fit_to_page_width_ratio
\ collapsed_toc
\ ruler_mode
\ ruler_padding
\ ruler_x_padding
\ force_custom_line_algorithm
\ paper_folder_path
\ enable_experimental_features
\ create_table_of_contents_if_not_exists
\ max_created_toc_size
\ should_warn_about_user_key_override
\ single_click_selects_words
\ item_list_prefix
\ ignore_whitespace_in_presentation_mode
\ show_doc_path
\ multiline_menus
\ prerender_next_page_presentation
\ shift_click_command
\ control_click_command
\ alt_click_command
\ shift_right_click_command
\ control_right_click_command
\ alt_right_click_command
\ highlight_middle_click
\ super_fast_search
\ case_sensitive_search
\ highlight_color_a
\ highlight_color_b
\ highlight_color_c
\ highlight_color_d
\ highlight_color_e
\ highlight_color_f
\ highlight_color_g
\ highlight_color_h
\ highlight_color_i
\ highlight_color_j
\ highlight_color_k
\ highlight_color_l
\ highlight_color_m
\ highlight_color_n
\ highlight_color_o
\ highlight_color_p
\ highlight_color_q
\ highlight_color_r
\ highlight_color_s
\ highlight_color_t
\ highlight_color_u
\ highlight_color_v
\ highlight_color_w
\ highlight_color_x
\ highlight_color_y
\ highlight_color_z
\ new_command
" }}}

" command related keywords `sioyekAction` {{{
" syn keyword sioyekAction contained
syn keyword sioyekAction
\ goto_beginning
\ goto_end
\ goto_page_with_page_number
\ goto_left
\ goto_right
\ goto_top_of_page
\ goto_bottom_of_page
\ goto_left_smart
\ goto_right_smart
\ move_down
\ move_up
\ move_left
\ move_right
\ next_page
\ previous_page
\ screen_down
\ screen_up
\ next_chapter
\ prev_chapter
\ pop_state
\ prev_state
\ new_window
\ close_window
\ goto_window
\ next_state
\ goto_toc
\ zoom_in
\ fit_to_page_width
\ zoom_out
\ zoom_in_cursor
\ zoom_out_cursor
\ rotate_clockwise
\ rotate_counterclockwise
\ fit_to_page_width
\ fit_to_page_width_smart
\ fit_to_page_height
\ fit_to_page_height_smart
\ fit_to_page_width_ratio
\ open_document
\ open_document_embedded
\ open_document_embedded_from_current_path
\ open_prev_doc
\ open_last_document
\ enter_visual_mark_mode
\ move_visual_mark_up
\ move_visual_mark_down
\ move_visual_mark_up
\ move_visual_mark_down
\ toggle_horizontal_scroll_lock
\ search
\ chapter_search
\ next_item
\ previous_item
\ add_bookmark
\ delete_bookmark
\ goto_bookmark
\ goto_bookmark_g
\ add_highlight
\ goto_highlight
\ goto_highlight_g
\ delete_highlight
\ set_select_highlight_type
\ add_highlight_with_current_type
\ toggle_select_highlight
\ goto_next_highlight
\ goto_prev_highlight
\ goto_next_highlight_of_type
\ goto_prev_highlight_of_type
\ set_mark
\ goto_mark
\ portal
\ delete_portal
\ goto_portal
\ edit_portal
\ toggle_window_configuration
\ toggle_one_window
\ copy
\ toggle_fullscreen
\ toggle_highlight
\ command
\ external_search
\ open_selected_url
\ toggle_dark_mode
\ toggle_custom_color
\ toggle_synctex
\ synctex_under_cursor
\ toggle_mouse_drag_mode
\ toggle_visual_scroll
\ overview_definition
\ goto_definition
\ portal_to_definition
\ toggle_presentation_mode
\ quit
\ open_link
\ keyboard_select
\ keyboard_smart_jump
\ keyboard_overview
\ next_preview
\ previous_preview
\ goto_overview
\ portal_to_overview
\ goto_selected_text
\ focus_text
\ smart_jump_under_cursor
\ overview_under_cursor
\ visual_mark_under_cursor
\ close_overview
\ close_visual_mark
\ import
\ export
\ execute
\ execute_predefined_command
\ embed_annotations
\ copy_window_size_config
\ prefs
\ prefs_user
\ prefs_user_all
\ keys
\ keys_user
\ keys_user_all
\ enter_password
\ toggle_fastread
\ toggle_statusbar
\ reload
\ set_status_string
\ clear_status_string
\ toggle_titlebar
" }}}

let b:current_syntax = "sioyek"
