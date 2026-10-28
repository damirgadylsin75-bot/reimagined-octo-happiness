--!strict
-- Shape-preserving cubic Hermite interpolation, with zero tangent at extrema.
export type Point = { rpm: number, torque: number }
local Engine = {}
local function slope(a: Point, b: Point): number
    return (b.torque - a.torque) / (b.rpm - a.rpm)
end
local function tangent(points: {Point}, i: number): number
    if i == 1 then return slope(points[1], points[2]) end
    if i == #points then return slope(points[i-1], points[i]) end
    local d0 = slope(points[i-1], points[i])
    local d1 = slope(points[i], points[i+1])
    if d0 * d1 <= 0 then return 0 end
    local h0 = points[i].rpm - points[i-1].rpm
    local h1 = points[i+1].rpm - points[i].rpm
    local w1, w2 = 2*h1+h0, h1+2*h0
    return (w1+w2)/(w1/d0+w2/d1)
end
function Engine.torque(points: {Point}, rpm: number): number
    assert(#points >= 2, "torque curve requires at least two points")
    for i = 2, #points do assert(points[i].rpm > points[i-1].rpm, "rpm must be strictly increasing") end
    local first, last = points[1], points[#points]
    if rpm < first.rpm then return first.torque * math.clamp(rpm / first.rpm, 0, 1) end
    if rpm > last.rpm then return last.torque * math.clamp(1 - (rpm-last.rpm)/1000, 0, 1) end
    for i = 1, #points-1 do
        local a, b = points[i], points[i+1]
        if rpm <= b.rpm then
            local h = b.rpm-a.rpm
            local t = (rpm-a.rpm)/h
            local t2, t3 = t*t, t*t*t
            return (2*t3-3*t2+1)*a.torque + (t3-2*t2+t)*h*tangent(points,i)
                + (-2*t3+3*t2)*b.torque + (t3-t2)*h*tangent(points,i+1)
        end
    end
    return last.torque
end
function Engine.powerKW(torque: number, rpm: number): number
    return torque * rpm * 2 * math.pi / 60000
end
return Engine
