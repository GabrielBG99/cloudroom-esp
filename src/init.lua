dofile('env.lua')

wifi.setmode(wifi.STATION)
wifi.sta.config(STATION_CFG)
wifi.sta.autoconnect(1)
wifi.sta.connect(function ()
    dofile('main.lua')
end)
