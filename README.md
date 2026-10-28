# Drag2D — early simulation foundation

This repository is **not yet a playable game**. It contains preliminary vehicle data and a pure-Luau, shape-preserving torque curve implementation. See [LIMITATIONS.md](LIMITATIONS.md) before using the project.

## Build and test

1. Install [Aftman](https://github.com/LPGhatguy/aftman) and run `aftman install` to install Rojo.
2. `mkdir -p build && rojo build -o build/drag2d.rbxlx` builds the place. Open it in Roblox Studio; the place currently has no gameplay. Alternatively use `rojo serve` and connect the Rojo Studio plugin.
3. Install the standalone [Luau CLI](https://github.com/luau-lang/luau) and run `luau tools/run_tests.luau`.

Car data is in `src/shared/config/cars.luau`: masses are kg, torque points Nm and RPM. These are starting values, not validated race balance. Torque and power share the functions in `src/shared/core/engine.luau`.

**По-русски:** это только начальные данные и кривая момента, не готовая игра. Гоночная физика, интерфейс и сохранения ещё не реализованы.
