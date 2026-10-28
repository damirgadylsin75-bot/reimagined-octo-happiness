--!strict
-- Preliminary data, not yet calibrated to race times. Torque in Nm, rpm in rev/min.
return {
    hatch = { name = "Hatch FWD", drive = "FWD", mass = 1050, wheelbase = 2.45, frontWeight = 0.60, revLimit = 6800, finalDrive = 4.1, gears = {3.5, 2.1, 1.4, 1.05, 0.85}, torqueCurve = {{rpm=1000, torque=110}, {rpm=3000, torque=160}, {rpm=4500, torque=170}, {rpm=6500, torque=140}} },
    coupe = { name = "Coupe RWD", drive = "RWD", mass = 1450, wheelbase = 2.7, frontWeight = 0.53, revLimit = 7200, finalDrive = 3.7, gears = {3.2, 2.0, 1.4, 1.0, 0.8}, torqueCurve = {{rpm=1000, torque=230}, {rpm=3000, torque=390}, {rpm=4500, torque=430}, {rpm=6800, torque=335}} },
    super = { name = "Super AWD", drive = "AWD", mass = 1550, wheelbase = 2.75, frontWeight = 0.47, revLimit = 8500, finalDrive = 3.9, gears = {3.1, 2.2, 1.6, 1.25, 1.0, 0.8}, torqueCurve = {{rpm=1000, torque=350}, {rpm=3500, torque=700}, {rpm=5500, torque=800}, {rpm=8000, torque=630}} },
}
