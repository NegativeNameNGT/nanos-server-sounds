local subscriptions = {}
Sound = {}

function sound:Subscribe(name, func)
    local id = self.index

    if not subscriptions[name] then
        subscriptions[name] = {}
    end

    table.insert(subscriptions[name], {func, id})
    return func
end

-- Unsubscribes from all subscribed Events in this class
function sound:Unsubscribe(name, func)
    if not subscriptions[name] then
        subscriptions[name] = {}
    end

    for k,v in ipairs(subscriptions[name]) do
        if v.func == func then
            table.remove(subscriptions, k)
        end
    end
end

function Sound.Subscribe(name, func)
  local id = "Global"

  if not subscriptions[name] then
      subscriptions[name] = {}
  end

  table.insert(subscriptions[name], {func, id})
  return func
end

-- Unsubscribes from all subscribed global Events in this class
function Sound.Unsubscribe(name, func)
  if not subscriptions[name] then
      subscriptions[name] = {}
  end

  for k,v in ipairs(subscriptions[name]) do
      if v.func == func then
          table.remove(subscriptions, k)
      end
  end
end

function InternalEventCall(name, id, args)
    if not subscriptions[name] then return end
    if args == nil then args = {} end
    for k,v in ipairs(subscriptions[name]) do
        if v[2] == id then
            v[1](table.unpack(args))
        end
    end
end