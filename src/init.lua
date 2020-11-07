dofile('env.lua')

node.egc.setmode(node.egc.ON_ALLOC_FAILURE)
wifi.setmode(wifi.STATION)
wifi.sta.config(ENV_STATION_CFG)
wifi.sta.autoconnect(1)
wifi.sta.connect(function ()
    dofile('main.lua')
end)
