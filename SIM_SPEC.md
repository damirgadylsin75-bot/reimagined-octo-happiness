# Implemented simulation primitives

SI units are intended throughout. `constants` defines gravity 9.81 m/s², air density 1.225 kg/m³, timestep 1/120 s and 3.571 studs/m. A 2D vector has x/y components.

The engine's torque curve is a shape-preserving cubic Hermite interpolant with weighted harmonic-mean interior tangents and zero tangents at sign changes. RPM inputs below the first point ramp linearly from zero RPM; above the last point, torque ramps linearly to zero over 1000 RPM. Input RPM points must be strictly increasing. Power is torque × RPM × 2π / 60000 in kW. No engine state or vehicle integration exists yet.

**Русское резюме:** пока реализована только интерполяция момента и преобразование в мощность; это не симулятор заезда.
