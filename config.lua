--[[ configuration script for luafcgid ]]--

-- port or socket path to listen to
listen = ":9000"
--listen = "/var/tmp/luafcgid.socket"

-- number of worker threads
workers = 3

-- max number of Lua VM states (Note this value needs to be larger then or equal to "workers")
states = 5

-- number of clones of each script allowed
clones = states

-- housekeeping sweep cycle in milliseconds
sweep = 1000

-- number of search cycles before creating
-- a new Lua VM state for a requested script
retries = 1

-- max POST size allowed
maxpost = 1024 * 1024

-- full or relative path to logfile
logfile = "luafcgid.log"
