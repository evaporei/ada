local Stack = {}
Stack.__index = Stack

function Stack.new()
    local self = {}

    self.items = {}

    setmetatable(self, Stack)
    return self
end

function Stack:push(item)
    table.insert(self.items, item)
end

function Stack:pop()
    return table.remove(self.items, #self.items)
end

function Stack:peek()
    return self.items[#self.items]
end

function Stack:__len()
    return #self.items
end

function Stack:size()
    return #self
end

local stack = Stack.new()
print('empty', #stack)
stack:push(1)
stack:push(2)
stack:push(3)
print('full', #stack)
print(stack:pop())
print(stack:pop())
print(stack:pop())
print('empty again', #stack)
