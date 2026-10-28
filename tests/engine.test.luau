local engine = require('../src/shared/core/engine')
local cars = require('../src/shared/config/cars')
return function(test)
    test('curve passes through data points', function()
        for _, car in cars do
            for _, p in car.torqueCurve do assert(math.abs(engine.torque(car.torqueCurve,p.rpm)-p.torque) < 1e-8) end
        end
    end)
    test('curve does not overshoot each segment', function()
        for _, car in cars do
            for i = 1, #car.torqueCurve-1 do
                local a,b = car.torqueCurve[i], car.torqueCurve[i+1]
                for j = 0,100 do
                    local v = engine.torque(car.torqueCurve, a.rpm+(b.rpm-a.rpm)*j/100)
                    assert(v >= math.min(a.torque,b.torque)-1e-8 and v <= math.max(a.torque,b.torque)+1e-8)
                end
            end
        end
    end)
    test('power and outside curve', function()
        assert(math.abs(engine.powerKW(100, 6000)-62.831853) < 0.001)
        assert(engine.torque(cars.hatch.torqueCurve, 0) == 0)
        assert(engine.torque(cars.hatch.torqueCurve, 7500) == 0)
    end)
    test('bad curve is rejected', function()
        assert(not pcall(engine.torque, {{rpm=1,torque=1},{rpm=1,torque=2}}, 1))
    end)
end
