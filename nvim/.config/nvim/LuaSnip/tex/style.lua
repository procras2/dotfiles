return {
    -- Combining text and insert nodes to create basic LaTeX commands
    s({ trig = "tt", dscr = "Expands 'tt' into '\texttt{}'" }, {
        t("\\texttt{"), -- remember: backslashes need to be escaped
        i(1),
        t("}"),
    }),
    -- ti textit,
    s({ trig = "ti", dscr = "Expands 'ti' into '\textit{}'" }, {
        t("\\textit{"), -- remember: backslashes need to be escaped
        i(1),
        t("}"),
    }),
    -- tb textbf
    s({ trig = "tb", dscr = "Expands 'tb' into '\textbf{}'" }, {
        t("\\textbf{"), -- remember: backslashes need to be escaped
        i(1),
        t("}"),
    }),
    -- tl textsl
    s({ trig = "tl", dscr = "Expands 'tl' into '\textsl{}'" }, {
        t("\\textsl{"), -- remember: backslashes need to be escaped
        i(1),
        t("}"),
    }),
    -- ts textsc
    s({ trig = "ts", dscr = "Expands 'ts' into '\textsc{}'" }, {
        t("\\textsc{"), -- remember: backslashes need to be escaped
        i(1),
        t("}"),
    }),
}
