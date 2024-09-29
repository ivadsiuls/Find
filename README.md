# **Find** 🔎
Using the "." notation when referencing instance can cause various problems in the future, you want to this that, but you'll usually end up with something like this:
```lua
  -- really long, hard to read
  local whatever = workspace:WaitForChild("fo", 5):WaitForChild("ob", 5):WaitForChild("ar", 5)
  -- same thing, but a little bit better
  local whatever2 = workspace:FindFirstChild("what"):FindFirstChild("ever")
```
But when using **Find**, you will end up with something like this:

```lua
  local Find = require(Path.To.Find)

  local whatever = Find.pathWait(workspace, "fo/ob/ar", 5) -- very good, and readable
  local whatever2 = Find.path(workspace, "what/ever") -- even more readable
```
## Why **Find**?

**Find** removes the risk of trying to get an instance, but getting a property instead. Even if your instance isn't the same name as a property, Roblox might choose to add a property with that name. You can circumvent this by using the :FindFirstChild() method. However, this can variables hard to read, and just a pain.
With Find, you can use the *Find.path* and *Find.pathWait* functions, which makes reading variables way easier.




# Documentation

## Functions

**Find** is fairly simple, it has only 2 functions. Here's how to use them.

### *Find.path*

*Find.path* is super easy, and takes only 2 paramaters.

```lua
  -- 1st parameter: parent (any) -- the parent instance, usually a service or a folder, you'll use the path argument to search inside that folder.
  -- 2nd parameter: path (string) -- The path to your instance. Imagine just replacing the ".", with a "/". That's about it.

  function Find.path(parent: Instance, path: string): Instance -- returns your desired instance (if found)

  -- a valid Find.path would look something like this:

  local spawn: SpawnLocation = Find.path(workspace, "SpawnLocation")
```

### *Find.pathWait*

*Find.pathWait* takes 2 paramaters, and a 3rd optional one (but reccomended)

```lua
  -- 1st parameter: parent (any) -- the parent instance, usually a service or a folder, you'll use the path argument to search inside that folder.
  -- 2nd parameter: path (string) -- The path to your instance. Imagine just replacing the ".", with a "/". That's about it.
  -- 3rd parameter: waitTimeout (number/nil) (OPTIONAL) -- how much time it will wait for the instance. Set to nil for it to wait forever, until the instance is found.

  function Find.pathWait(parent: Instance, path: string, waitTimeout: number?): Instance -- returns your desired instance (if found)

  -- a valid Find.pathWait would look something like this:

  local RandomPartValue: NumberValue = Find.pathWait(workspace, "PartAddedOnRuntime/RandomPartValue", 5)
  RandomPartValue.Value = 5
```

## Warnings You Might Have

If  you use Find.path, or Find.path wait, you might run into a warning like this one:
```lua
    local SpawnLocation: SpawnLocation = Find.path(workspace, "SpawnLocation")
  
    SpawnLocation.TeamColor = BrickColor.Yellow()

    -- THE WARNING: Type 'Instance' could not be converted into 'YourType'
```
To fix this, you can use *type overriding*. You can do that by doing this:

```lua
  local SpawnLocation: SpawnLocation = Find.path(workspace, "SpawnLocation") :: SpawnLocation
  
  SpawnLocation.TeamColor = BrickColor.Yellow()

  -- Warning no longer appears.
```
