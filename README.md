# <span style="font-family: Arial; font-size: 2em;">ZIPLINES</span>

<span style="font-family: Arial; font-size: 1.5em;">OVERVIEW</span><br>
This system is a comprehensive suite of scripts specifically to developers in need of a unique zipline system. This system will allow you to efforlessly construct bezier curves, leveraging easings such as quad or cubic for smooth interpolation.

## <span style="font-family: Arial; font-size: 1.5em;">FEATURES</span><br>
<strong>CURVE GENERATION</strong><br>
Provides a satisfiying animation while making the bezier curve, can be modified with the easing and points.

<strong>ZIPLINE FUNCTIONALITY</strong><br>
Provides a dynamic zipline path as the players traverse to the end of the customizable bezier curve.

<strong>MODULAR DESIGN</strong><br>
Provides a modular system that is flexable enough for developers to create and customize multiple zipline paths.

<strong>PLAYER INTERACTION</strong><br>
Engages the players with interactive prompts, allowing them to trigger zipline paths and and moving with the bezier path.

<strong>SIMPLE INTERGRATION</strong><br>
Quckly intergrate the system into your projecy, streamlining the implementation of zipline mechanics.

## <span style="font-family: Arial; font-size: 1.5em;">SETUP</span><br>
<strong>1. USE A ROBLOX PROJECT</strong><br>
Make a new roblox project or use your current project.<br> 

<strong>2. SETUP THE FOLDERS</strong><br>
Add a folder in 'ServerScriptService' to organize your scripts.<br>
Then, add a two folders in 'Workspace' named 'curves' and 'points'.<br>
Now in the 'curves' folder, add as many folders as you want, but name it such as 'zip_1'. <br>
Same for the 'points' folder, add as many folders as you want, but name it such as 'quad_1' or 'cubic_1"<br>
Make sure to name them in order.

<strong>3. SETUP THE POINTS</strong><br>
Make the points (parts, models) in the 'quad_1' as 'a', 'b', and 'c'<br>
'a' should be a model ```(a = quad_1.a.a)```<br>
'c' should be a model ```(c = quad_1.c.c)```<br>
'b' should be a part.

As for the other folder, make the points (parts, models) in the 'cubic_1' as 'a', 'b', and 'c'<br>
'a' should be a model ```(a = cubic_1.a.a)```<br>
'd' should be a model ```(d = cubic_1.d.d)```<br>
'b' and 'c' should be a part.

If you want to make a new folder, follow these intructions.

<strong>4. IMPLEMENT THE MODULES</strong><br>
Then make a module called 'curves', and make sure it's parented in the folder (will change parent later).
Now, make a module called 'interpolation', and make sure it's parented by the curves module.

<strong>5. GENERATE WITH A SERVER SCRIPT</strong><br>
If you are done setting up the modules, now we'll use the module to spawn the zipline paths.<br>
Make a new server script in the folder we created.<br>
Then, add a variable in refrence to the module:
```lua
local CurveModule = require(script.curves)
```
After we made the variable, add a variable in refrence to the folders:
```lua
local Curves = workspace.curves
local Points = workspace.points
```
Now let's setup the functions for the module, so add a new function:
```lua
local Setup = function() 
end
```
We will use this function to spawn in the ziplines:
```lua
CurveModule.generate(Curves.zip_1, Points.cubic_1)
```
or
```lua
CurveModule.generate(Curves.zip_2, Points.quad_1)
```
The first paremeter of this function is to identify which folder to place the parts of the bezier curves in.<br>
The second paremeter of this function is to find the easing and the components.<br>
We could also use the coroutine function to spawn it at the same time:
```lua
coroutine.wrap(function() CurveModule.generate(Curves.zip_1, Points.cubic_1) end)()
coroutine.wrap(function() CurveModule.generate(Curves.zip_2, Points.quad_1) end)()
```
Now call the function:
```lua
Setup()
```
If we run it or play it, we should get our desired results.<br>
Here is the script if you just want to add the system to your game:
```lua
-- # Variables
local CurveModule = require(script.curves)
local Points = workspace.points
local Curves = workspace.curve

-- # Function
local Setup = function()
	coroutine.wrap(function() CurveModule.generate(Curves.zip_1, Points.cubic_1) end)()
	coroutine.wrap(function() CurveModule.generate(Curves.zip_2, Points.quad_1) end)()
	coroutine.wrap(function() CurveModule.generate(Curves.zip_3, Points.cubic_2) end)()
	coroutine.wrap(function() CurveModule.generate(Curves.zip_4, Points.quad_2) end)()
end

-- # Setup
Setup()
```
We are now finished with implementing the system! Enjoy.
