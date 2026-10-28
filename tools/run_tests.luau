local suites = { require('../tests/engine.test'), require('../tests/vec2.test') }
local passed, failed = 0, 0
local function test(name, fn)
    local ok, err = pcall(fn)
    if ok then passed += 1; print('PASS '..name)
    else failed += 1; warn('FAIL '..name..': '..tostring(err)) end
end
for _, suite in suites do suite(test) end
print(string.format('%d passed, %d failed', passed, failed))
assert(failed == 0, 'test failures')
