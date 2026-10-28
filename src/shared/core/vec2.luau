--!strict
export type Vec2 = { x: number, y: number }
local Vec2 = {}
function Vec2.new(x: number, y: number): Vec2 return { x = x, y = y } end
function Vec2.add(a: Vec2, b: Vec2): Vec2 return { x = a.x + b.x, y = a.y + b.y } end
function Vec2.scale(a: Vec2, s: number): Vec2 return { x = a.x * s, y = a.y * s } end
function Vec2.dot(a: Vec2, b: Vec2): number return a.x * b.x + a.y * b.y end
return Vec2
