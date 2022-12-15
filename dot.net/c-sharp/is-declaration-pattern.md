# The Type Declaration Pattern

Instead of checking the type of an object, then casting it when the type is matching and afterwards using properties or methods of the object, with this pattern it is possible to check the type of an object and declare a new local variable with matching type in one step.

```c#
object greeting = "Hello, World!";
if (greeting is string message)
{
    Console.WriteLine(message.ToLower());
}
```
  
This pattern can also be used to check for null references like the following:

```c#
if (input is not null)
{
    // some code
}
```

-------------------------------------------
*[back to the main page](../../readme.md)*
