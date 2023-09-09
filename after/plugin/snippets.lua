local utils = require("almagest.utils")

utils.cfgplugin("luasnip", function(ls)
	local s = ls.snippet
	local t = ls.text_node
	local i = ls.insert_node
	local fmt = require("luasnip.extras.fmt").fmt

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
	})

	ls.add_snippets("toml", {
		s(
			{ trig = "mkvocab", snippetType = "autosnippet" },
			fmt(
				[=[
    [[voca]]
    word = "{word}"

    [[voca.info]]
    meaning = "{meaning}"

    {exit}
    ]=],
				{ word = i(1, "word"), meaning = i(2, "meaning"), exit = i(0) }
			)
		),
		s(
			{ trig = "mkvocas", snippetType = "autosnippet" },
			fmt(
				[=[
    [[voca]]
    word = "{word}"

    [[voca.info]]
    meaning = "{meaning}"
    synos = [{synos}]

    {exit}
    ]=],
				{
					word = i(1, "word"),
					meaning = i(3, "meaning"),
					synos = i(2, "synos"),
					exit = i(0),
				}
			)
		),
		s(
			{ trig = "mkvocae", snippetType = "autosnippet" },
			fmt(
				[=[
    [[voca]]
    word = "{word}"

    [[voca.info]]
    meaning = "{meaning}"
    example = "{example}"

    {exit}
    ]=],
				{
					word = i(1, "word"),
					meaning = i(3, "meaning"),
					example = i(2, "example"),
					exit = i(0),
				}
			)
		),
		s(
			{ trig = "mkvocafull", snippetType = "autosnippet" },
			fmt(
				[=[
    [[voca]]
    word = "{word}"

    [[voca.info]]
    meaning = "{meaning}"
    synos = [{synos}]
    example = "{example}"

    {exit}
    ]=],
				{
					word = i(1, "word"),
					meaning = i(4, "meaning"),
					synos = i(2, "synos"),
					example = i(3, "example"),
					exit = i(0),
				}
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

        # For the purpose to use LSP for C++
        set(CMAKE_EXPORT_COMPILE_COMMANDS Yes)

        # Change binary location into the bin directory
        set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${{CMAKE_BINARY_DIR}}/bin)

        # Include FetchContent
        include(FetchContent)

        if(CMAKE_BUILD_TYPE STREQUAL "Release")
            set(COMPILER_FLAGS -O3 -Wall -Wextra -Wpedantic)
        elseif()
            set(COMPILER_FLAGS -O0 -ggdb -Wall -Wextra -Wpedantic)
        endif()

        file(GLOB {project_name}_SRC CONFIGURE_DEPENDS "./src/*.cc")

        add_executable({project_name} ${{{project_name}_SRC}})
        target_compile_options({project_name} PUBLIC ${{COMPILER_FLAGS}})
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
end)
