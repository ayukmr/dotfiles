-- =================
-- === GHCi Init ===
-- =================

-- set prompt
:set prompt      "\ESC[1m\ESC[35mghci\ESC[0m> "
:set prompt-cont "\ESC[1m\ESC[35mghci\ESC[0m* "

-- color string
red str     = "\ESC[31m" ++ str ++ "\ESC[0m"
green str   = "\ESC[32m" ++ str ++ "\ESC[0m"
yellow str  = "\ESC[33m" ++ str ++ "\ESC[0m"
blue str    = "\ESC[34m" ++ str ++ "\ESC[0m"
magenta str = "\ESC[35m" ++ str ++ "\ESC[0m"
cyan str    = "\ESC[36m" ++ str ++ "\ESC[0m"

-- format string
bold str      = "\ESC[1m" ++ str ++ "\ESC[22m"
italic str    = "\ESC[3m" ++ str ++ "\ESC[23m"
underline str = "\ESC[4m" ++ str ++ "\ESC[24m"
