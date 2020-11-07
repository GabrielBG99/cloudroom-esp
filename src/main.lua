function processResponse(data)
    function control(pin, value, digital)
        if digital then
            gpio.mode(pin, gpio.OUTPUT)
            gpio.write(pin, value == "ON" and gpio.HIGH or gpio.LOW)
        elseif pin >= 1 and pin <= 12 then
            pwm.setup(pin, 500, 0)
            pwm.start(pin)
            pwm.setduty(pin, tonumber(value))
        end
    end

    content = sjson.decode(data)
    for i = 1, #content do
        control(content[i]["number"], content[i]["value"], content[i]["is_digital"])
    end
end

function main()
    http.get(ENV_CLOUDROOM_URL, ENV_CLOUDROOM_HEADER, function(code, data)
        if code < 0 then
            print 'Error'
        else
            processResponse(data)
        end
        main()
    end)
end

main()