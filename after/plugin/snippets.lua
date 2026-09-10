local utils = require("almagest.utils")

utils.cfgplugin("luasnip", function(ls)
	local s = ls.snippet
	local t = ls.text_node
	local i = ls.insert_node
	local fmt = require("luasnip.extras.fmt").fmt

	-- Keybindings
	-- NOTE: Stolen from https://github.com/L3MON4D3/LuaSnip
	vim.cmd([[
    " press <Tab> to expand or jump in a snippet. These can also be mapped separately
    " via <Plug>luasnip-expand-snippet and <Plug>luasnip-jump-next.
    imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'
    " -1 for jumping backwards.
    inoremap <silent> <S-Tab> <cmd>lua require'luasnip'.jump(-1)<Cr>

    snoremap <silent> <Tab> <cmd>lua require('luasnip').jump(1)<Cr>
    snoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<Cr>

    " For changing choices in choiceNodes (not strictly necessary for a basic setup).
    imap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
    smap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
    ]])

	--[[
	vim.keymap.set({ "i", "s" }, "<C-E>", function()
		if ls.choice_active() then
			ls.change_choice(1)
		end
	end, { silent = true })
    --]]

	ls.config.setup({ update_events = "TextChangedI", enable_autosnippets = true })

	ls.add_snippets("typst", {
		s({ trig = "MK", snippetType = "autosnippet" }, { t("$"), i(1), t("$") }),
		s("be", { t({ "$", "  " }), i(1), t({ "", "$", "" }) }),
		s("bee", { t("$ "), i(1), t(" $") }),
	})

	ls.add_snippets("plaintex", {
		s({ trig = "MK", snippetType = "autosnippet" }, { t("$"), i(1), t("$") }),
		s("be", { t({ "$$", "    " }), i(1), t({ "", "$$", "" }) }),
		s("oo", { t("\\infty ") }),
		s("-", { t("\\setminus ") }),
		s({ trig = "lrl", snippetType = "autosnippet" }, { t("\\{"), i(1), t("\\}") }),
		s({ trig = "LRL", snippetType = "autosnippet" }, { t("\\left\\{"), i(1), t("\\right\\}") }),
		s({ trig = "lrr", snippetType = "autosnippet" }, { t("("), i(1), t(")") }),
		s({ trig = "LRR", snippetType = "autosnippet" }, { t("\\left("), i(1), t("\\right)") }),
		s({ trig = "lrb", snippetType = "autosnippet" }, { t("\\\\{"), i(1), t("\\\\}") }),
		s({ trig = "LRB", snippetType = "autosnippet" }, { t("\\left\\\\{"), i(1), t("\\right\\\\}") }),
		s({ trig = "lrs", snippetType = "autosnippet" }, { t("["), i(1), t("]") }),
		s({ trig = "LRS", snippetType = "autosnippet" }, { t("\\left["), i(1), t("\\right]") }),
		s({ trig = "lra", snippetType = "autosnippet" }, { t("\\langle"), i(1), t("\\rangle") }),
		s({ trig = "LRA", snippetType = "autosnippet" }, { t("\\left\\langle"), i(1), t("\\right\\rangle") }),
		s({ trig = "abs", snippetType = "snippet" }, { t("|"), i(1), t("|") }),
		s({ trig = "ABS", snippetType = "autosnippet" }, { t("\\left|"), i(1), t("\\right|") }),
	})

	ls.add_snippets("tex", {
		s({ trig = "MK", snippetType = "autosnippet" }, { t("$"), i(1), t("$") }),
		s(
			{ trig = "beg" },
			fmt(
				[[
                \begin{{{env_name}}}
                    {env_body}
                \end{{{env_name}}}
                ]],
				{
					env_name = i(1),
					env_body = i(2),
				},
				{ repeat_duplicates = true }
			)
		),
		s(
			{ trig = "eq" },
			fmt(
				[[
                \begin{{equation}}\label{{{label_name}}}
                    {env_body}
                \end{{equation}}
                ]],
				{
					label_name = i(1),
					env_body = i(2),
				},
				{ repeat_duplicates = true }
			)
		),
		s("be", { t({ "\\[", "    " }), i(1), t({ "", "\\]", "" }) }),
		s("oo", { t("\\infty ") }),
		s("-", { t("\\setminus ") }),
		s({ trig = "lrl", snippetType = "autosnippet" }, { t("\\{"), i(1), t("\\}") }),
		s({ trig = "LRL", snippetType = "autosnippet" }, { t("\\left\\{"), i(1), t("\\right\\}") }),
		s({ trig = "lrr", snippetType = "autosnippet" }, { t("("), i(1), t(")") }),
		s({ trig = "LRR", snippetType = "autosnippet" }, { t("\\left("), i(1), t("\\right)") }),
		s({ trig = "lrb", snippetType = "autosnippet" }, { t("\\\\{"), i(1), t("\\\\}") }),
		s({ trig = "LRB", snippetType = "autosnippet" }, { t("\\left\\\\{"), i(1), t("\\right\\\\}") }),
		s({ trig = "lrs", snippetType = "autosnippet" }, { t("["), i(1), t("]") }),
		s({ trig = "LRS", snippetType = "autosnippet" }, { t("\\left["), i(1), t("\\right]") }),
		s({ trig = "lra", snippetType = "autosnippet" }, { t("\\langle"), i(1), t("\\rangle") }),
		s({ trig = "LRA", snippetType = "autosnippet" }, { t("\\left\\langle"), i(1), t("\\right\\rangle") }),
		s({ trig = "abs", snippetType = "snippet" }, { t("|"), i(1), t("|") }),
		s({ trig = "ABS", snippetType = "autosnippet" }, { t("\\left|"), i(1), t("\\right|") }),
	})

	ls.add_snippets("vesti", {
		s({ trig = "MK", snippetType = "autosnippet" }, { t("$"), i(1), t("$") }),
		s("be", { t({ "$$", "    " }), i(1), t({ "", "$$", "" }) }),
		s("eq", { t({ "#eq (" }), i(1), t({ ") {", "    " }), i(2), t({ "", "}", "" }) }),
	})

	ls.add_snippets("c", {
		s(
			"header",
			fmt(
				[[
        #ifndef {header_specifier}
        #define {header_specifier}

        {start_pos}

        #endif // {header_specifier}
        ]],
				{ header_specifier = i(1), start_pos = i(0) },
				{ repeat_duplicates = true }
			)
		),
	})

	ls.add_snippets("cpp", {
		s(
			"header",
			fmt(
				[[
        #ifndef {header_specifier}
        #define {header_specifier}

        {start_pos}

        #endif // {header_specifier}
        ]],
				{ header_specifier = i(1), start_pos = i(0) },
				{ repeat_duplicates = true }
			)
		),
		s(
			"namespace",
			fmt(
				[[
        namespace {namespace_specifier} {{

        {start_pos}

        }} // END OF NAMESPACE {namespace_specifier}
        ]],
				{ namespace_specifier = i(1), start_pos = i(0) },
				{ repeat_duplicates = true }
			)
		),
	})

	ls.add_snippets("cmake", {
		s(
			{ trig = "__cmakeinit", snippetType = "autosnippet" },
			fmt(
				[[
        cmake_minimum_required(VERSION {cmake_version})
        project({project_name}
            VERSION     {project_version}
            DESCRIPTION "{project_description}")

        # Define C and C++ standard
        set(CMAKE_C_STANDARD 11)
        set(CMAKE_CXX_STANDARD 20)

        set(CMAKE_C_EXTENSIONS ON)
        set(CMAKE_CXX_EXTENSIONS ON)

        # For the purpose to use LSP for C++
        set(CMAKE_EXPORT_COMPILE_COMMANDS Yes)

        # Change binary location into the bin directory
        set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${{CMAKE_BINARY_DIR}}/bin)

        # Include FetchContent
        include(FetchContent)

        function(fetch_git name repo tag)
          FetchContent_Declare(
            ${{name}}
            GIT_REPOSITORY ${{repo}}
            GIT_TAG ${{tag}}
          )
          FetchContent_MakeAvailable(${{name}})
        endfunction()

        # Examples
        #fetch_git(fmt https://github.com/fmtlib/fmt.git v12.1.0)
        #fetch_git(nlohmann_json https://github.com/nlohmann/json.git v3.12.0)
        #fetch_git(ftxui https://github.com/ArthurSonzogni/FTXUI.git v6.1.9)

        # this special phantom library is used only for passing compiler flags
        add_library(common_flags INTERFACE)
        target_compile_options(common_flags INTERFACE
            -Wall -Wextra -Wpedantic
            $<$<CONFIG:Release>:-O3>
            $<$<CONFIG:Debug>:-O0 -ggdb>
            $<$<CONFIG:RelWithDebInfo>:-O2 -g>
            $<$<CONFIG:MinSizeRel>:-Os>
        )

        set({project_name}_SRCS 
            src/main.cc
        )
        set({project_name}_LIBS 
            src/lib.cxx # module extension. (one can also use legacy cpp files)
        )
        # file(GLOB {project_name}_SRCS CONFIGURE_DEPENDS "./src/*.cc")

        add_library({project_name}_lib)
        target_sources({project_name}_lib 
            PUBLIC FILE_SET CXX_MODULES FILES ${{{project_name}_LIBS}})
        add_executable({project_name} ${{{project_name}_SRCS}})
        target_link_libraries({project_name} PRIVATE
            common_flags
            {project_name}_lib
        )
        ]],
				{
					cmake_version = i(1),
					project_name = i(2),
					project_version = i(3),
					project_description = i(4),
				},
				{ repeat_duplicates = true }
			)
		),
		s(
			{ trig = "__FetchContent", snippetType = "autosnippet" },
			fmt(
				[[
        FetchContent_Declare(
            {pkg_name}
            GIT_REPOSITORY {git_repo}
            GIT_TAG {git_tag})
        FetchContent_MakeAvailable({pkg_name})
        ]],
				{
					pkg_name = i(1),
					git_repo = i(2),
					git_tag = i(3),
				},
				{ repeat_duplicates = true }
			)
		),
	})

	ls.add_snippets("meson", {
		s(
			{ trig = "__mesoninit", snippetType = "autosnippet" },
			fmt(
				[[
            project(
              '{project_name}',
              'c',
              license: ['MIT'],
              version: '{project_version}',
              meson_version: '>={meson_version}',
              default_options: [
                  'buildtype=debugoptimized',
                  'b_lundef=false',
                  'b_lto=true',
                  'b_pie=true',
                  'c_std=gnu11',
                  'warning_level=1',
              ]
            )

            # build_root = meson.project_build_root()
            # source_root = meson.project_source_root()

            # ncurses = dependency('libncurses')
            # cjson = dependency('libcjson')

            sources = files(
                'src/main.c'
            )

            executable('{project_name}', sources
            # dependencies: [ncurses, cjson],
            )
            ]],
				{
					project_name = i(1),
					project_version = i(2),
					meson_version = i(3),
				},
				{ repeat_duplicates = true }
			)
		),
	})

	ls.add_snippets("nix", {
		s(
			{ trig = "__nixinit", snippetType = "autosnippet" },
			fmt(
				[[
            with import <nixpkgs> {{}};

            pkgs.mkShell {{
              buildInputs = [ pkgs.fish ];
              shellHook = ''
                exec fish
              '';

              nativeBuildInputs = with pkgs; [
                {pkgs}
              ];
            }}
            ]],
				{
					pkgs = i(1),
				},
				{ repeat_duplicates = true }
			)
		),
	})
end)
