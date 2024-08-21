-- local Base = require('base')
-- local inspect = require('inspect')

local Node = {}
Node.__index = Node

function Node.new(data, nxt)
    local self = {}

    self.data = data
    self.next = nxt

    setmetatable(self, Node)
    return self
end

local LinkedList = {}
LinkedList.__index = LinkedList

function LinkedList.new()
    local self = {}

    self.head = nil

    setmetatable(self, LinkedList)
    return self
end

function LinkedList:pushFront(data)
    local newNode = Node.new(data)
    newNode.next = self.head
    self.head = newNode
end

function LinkedList:pushBack(data)
    local curr = self.head
    if not curr then
        self.head = Node.new(data)
        return
    end
    while curr.next do
        curr = curr.next
    end
    curr.next = Node.new(data)
end

function LinkedList:removeFront()
    if self.head then
        self.head = self.head.next
    end
end

function LinkedList:removeBack()
    if not self.head then
        return
    end

    local prev, curr = nil, self.head
    while curr.next do
        prev = curr
        curr = curr.next
    end
    prev.next = nil
end

function LinkedList:__tostring()
    local s = '[ '

    local curr = self.head

    while curr do
        s = s .. tostring(curr.data) .. ' '
        curr = curr.next
    end

    return s .. ']'
end

local list = LinkedList.new()
list:pushBack('A')
list:pushBack('B')
list:pushBack('C')
list:pushBack('D')
list:pushFront('E')
-- E A B C D
print(tostring(list))
-- E A B C
list:removeBack()
print(tostring(list))
-- A B C
list:removeFront()
print(tostring(list))
