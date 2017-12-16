proc == obj

is_today = -> (date) { Date.current === date }
is_today === Date.current
is_today === Date.tomorrow #=>false
is_today === Date.yesterday #=>false

